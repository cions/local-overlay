# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

BUN_VENDOR=(
	"boringssl oven-sh/boringssl 41bf9b59c2ebf277a7aa427e1ecad5cc80dd4d4f"
	"brotli google/brotli db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
	"cares c-ares/c-ares c7a3138dcfe3bb0eaaf10c0c24c36dc66dc790ab"
	"hdrhistogram HdrHistogram/HdrHistogram_c 18c7a324383dded1451d15621cd018b0048057d0"
	"highway google/highway 2607d3b5b0113992fe84d3848859eae13b3b52c1"
	"libarchive libarchive/libarchive 27cbc7827172698143e440801fc0ba39ccb4f1f5"
	"libdeflate ebiggers/libdeflate 92e6a0db9fa848d742f9eb286c92afc60f2c3dda"
	"libjpeg-turbo libjpeg-turbo/libjpeg-turbo c85e6b905bf237038faa936dab160ebfc5da0344"
	"libspng randy408/libspng fb768002d4288590083a476af628e51c3f1d47cd"
	"libwebp webmproject/libwebp b7e29b9d75bd31422b00c2a446d49d7af06c328d"
	"lolhtml oven-sh/lol-html 725ce499aa9b71e38b7a2d0a9fbb6d7294a4079e"
	"lshpack litespeedtech/ls-hpack cf0f70dd10b352194c97448eb5d00b4aa484f531"
	"lsqpack litespeedtech/ls-qpack 91567706c41c0d97ab8dc576873ecd472d7869fa"
	"lsquic litespeedtech/lsquic f812ceb9529e26717df78c6064a2ff648b949f3e"
	"mimalloc oven-sh/mimalloc 92ef6587c57b262f6e6abf513f7776a2f8d12aeb"
	"picohttpparser h2o/picohttpparser f4d94b48b31e0abae029ebeafcfd9ca0680ede58"
	"rust-argon2 sru-systems/rust-argon2 ed81866f163f0c7026aa6fd8388adf37242eb32a"
	"tinycc oven-sh/tinycc 05f0fafaa3be31e31d7b4b5c17dc60f62c991171"
	"zlib zlib-ng/zlib-ng 12731092979c6d07f42da27da673a9f6c7b13586"
	"zstd facebook/zstd f8745da6ff1ad1e7bab384bd1f9d742439278e99"
)
BUN_WEBKIT_COMMIT="d6375c72affe0f70222cdcb45012b10f0bf3a9d5"
BUN_NODEJS_VERSION="v26.3.0"
BUN_GIT_SHA="38afee6c84fcf48c0edb2466aa4b27d287a59c30"
CRATES="
	addr2line@0.27.1
	adler2@2.0.1
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	anes@0.1.6
	anstyle@1.0.14
	anyhow@1.0.102
	arrayref@0.3.9
	arrayvec@0.7.6
	autocfg@1.5.0
	base64@0.22.1
	bcrypt@0.19.0
	bitflags@2.11.1
	blake2@0.10.6
	blake2b_simd@1.0.4
	block-buffer@0.10.4
	blowfish@0.9.1
	bstr@1.12.1
	bumpalo@3.20.2
	bytemuck@1.25.0
	byteorder@1.5.0
	cast@0.3.0
	cc@1.2.0
	cfg-if@1.0.4
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	cipher@0.4.4
	clap@4.6.1
	clap_builder@4.6.0
	clap_lex@1.1.0
	const_format@0.2.36
	const_format_proc_macros@0.2.34
	constant_time_eq@0.4.2
	cpufeatures@0.2.17
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	crypto-common@0.1.7
	cssparser-macros@0.6.1
	cssparser@0.36.0
	darling@0.21.3
	darling_core@0.21.3
	darling_macro@0.21.3
	derive_more-impl@2.1.1
	derive_more@2.1.1
	digest@0.10.7
	dlmalloc@0.2.14
	dtoa-short@0.3.5
	dtoa@1.0.11
	either@1.15.0
	encoding_rs@0.8.35
	enum-map-derive@0.17.0
	enum-map@2.7.3
	enumset@1.1.10
	enumset_derive@0.14.0
	equivalent@1.0.2
	errno@0.3.14
	fastrand@2.4.1
	fnv@1.0.7
	foldhash@0.1.5
	foldhash@0.2.0
	fortanix-sgx-abi@0.6.1
	futures-core@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	generic-array@0.14.7
	getopts@0.2.24
	getrandom@0.4.2
	gimli@0.34.0
	half@2.7.1
	hashbrown@0.15.5
	hashbrown@0.16.1
	hashbrown@0.17.0
	hashbrown@0.17.1
	heck@0.5.0
	hermit-abi@0.5.2
	id-arena@2.3.0
	ident_case@1.0.1
	indexmap@2.14.0
	inout@0.1.4
	is-terminal@0.4.17
	itertools@0.10.5
	itoa@1.0.18
	js-sys@0.3.98
	keccak@0.1.6
	konst@0.2.20
	konst_macro_rules@0.2.19
	leb128fmt@0.1.0
	libc@0.2.186
	libc@0.2.189
	linux-raw-sys@0.4.15
	log@0.4.29
	memchr@2.8.0
	memchr@2.8.3
	mime@0.3.17
	miniz_oxide@0.9.1
	moto-rt@0.16.4
	new_debug_unreachable@1.0.6
	num-traits@0.2.19
	object@0.39.1
	once_cell@1.21.4
	oorandom@11.1.5
	paste@1.0.15
	phf@0.13.1
	phf_codegen@0.13.1
	phf_generator@0.13.1
	phf_macros@0.13.1
	phf_shared@0.13.1
	pin-project-lite@0.2.17
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	precomputed-hash@0.1.1
	prettyplease@0.2.37
	proc-macro2@1.0.106
	quick-xml@0.38.4
	quote@1.0.45
	r-efi-alloc@2.1.0
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.9.5
	rand_core@0.9.5
	rand_xorshift@0.4.0
	rayon-core@1.13.0
	rayon@1.12.0
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	roxmltree@0.20.0
	rustc-demangle@0.1.28
	rustc-hash@2.1.2
	rustc-literal-escaper@0.0.8
	rustc_version@0.4.1
	rustix@0.38.44
	rustversion@1.0.22
	same-file@1.0.6
	scopeguard@1.2.0
	selectors@0.33.0
	semver@1.0.28
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	servo_arc@0.4.3
	sha3@0.10.9
	shlex@1.3.0
	siphasher@1.0.3
	slab@0.4.12
	smallvec@1.15.1
	stable_deref_trait@1.2.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	syn@2.0.117
	thiserror-impl@2.0.18
	thiserror@2.0.18
	tinytemplate@1.2.1
	typenum@1.20.0
	unicode-ident@1.0.24
	unicode-xid@0.2.6
	unwinding@0.2.10
	version_check@0.9.5
	vex-sdk@0.27.1
	walkdir@2.5.0
	wasip1@1.0.0
	wasip2@1.0.3+wasi-0.2.9
	wasip2@1.0.4+wasi-0.2.12
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasip3@0.7.0+wasi-0.3.0
	wasm-bindgen-macro-support@0.2.121
	wasm-bindgen-macro@0.2.121
	wasm-bindgen-shared@0.2.121
	wasm-bindgen@0.2.121
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasmparser@0.244.0
	web-sys@0.3.98
	winapi-util@0.1.11
	windows-link@0.2.1
	windows-sys@0.59.0
	windows-sys@0.61.2
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-bindgen@0.57.1
	wit-component@0.244.0
	wit-parser@0.244.0
	xml-rs@0.8.29
	zerocopy-derive@0.8.48
	zerocopy@0.8.48
	zeroize@1.8.2
	zmij@1.0.21
