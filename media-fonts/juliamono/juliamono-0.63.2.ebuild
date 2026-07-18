# Copyright 2008-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A monospaced font with reasonable Unicode support"
HOMEPAGE="https://juliamono.netlify.app/"
SRC_URI="https://github.com/cormullion/juliamono/releases/download/v${PV}/JuliaMono-ttf.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE=""
RESTRICT="binchecks mirror strip test"

S="${WORKDIR}"

FONT_SUFFIX="ttf"
FONT_S="${S}"
