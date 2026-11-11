# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRUBIT_COMMIT="25d2c01bde904c3333bb2d48201e5cbb186a1c7f"
CRATES="
	aho-corasick@1.1.5
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.104
	autocfg@1.5.1
	base64@0.22.1
	bitflags@2.13.1
	camino@1.2.5
	cargo-platform@0.3.3
	cargo_metadata@0.23.1
	cc@1.4.4
	cfg-if@1.0.4
	clap-cargo@0.18.3
	clap@4.6.7
	clap_builder@4.6.7
	clap_derive@4.6.7
	clap_lex@1.1.0
	colorchoice@1.0.5
	either@1.18.0
	errno@0.3.14
	fastrand@2.5.0
	find-msvc-tools@0.1.11
	flagset@0.4.7
	futures-channel@0.3.34
	futures-core@0.3.34
	futures-executor@0.3.34
	futures-io@0.3.34
	futures-macro@0.3.34
	futures-sink@0.3.34
	futures-task@0.3.34
	futures-timer@3.0.4
	futures-util@0.3.34
	futures@0.3.34
	getrandom@0.4.3
	googletest@0.14.3
	googletest_macro@0.14.3
	heck@0.5.0
	indenter@0.3.4
	is_terminal_polyfill@1.70.2
	itertools@0.13.0
	itoa@1.0.18
	jobserver@0.1.35
	libc@0.2.189
	linux-raw-sys@0.12.1
	memchr@2.8.3
	num-traits@0.2.19
	object@0.36.7
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	open-enum-derive@0.5.3
	open-enum@0.5.3
	phf@0.11.3
	phf_generator@0.11.3
	phf_macros@0.11.3
	phf_shared@0.11.3
	pin-project-lite@0.2.17
	proc-macro2@1.0.107
	quote@1.0.47
	r-efi@6.0.0
	rand@0.8.8
	rand_core@0.6.4
	regex-automata@0.4.18
	regex-syntax@0.8.11
	regex@1.13.1
	rstest@0.16.0
	rstest_macros@0.16.0
	rustc-stable-hash@0.1.2
	rustc_version@0.4.1
	rustix@1.1.4
	rustversion@1.0.23
	semver@1.0.28
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	shlex@2.0.1
	siphasher@1.0.3
	slab@0.4.12
	static_assertions@1.1.0
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.119
	syn@3.0.4
	tempfile@3.27.0
	thiserror-impl@2.0.20
	thiserror@2.0.20
	unicode-ident@1.0.27
	utf8parse@0.2.2
	windows-link@0.2.1
	windows-sys@0.61.2
	zmij@1.0.23"

LLVM_COMPAT=( 23 )
PYTHON_COMPAT=( python3_{11..15} )
RUST_MIN_VER="1.99.0"
RUST_MAX_VER="${RUST_MIN_VER}"
RUST_NEED_LLVM="1"

inherit cargo edo flag-o-matic llvm-r2 python-any-r1 rust

DESCRIPTION="A bidirectional bindings generator for C++ and Rust"
HOMEPAGE="https://crubit.rs/"
SRC_URI="
	https://github.com/google/crubit/archive/${CRUBIT_COMMIT}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 BSD MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}=
		llvm-core/llvm:${LLVM_SLOT}=
	')
	dev-cpp/abseil-cpp
	>=dev-libs/protobuf-36.1
"
DEPEND="${RDEPEND}"
BDEPEND="${PYTHON_DEPS}"

S="${WORKDIR}/${PN}-${CRUBIT_COMMIT}"

PATCHES=(
	"${FILESDIR}"/crubit-0.20261031-filter-absl-libs.patch
	"${FILESDIR}"/crubit-0.20261031-libclang-cpp.patch
	"${FILESDIR}"/crubit-0.20261031-llvm23.patch
)

pkg_setup() {
	python-any-r1_pkg_setup
	rust_pkg_setup
}

src_compile() {
	local -x RUSTC_BOOTSTRAP=1
	local -x ABSL_INCLUDE_PATH="${ESYSROOT}/usr/include"
	local -x ABSL_LIB_STATIC_PATH="${ESYSROOT}/usr/$(get_libdir)"
	local -x CLANG_INCLUDE_PATH="$(llvm-config --includedir)"
	local -x CLANG_LIB_STATIC_PATH="$(llvm-config --libdir)"
	local -x PROTOBUF_INCLUDE_PATH="${ESYSROOT}/usr/include,${WORKDIR}/proto-headers"
	local -x PROTOBUF_LIB_STATIC_PATH="${ESYSROOT}/usr/$(get_libdir)"
	local -x PROTOC="$(type -P protoc)"

	append-cxxflags "-DCRUBIT_LLVM_DEV_DATE=20261019"
	append-ldflags "-L$(llvm-config --libdir)"
	append-ldflags "-Wl,-rpath,$(${RUSTC} --print sysroot)/lib"

	edo ${EPYTHON} cargo/build/generate_proto_headers.py \
		--protoc="${PROTOC}" --out_dir="${WORKDIR}/proto-headers"

	cargo_src_compile --package cc_bindings_from_rs --package rs_bindings_from_cc
}

src_install() {
	local libdir="usr/$(get_libdir)/${PN}"

	into "${libdir}"
	dobin target/release/cc_bindings_from_rs
	dobin target/release/rs_bindings_from_cc

	insinto "${libdir}/lib/third_party/crubit"
	doins BUILD.gn crubit.gni
	doins -r support
}
