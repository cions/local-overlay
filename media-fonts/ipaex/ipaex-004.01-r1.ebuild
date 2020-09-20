# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit font

MY_P="IPAexfont${PV/.}"

DESCRIPTION="IPAex Japanese TrueType fonts"
HOMEPAGE="https://moji.or.jp/ipafont/"
SRC_URI="https://moji.or.jp/wp-content/ipafont/IPAexfont/${MY_P}.zip"

LICENSE="IPAfont"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/unzip"
S="${WORKDIR}/${MY_P}"

FONT_SUFFIX="ttf"
FONT_S="${S}"
DOCS="Readme_${MY_P}.txt"
