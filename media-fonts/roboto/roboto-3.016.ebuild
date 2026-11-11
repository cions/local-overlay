# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Standard font for Android 4.0 (Ice Cream Sandwich) and later"
HOMEPAGE="https://github.com/googlefonts/roboto-3-classic"
SRC_URI="https://github.com/googlefonts/roboto-3-classic/releases/download/v${PV}/Roboto_v${PV}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip test"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

FONT_SUFFIX="ttf"
FONT_S="${S}/unhinted/static"
FONT_CONF=(
	"${FILESDIR}"/90-roboto-regular.conf
)
