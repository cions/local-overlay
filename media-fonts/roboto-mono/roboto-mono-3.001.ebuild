# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A monospaced addition to the Roboto type family"
HOMEPAGE="https://github.com/googlefonts/RobotoMono"
SRC_URI="https://github.com/googlefonts/RobotoMono/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip test"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/RobotoMono-${PV}"

FONT_SUFFIX="otf"
FONT_S="${S}/fonts/otf"
