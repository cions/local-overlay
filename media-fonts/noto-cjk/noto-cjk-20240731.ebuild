# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Google's CJK font family"
HOMEPAGE="https://fonts.google.com/noto https://github.com/notofonts/noto-cjk"
SRC_URI="
	https://github.com/notofonts/noto-cjk/releases/download/Sans2.004/06_NotoSansCJKjp.zip -> ${P}-NotoSansCJKjp.zip
	https://github.com/notofonts/noto-cjk/releases/download/Sans2.004/11_NotoSansMonoCJKjp.zip -> ${P}-NotoSansMonoCJKjp.zip
	https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/07_NotoSerifCJKjp.zip -> ${P}-NotoSerifCJKjp.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE=""
RESTRICT="binchecks mirror strip test"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

FONT_SUFFIX="otf"
FONT_S="${S}"
FONT_CONF=(
	"${FILESDIR}/70-noto-cjk.conf"
)

src_unpack() {
	default

	mv OTF/Japanese/*.otf .
}
