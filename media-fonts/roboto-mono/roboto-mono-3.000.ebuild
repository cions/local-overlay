# Copyright 2008-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="A monospaced addition to the Roboto type family"
HOMEPAGE="https://fonts.google.com/specimen/Roboto+Mono"
COMMIT="b0de105b98410d33f36b0e09a1fca59af1426026"
SRC_URI="https://github.com/TypeNetwork/RobotoMono/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc x86 ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/unzip"
S="${WORKDIR}/RobotoMono-${COMMIT}"

FONT_SUFFIX="ttf"
FONT_S="${S}/fonts/ttf"
DOCS="README.md"
