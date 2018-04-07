# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Google's font family that aims to support all the world's languages"
HOMEPAGE="https://www.google.com/get/noto/"

SRC_URI="https://noto-website.storage.googleapis.com/pkgs/Noto-hinted.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND="!media-fonts/noto-cjk"
DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="otf ttf"
DOCS="LICENSE_OFL.txt README"
