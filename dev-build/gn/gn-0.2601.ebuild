# Copyright 2018-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..14} )

inherit edo git-r3 ninja-utils python-any-r1 toolchain-funcs

DESCRIPTION="GN is a meta-build system that generates build files for Ninja"
HOMEPAGE="https://gn.googlesource.com/"

EGIT_REPO_URI="https://gn.googlesource.com/gn"
EGIT_COMMIT="d78676b2abbd0d124d1ad97f180ed156ead07a3a"

KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
LICENSE="BSD"
SLOT="0"

BDEPEND="${PYTHON_DEPS}
	app-alternatives/ninja"

src_configure() {
	python_setup
	tc-export AR CC CXX

	edo ${EPYTHON} build/gen.py --allow-warnings --no-static-libstdc++ --no-strip
}

src_compile() {
	eninja -C out gn
}

src_test() {
	eninja -C out gn_unittests
	out/gn_unittests || die
}

src_install() {
	dobin out/gn
	einstalldocs

	insinto /usr/share/vim/vimfiles
	doins -r misc/vim/{autoload,ftdetect,ftplugin,syntax}
}
