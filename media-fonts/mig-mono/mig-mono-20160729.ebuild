# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit font

DESCRIPTION="MiG Mono Japanese TrueType fonts"
HOMEPAGE="https://github.com/cions/mig-mono"
SRC_URI="https://github.com/cions/mig-mono/releases/download/v${PV}/${P}.tar.xz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND=""

FONT_SUFFIX="ttf"
FONT_S="${S}"

src_install() {
	font_src_install

	insinto /usr/share/i18n/charmaps
	doins UTF-8-MIG.gz
}
