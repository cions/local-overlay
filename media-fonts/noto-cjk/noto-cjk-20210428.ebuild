# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="Google's CJK font family"
HOMEPAGE="https://www.google.com/get/noto/ https://github.com/googlefonts/noto-cjk"

SRC_URI="
	https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/06_NotoSansCJKjp.zip
	https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/11_NotoSansMonoCJKjp.zip
	https://github.com/googlefonts/noto-cjk/releases/download/Serif2.001/07_NotoSerifCJKjp.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~mips ppc ppc64 sparc x86"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND=""
S="${WORKDIR}"

FONT_SUFFIX="otf"
FONT_S="${S}"
FONT_CONF=(
	# From ArchLinux
	"${FILESDIR}/70-noto-cjk.conf"
)

src_prepare() {
	mv OTF/Japanese/*.otf .

	default
}
