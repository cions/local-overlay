# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="WebP loader plugin for Imlib2"
HOMEPAGE="http://www.hauweele.net/~gawen/imlib2-webp.html"
EGIT_REPO_URI="https://github.com/gawen947/imlib2-webp.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	media-libs/imlib2
	media-libs/libwebp"
DEPEND="${RDEPEND}"

PATCHES=("${FILESDIR}/${P}-fix-permissions.patch")
