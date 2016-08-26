# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

DESCRIPTION="MigMix and Migu Japanese TrueType fonts"
HOMEPAGE="http://mix-mplus-ipa.osdn.jp/"
SRC_URI="
	mirror://osdn/mix-mplus-ipa/63544/migmix-1m-${PV}.zip
	mirror://osdn/mix-mplus-ipa/63544/migmix-1p-${PV}.zip
	mirror://osdn/mix-mplus-ipa/63544/migmix-2m-${PV}.zip
	mirror://osdn/mix-mplus-ipa/63544/migmix-2p-${PV}.zip
	mirror://osdn/mix-mplus-ipa/63545/migu-1c-${PV}.zip
	mirror://osdn/mix-mplus-ipa/63545/migu-1m-${PV}.zip
	mirror://osdn/mix-mplus-ipa/63545/migu-1p-${PV}.zip
	mirror://osdn/mix-mplus-ipa/63545/migu-2m-${PV}.zip"

LICENSE="IPAfont"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/unzip"
S="${WORKDIR}"

FONT_SUFFIX="ttf"
FONT_S="${S}"
DOCS=( "migmix-README.txt" "migu-README.txt" )

src_prepare() {
	eapply_user

	mv */*.${FONT_SUFFIX} "${FONT_S}" || die
	mv migmix-1m-${PV}/migmix-README.txt "${FONT_S}" || die
	mv migu-1c-${PV}/migu-README.txt "${FONT_S}" || die
}
