# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..15} )
GN_COMMIT="d78676b2abbd0d124d1ad97f180ed156ead07a3a"

inherit edo ninja-utils python-any-r1 toolchain-funcs

DESCRIPTION="GN is a meta-build system that generates build files for Ninja"
HOMEPAGE="https://gn.googlesource.com/"
SRC_URI="https://gn.googlesource.com/gn/+archive/${GN_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

BDEPEND="
	${PYTHON_DEPS}
	app-alternatives/ninja
"

S="${WORKDIR}"

src_configure() {
	tc-export AR CC CXX

	edo ${EPYTHON} build/gen.py --allow-warnings --no-static-libstdc++ --no-strip
}

src_compile() {
	eninja -C out gn
}

src_install() {
	dobin out/gn

	insinto /usr/share/vim/vimfiles
	doins -r misc/vim/{autoload,ftdetect,ftplugin,syntax}

	einstalldocs
}
