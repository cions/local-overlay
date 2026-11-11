# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GIT_COMMIT="9cd7f73c80b54bd5751f481c84db50141771148d"

inherit font

DESCRIPTION="A sans-serif monotype font for code listings"
HOMEPAGE="https://github.com/googlefonts/Inconsolata"
SRC_URI="https://github.com/googlefonts/Inconsolata/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip test"

S="${WORKDIR}/Inconsolata-${GIT_COMMIT}"

FONT_SUFFIX="otf"
FONT_S="${S}/fonts/otf"