"
NPM_PKGS=(
	"@esbuild/linux-x64@0.21.5 ."
	"@lezer/common@1.5.2 ."
	"@lezer/cpp@1.1.6 ."
	"@lezer/highlight@1.2.3 ."
	"@lezer/lr@1.4.10 ."
	"@types/node@26.2.0 ."
	"@types/prop-types@15.7.15 ."
	"@types/react-dom@18.3.7 ."
	"@types/react@18.3.31 ."
	"csstype@3.2.3 ."
	"esbuild@0.21.5 ."
	"js-tokens@4.0.0 ."
	"loose-envify@1.4.0 ."
	"prettier@3.9.9 ."
	"react-dom@18.3.1 ."
	"react@18.3.1 ."
	"scheduler@0.23.2 ."
	"source-map-js@1.2.1 ."
	"typescript@6.0.2 ."
	"undici-types@8.3.0 ."
	"preact@10.27.2 packages/bun-error"
	"abort-controller@3.0.0 src/node-fallbacks"
	"asn1.js@4.10.1 src/node-fallbacks"
	"assert@2.1.0 src/node-fallbacks"
	"available-typed-arrays@1.0.7 src/node-fallbacks"
	"base64-js@1.5.1 src/node-fallbacks"
	"bn.js@4.12.2 src/node-fallbacks"
	"bn.js@5.2.2 src/node-fallbacks"
	"brorand@1.1.0 src/node-fallbacks"
	"browserify-aes@1.2.0 src/node-fallbacks"
	"browserify-cipher@1.0.1 src/node-fallbacks"
	"browserify-des@1.0.2 src/node-fallbacks"
	"browserify-rsa@4.1.1 src/node-fallbacks"
	"browserify-sign@4.2.5 src/node-fallbacks"
	"browserify-zlib@0.2.0 src/node-fallbacks"
	"buffer-xor@1.0.3 src/node-fallbacks"
	"buffer@5.0.5 src/node-fallbacks"
	"buffer@6.0.3 src/node-fallbacks"
	"builtin-status-codes@3.0.0 src/node-fallbacks"
	"call-bind-apply-helpers@1.0.2 src/node-fallbacks"
	"call-bind@1.0.8 src/node-fallbacks"
	"call-bound@1.0.4 src/node-fallbacks"
	"cipher-base@1.0.7 src/node-fallbacks"
	"core-util-is@1.0.3 src/node-fallbacks"
	"create-ecdh@4.0.4 src/node-fallbacks"
	"create-hash@1.2.0 src/node-fallbacks"
	"create-hmac@1.1.7 src/node-fallbacks"
	"crypto-browserify@3.12.1 src/node-fallbacks"
	"define-data-property@1.1.4 src/node-fallbacks"
	"define-properties@1.2.1 src/node-fallbacks"
	"des.js@1.1.0 src/node-fallbacks"
	"diffie-hellman@5.0.3 src/node-fallbacks"
	"domain-browser@4.23.0 src/node-fallbacks"
	"dunder-proto@1.0.1 src/node-fallbacks"
	"elliptic@6.6.1 src/node-fallbacks"
	"es-define-property@1.0.1 src/node-fallbacks"
	"es-errors@1.3.0 src/node-fallbacks"
	"es-object-atoms@1.1.1 src/node-fallbacks"
	"event-target-shim@5.0.1 src/node-fallbacks"
	"events@3.3.0 src/node-fallbacks"
	"evp_bytestokey@1.0.3 src/node-fallbacks"
	"for-each@0.3.5 src/node-fallbacks"
	"function-bind@1.1.2 src/node-fallbacks"
	"generator-function@2.0.1 src/node-fallbacks"
	"get-intrinsic@1.3.0 src/node-fallbacks"
	"get-proto@1.0.1 src/node-fallbacks"
	"gopd@1.2.0 src/node-fallbacks"
	"has-property-descriptors@1.0.2 src/node-fallbacks"
	"has-symbols@1.1.0 src/node-fallbacks"
	"has-tostringtag@1.0.2 src/node-fallbacks"
	"hash-base@3.0.5 src/node-fallbacks"
	"hash-base@3.1.2 src/node-fallbacks"
	"hash.js@1.1.7 src/node-fallbacks"
	"hasown@2.0.2 src/node-fallbacks"
	"hmac-drbg@1.0.1 src/node-fallbacks"
	"https-browserify@1.0.0 src/node-fallbacks"
	"ieee754@1.2.1 src/node-fallbacks"
	"inherits@2.0.4 src/node-fallbacks"
	"is-arguments@1.2.0 src/node-fallbacks"
	"is-callable@1.2.7 src/node-fallbacks"
	"is-generator-function@1.1.2 src/node-fallbacks"
	"is-nan@1.3.2 src/node-fallbacks"
	"is-regex@1.2.1 src/node-fallbacks"
	"is-typed-array@1.1.15 src/node-fallbacks"
	"isarray@1.0.0 src/node-fallbacks"
	"isarray@2.0.5 src/node-fallbacks"
	"math-intrinsics@1.1.0 src/node-fallbacks"
	"md5.js@1.3.5 src/node-fallbacks"
	"miller-rabin@4.0.1 src/node-fallbacks"
	"minimalistic-assert@1.0.1 src/node-fallbacks"
	"minimalistic-crypto-utils@1.0.1 src/node-fallbacks"
	"object-is@1.1.6 src/node-fallbacks"
	"object-keys@1.1.1 src/node-fallbacks"
	"object.assign@4.1.7 src/node-fallbacks"
	"pako@1.0.11 src/node-fallbacks"
	"parse-asn1@5.1.9 src/node-fallbacks"
	"pbkdf2@3.1.5 src/node-fallbacks"
	"possible-typed-array-names@1.1.0 src/node-fallbacks"
	"process-nextick-args@2.0.1 src/node-fallbacks"
	"process@0.11.10 src/node-fallbacks"
	"public-encrypt@4.0.3 src/node-fallbacks"
	"punycode@2.3.1 src/node-fallbacks"
	"querystring-es3@1.0.0-0 src/node-fallbacks"
	"randombytes@2.1.0 src/node-fallbacks"
	"randomfill@1.0.4 src/node-fallbacks"
	"react-refresh@0.17.0 src/node-fallbacks"
	"readable-stream@2.3.8 src/node-fallbacks"
	"readable-stream@3.6.2 src/node-fallbacks"
	"readable-stream@4.7.0 src/node-fallbacks"
	"ripemd160@2.0.3 src/node-fallbacks"
	"safe-buffer@5.1.2 src/node-fallbacks"
	"safe-buffer@5.2.1 src/node-fallbacks"
	"safe-regex-test@1.1.0 src/node-fallbacks"
	"set-function-length@1.2.2 src/node-fallbacks"
	"sha.js@2.4.12 src/node-fallbacks"
	"stream-http@3.2.0 src/node-fallbacks"
	"string_decoder@1.1.1 src/node-fallbacks"
	"string_decoder@1.3.0 src/node-fallbacks"
	"to-buffer@1.2.2 src/node-fallbacks"
	"typed-array-buffer@1.0.3 src/node-fallbacks"
	"util-deprecate@1.0.2 src/node-fallbacks"
	"util@0.12.5 src/node-fallbacks"
	"which-typed-array@1.1.19 src/node-fallbacks"
	"xtend@4.0.2 src/node-fallbacks"
)

