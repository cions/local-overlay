# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

DESCRIPTION="Google's font family that aims to support all the world's languages"
HOMEPAGE="https://www.google.com/get/noto/"
SRC_URI="
	sans-serif? (
		linguas_ja? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip )
		linguas_ko? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKkr-hinted.zip )
		linguas_zh_CN? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKsc-hinted.zip )
		linguas_zh_TW? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKtc-hinted.zip ) )
	serif? (
		linguas_ja? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip )
		linguas_ko? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKkr-hinted.zip )
		linguas_zh_CN? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKsc-hinted.zip )
		linguas_zh_TW? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKtc-hinted.zip ) )"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="+sans-serif +serif linguas_ja linguas_ko linguas_zh_CN linguas_zh_TW"
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/unzip"
S="${WORKDIR}"

FONT_SUFFIX="otf"
FONT_S="${S}"
