# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="The package of IBM's typeface"
HOMEPAGE="https://github.com/IBM/plex"
COMMIT="ceee82fa88781b8310b198fd302480efaeac609e"
SRC_URI="https://github.com/IBM/plex/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE=""
RESTRICT="binchecks mirror strip test"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/plex-${COMMIT}/packages"

FONT_SUFFIX="otf"
FONT_S=(
	plex-math/fonts/complete/otf
	plex-mono/fonts/complete/otf
	plex-sans-arabic/fonts/complete/otf
	plex-sans-condensed/fonts/complete/otf
	plex-sans-devanagari/fonts/complete/otf
	plex-sans/fonts/complete/otf
	plex-sans-hebrew/fonts/complete/otf
	plex-sans-jp/fonts/complete/otf/unhinted
	plex-sans-kr/fonts/complete/otf
	plex-sans-sc/fonts/complete/otf/unhinted
	plex-sans-tc/fonts/complete/otf/unhinted
	plex-sans-thai/fonts/complete/otf
	plex-sans-thai-looped/fonts/complete/otf
	plex-serif/fonts/complete/otf
)