LLVM_COMPAT=( 23 )
PYTHON_COMPAT=( python3_{11..14} )
USE_RUBY="ruby32 ruby33 ruby34 ruby40"
RUST_MIN_VER="1.99.0"
RUST_MAX_VER="${RUST_MIN_VER}"
RUST_NEEDS_LLVM=1

inherit cargo edo flag-o-matic llvm-r1 multiprocessing python-any-r1 ruby-single shell-completion toolchain-funcs

DESCRIPTION="Incredibly fast JavaScript runtime, bundler, test runner, and package manager"
HOMEPAGE="https://bun.com/"

_bun_vendor_src_uri() {
	local line parts name repo commit
	for line in "${BUN_VENDOR[@]}"; do
		parts=( ${line} )
		name="${parts[0]}" repo="${parts[1]}" commit="${parts[2]}"
		echo "https://github.com/${repo}/archive/${commit}.tar.gz -> bun-vendor-${name}-${commit}.tar.gz"
	done
}

_npm_pkg_src_uri() {
	local NPM_REGISTRY="https://registry.npmjs.org"
	local line parts spec name version base file

	for line in "${NPM_PKGS[@]}"; do
		parts=( ${line} )
		spec="${parts[0]}"
		name="${spec%@*}"
		version="${spec##*@}"
		base="${name##*/}"
		file="npm-${name//\//-}-${version}.tar.gz"
		echo "${NPM_REGISTRY}/${name}/-/${base}-${version}.tgz -> ${file}"
	done
}

