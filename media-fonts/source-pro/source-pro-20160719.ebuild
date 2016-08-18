# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

SANS_V="2.020R-ro/1.075R-it"
SERIF_V="1.017R"
CODE_V="2.030R-ro/1.050R-it"

DESCRIPTION="Adobe's open source typeface family designed for UI environments"
HOMEPAGE="
	http://adobe-fonts.github.io/source-sans-pro
	http://adobe-fonts.github.io/source-serif-pro
	http://adobe-fonts.github.io/source-code-pro"
SRC_URI="
	https://github.com/adobe-fonts/source-sans-pro/archive/${SANS_V}.tar.gz -> source-sans-pro-${PV}.tar.gz
	https://github.com/adobe-fonts/source-serif-pro/archive/${SERIF_V}.tar.gz -> source-serif-pro-${PV}.tar.gz
	https://github.com/adobe-fonts/source-code-pro/archive/${CODE_V}.tar.gz -> source-code-pro-${PV}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND=""
S="${WORKDIR}"

FONT_SUFFIX="otf"
FONT_S="${S}"

src_prepare() {
	eapply_user

	mv source-*/OTF/*.otf . || die
}
