# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

MY_P="mplus-${PV/0_pre/TESTFLIGHT-}"

DESCRIPTION="M+ Japanese outline fonts"
HOMEPAGE="http://mplus-fonts.osdn.jp/"
SRC_URI="mirror://osdn/mplus-fonts/62344/${MY_P}.tar.xz"

LICENSE="mplus-fonts"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND=""
S="${WORKDIR}/${MY_P}"

FONT_SUFFIX="ttf"
FONT_S="${S}"
DOCS=( "README_J" "README_E" )