SRC_URI="
	https://github.com/oven-sh/bun/archive/refs/tags/bun-v${PV}.tar.gz -> ${P}.tar.gz
	https://nodejs.org/dist/${BUN_NODEJS_VERSION}/node-${BUN_NODEJS_VERSION}-headers.tar.gz -> bun-node-${BUN_NODEJS_VERSION}-headers.tar.gz
	WebKit-${BUN_WEBKIT_COMMIT}.tar.xz
	$(_bun_vendor_src_uri)
	${CARGO_CRATE_URIS}
	$(_npm_pkg_src_uri)
	!system-bootstrap? (
		https://github.com/oven-sh/bun/releases/download/bun-v${PV}/bun-linux-x64.zip -> bun-bootstrap-${PV}-x64.zip
	)
"

LICENSE="Apache-2.0 BSD BSD-2 ISC LGPL-2 LGPL-2.1 MIT Unicode-3.0 ZLIB openssl"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+system-bootstrap"
RESTRICT="mirror test"

S="${WORKDIR}/bun-bun-v${PV}"

RDEPEND="dev-libs/icu:="
DEPEND="${RDEPEND}"
BDEPEND="
	${RUST_DEPEND}
	${PYTHON_DEPS}
	${RUBY_DEPS}
	>=net-libs/nodejs-25[npm]
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}
		llvm-core/lld:${LLVM_SLOT}
		llvm-core/llvm:${LLVM_SLOT}
	')
	app-alternatives/ninja
	dev-build/cmake
	dev-lang/perl
	dev-util/gperf
	virtual/pkgconfig
	system-bootstrap? ( dev-lang/bun )
	!system-bootstrap? ( app-arch/unzip )"

