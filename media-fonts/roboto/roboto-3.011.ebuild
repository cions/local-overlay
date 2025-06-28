# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Standard font for Android 4.0 (Ice Cream Sandwich) and later"
HOMEPAGE="https://github.com/googlefonts/roboto-3-classic"
SRC_URI="https://github.com/googlefonts/roboto-3-classic/releases/download/v${PV}/Roboto_v${PV}.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~loong ~ppc ~ppc64 ~riscv x86 ~amd64-linux ~x86-linux ~x64-macos"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

FONT_CONF=( "${FILESDIR}"/90-roboto-regular.conf )
FONT_SUFFIX="ttf"
FONT_S="${S}/unhinted/static"
