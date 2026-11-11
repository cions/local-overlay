# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ABSEIL_MIN_VER="20250127.0"  # cmake/dependencies.cmake
MULTIBUILD_VARIANTS=( shared static )

inherit cmake-multilib dot-a flag-o-matic multibuild multilib toolchain-funcs

DESCRIPTION="Google's Protocol Buffers - Extensible mechanism for serializing structured data"
HOMEPAGE="https://protobuf.dev/"
SRC_URI="https://github.com/protocolbuffers/protobuf/releases/download/v${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}.0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="
	>=dev-cpp/abseil-cpp-${ABSEIL_MIN_VER}:=[${MULTILIB_USEDEP}]
	virtual/zlib:=[${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}"

DOCS=(
	CONTRIBUTORS.txt
	README.md
)

multilib_src_configure() {
	local mycmakeargs=(
		-Dprotobuf_BUILD_LIBPROTOC="ON"
		-Dprotobuf_BUILD_LIBUPB="ON"
		-Dprotobuf_BUILD_PROTOBUF_BINARIES="ON"
		-Dprotobuf_BUILD_PROTOC_BINARIES="ON"
		-Dprotobuf_BUILD_CONFORMANCE="OFF"
		-Dprotobuf_BUILD_TESTS="OFF"
		-Dprotobuf_BUILD_EXAMPLES="OFF"
		-Dprotobuf_DISABLE_RTTI="OFF"
		-Dprotobuf_INSTALL="ON"
		-Dprotobuf_WITH_ZLIB="ON"
		-Dprotobuf_LOCAL_DEPENDENCIES_ONLY="ON"
	)

	if [[ ${MULTIBUILD_ID} == "shared-"* ]]; then
		mycmakeargs+=( -Dprotobuf_BUILD_SHARED_LIBS="ON" )
	else
		mycmakeargs+=( -Dprotobuf_BUILD_SHARED_LIBS="OFF" )
	fi

	cmake_src_configure
}

src_configure() {
	lto-guarantee-fat

	multibuild_foreach_variant cmake-multilib_src_configure
}

src_compile() {
	multibuild_foreach_variant cmake-multilib_src_compile
}

src_install() {
	multibuild_foreach_variant cmake-multilib_src_install

	strip-lto-bytecode

	einstalldocs
}