PATCHES=(
	"${FILESDIR}"/bun-1.4.4-once-default.patch
	"${FILESDIR}"/bun-1.4.4-type-info-of.patch
)

pkg_setup() {
	[[ ${MERGE_TYPE} == binary ]] && return

	llvm-r1_pkg_setup
	python-any-r1_pkg_setup
	rust_pkg_setup
}

pkg_nofetch() {
	einfo "Create WebKit-${BUN_WEBKIT_COMMIT}.tar.xz as follows and place it in /var/db/distfiles:"
	einfo
	einfo "git clone --depth=1 --revision=refs/tags/autobuild-${BUN_WEBKIT_COMMIT} https://github.com/oven-sh/WebKit.git /tmp/WebKit"
	einfo "git -C /tmp/WebKit archive --format=tar --prefix=\"WebKit-${BUN_WEBKIT_COMMIT}/\" HEAD -- ':/' ':!JSTests' ':!LayoutTests' ':!ManualTests' ':!PerformanceTests' ':!WebDriverTests' ':!Websites' | xz -9 > /var/db/distfiles/WebKit-${BUN_WEBKIT_COMMIT}.tar.xz"
}

_bun_prefetch() {
	local url="$1" file="$2" key
	key="$(printf '%s' "${url}" | sha256sum)" || die
	ln -s "${DISTDIR}/${file}" "${WORKDIR}/bun-prefetch/by-url/${key:0:32}" || die
}

