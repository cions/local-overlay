# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MULTIBUILD_VARIANTS=( shared static )
PYTHON_COMPAT=( python3_{11..15} )

inherit cmake-multilib dot-a edo flag-o-matic multibuild python-any-r1

DESCRIPTION="Abseil Common Libraries (C++)"
HOMEPAGE="https://abseil.io/"
SRC_URI="https://github.com/abseil/abseil-cpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror test"

BDEPEND="${PYTHON_DEPS}"

src_prepare() {
	cmake_prepare

	edo ${EPYTHON} absl/copts/generate_copts.py

	default
}

multilib_src_configure() {
	local mycmakeargs=(
		-DABSL_ENABLE_INSTALL="ON"
		-DABSL_PROPAGATE_CXX_STD="ON"
		-DABSL_BUILD_TESTING="OFF"
	)

	if [[ "${MULTIBUILD_ID}" == "shared-"* ]]; then
		mycmakeargs+=( -DBUILD_SHARED_LIBS="ON" )
	else
		mycmakeargs+=( -DBUILD_SHARED_LIBS="OFF" )
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
}
