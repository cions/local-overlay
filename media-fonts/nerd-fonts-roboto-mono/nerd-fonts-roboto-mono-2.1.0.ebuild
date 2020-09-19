# Copyright 2008-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="Patched font Roboto Mono from the nerd-fonts library"
HOMEPAGE="https://www.nerdfonts.com/"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/RobotoMono.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc x86 ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/unzip"
S="${WORKDIR}"

FONT_SUFFIX="ttf"
FONT_S="${S}"

src_prepare() {
	find -name '*Windows Compatible*' -delete

	default
}
