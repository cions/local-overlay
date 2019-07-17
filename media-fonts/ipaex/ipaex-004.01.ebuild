# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

MY_P="IPAexfont${PV/.}"

DESCRIPTION="IPAex Japanese TrueType fonts"
HOMEPAGE="https://ipafont.ipa.go.jp/"
SRC_URI="https://oscdl.ipa.go.jp/IPAexfont/${MY_P}.zip"

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
