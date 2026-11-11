# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GIT_COMMIT="770f2077bb8cb12a3a20bcefc8be9dd2ed985908"

inherit font

DESCRIPTION="The package of IBM's typeface"
HOMEPAGE="https://github.com/IBM/plex"
SRC_URI="https://github.com/IBM/plex/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip test"

S="${WORKDIR}/plex-${GIT_COMMIT}/packages"

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
