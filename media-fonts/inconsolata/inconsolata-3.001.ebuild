# Copyright 2008-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="A sans-serif monotype font for code listings"
HOMEPAGE="https://fonts.google.com/specimen/Inconsolata"
SRC_URI="https://fonts.google.com/download?family=Inconsolata -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc x86 ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""
RESTRICT="binchecks strip test"

S="${WORKDIR}"

FONT_SUFFIX="ttf"
FONT_S="${WORKDIR}/static"
DOCS="README.txt"
