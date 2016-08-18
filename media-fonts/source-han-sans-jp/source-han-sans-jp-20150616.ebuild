# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

MY_V="1.004R"

DESCRIPTION="Adobe's OpenType/CFF Pan-CJK fonts"
HOMEPAGE="http://adobe-fonts.github.io/source-han-sans"
SRC_URI="https://github.com/adobe-fonts/source-han-sans/raw/${MY_V}/SubsetOTF/SourceHanSansJP.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND=""
S="${WORKDIR}/SourceHanSansJP"

FONT_SUFFIX="otf"
FONT_S="${S}"
