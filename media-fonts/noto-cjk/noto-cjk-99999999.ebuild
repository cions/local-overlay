# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

DESCRIPTION="Google's font family that aims to support all the world's languages"
HOMEPAGE="https://www.google.com/get/noto/"
SRC_URI="
	sans-serif? (
		l10n_ja? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip )
		l10n_ko? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKkr-hinted.zip )
		l10n_zh_CN? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKsc-hinted.zip )
		l10n_zh_TW? ( https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKtc-hinted.zip ) )
	serif? (
		l10n_ja? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip )
		l10n_ko? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKkr-hinted.zip )
		l10n_zh_CN? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKsc-hinted.zip )
		l10n_zh_TW? ( https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKtc-hinted.zip ) )"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="+sans-serif +serif l10n_ja l10n_ko l10n_zh_CN l10n_zh_TW"
RESTRICT="binchecks mirror strip test"

RDEPEND=""
DEPEND="app-arch/unzip"
S="${WORKDIR}"

FONT_SUFFIX="otf"
FONT_S="${S}"
