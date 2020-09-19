# Copyright 2008-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="A sans-serif monotype font for code listings"
HOMEPAGE="https://github.com/googlefonts/Inconsolata"
SRC_URI="https://github.com/googlefonts/Inconsolata/releases/download/v${PV}/fonts_otf.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc x86 ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/unzip"
S="${WORKDIR}"

FONT_SUFFIX="otf"
FONT_S="${S}/fonts/otf"
