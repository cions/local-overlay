# Copyright 2008-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Open-source monospace font for code listings"
HOMEPAGE="https://github.com/googlefonts/Inconsolata"
COMMIT="9cd7f73c80b54bd5751f481c84db50141771148d"
SRC_URI="https://github.com/googlefonts/Inconsolata/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE=""
RESTRICT="binchecks mirror strip test"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/Inconsolata-${COMMIT}"

FONT_SUFFIX="otf"
FONT_S="${S}/fonts/otf"