_bun_npm_unpack() {
	local line parts spec subdir name version file
	for line in "${NPM_PKGS[@]}"; do
		parts=( ${line} )
		spec="${parts[0]}" subdir="${parts[1]}"
		name="${spec%@*}"
		version="${spec##*@}"
		file="npm-${name//\//-}-${version}.tar.gz"
		mkdir -p "${S}/${subdir}/node_modules/${name}" || die
		echo "Extracting ${file} to ${subdir}/node_modules/${name} ..."
		tar xf "${DISTDIR}/${file}" --strip-components=1 --warning=no-unknown-keyword -C "${S}/${subdir}/node_modules/${name}" || die
	done
}

src_unpack() {
	unpack "${P}.tar.gz"
	unpack "WebKit-${BUN_WEBKIT_COMMIT}.tar.xz"
	use system-bootstrap || unpack "bun-bootstrap-${PV}-x64.zip"

	cargo_crate_unpack
	cargo_gen_config

	mkdir -p "${WORKDIR}/bun-prefetch/by-url" || die
	local line parts name repo commit
	for line in "${BUN_VENDOR[@]}"; do
		parts=( ${line} )
		name="${parts[0]}" repo="${parts[1]}" commit="${parts[2]}"
		_bun_prefetch "https://github.com/${repo}/archive/${commit}.tar.gz" "bun-vendor-${name}-${commit}.tar.gz"
	done
	_bun_prefetch \
		"https://nodejs.org/dist/${BUN_NODEJS_VERSION}/node-${BUN_NODEJS_VERSION}-headers.tar.gz" \
		"bun-node-${BUN_NODEJS_VERSION}-headers.tar.gz"

	_bun_npm_unpack
	ln -sf ../packages/bun-types "${S}/node_modules/bun-types" || die
	mkdir -p "${S}/node_modules/.bin" || die
	ln -sf ../esbuild/bin/esbuild "${S}/node_modules/.bin/esbuild" || die
}

src_prepare() {
	sed -i 's@\${bun} install --frozen-lockfile && @@' scripts/build/codegen.ts || die

	if is-flagq "-march=native"; then
		sed -i '/^export const cpuTargetFlags/a\  { flag: "-march=native", when: () => true, desc: "CFLAGS" },' scripts/build/flags.ts || die
	fi

	if [[ $(tc-get-cxx-stdlib) == libc++ ]]; then
		sed -i \
			-e 's/EmSt8functionIFNS_10MaybeLocalINS_5ValueEEEvEE/EmNSt3__18functionIFNS_10MaybeLocalINS_5ValueEEEvEEE/' \
			-e 's/ESt8optionalImE/ENSt3__18optionalImEE/' \
			src/runtime/napi/napi_body.rs || die
	fi

	default
}

src_compile() {
	local -x BUN_WEBKIT_PATH="${WORKDIR}/WebKit-${BUN_WEBKIT_COMMIT}"
	local -x BUN_TOOLCHAIN_LLVM="$(get_llvm_prefix -b)"
	local -x BUN_TOOLCHAIN_RUST="$(get_rust_prefix -b)"
	local -x BUN_BUILD_PREFETCH_DIR="${WORKDIR}/bun-prefetch"
	local -x CARGO_HOME="${ECARGO_HOME}"
	local -x RUSTC_BOOTSTRAP=1
	local -x GIT_SHA="${BUN_GIT_SHA}"

	local bootstrap_bun="bun"
	if ! use system-bootstrap; then
		bootstrap_bun="${WORKDIR}/bun-linux-x64/bun"
	fi

	local lto=off
	tc-is-lto && lto=on

	edo ${bootstrap_bun} scripts/build.ts --profile=release-local --canary=off --lto=${lto} -j$(makeopts_jobs) -l$(makeopts_loadavg)
}

src_install() {
	dobin build/release/bun
	dosym bun /usr/bin/bunx

	newbashcomp completions/bun.bash bun
	newzshcomp completions/bun.zsh _bun
	dofishcomp completions/bun.fish

	einstalldocs
}
