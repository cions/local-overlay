# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit font

DESCRIPTION="Mgen+ Japanese TrueType fonts"
HOMEPAGE="http://jikasei.me/font/mgenplus/"
SRC_URI="mirror://osdn/users/8/8597/${P}.7z"

LICENSE="OFL-1.1 mplus-fonts"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/p7zip"
S="${WORKDIR}"

FONT_SUFFIX="ttf"
FONT_S="${S}"
DOCS="README_MgenPlus.txt"
