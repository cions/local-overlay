# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils gnome-games

DESCRIPTION="A collection of solitaire card games for GNOME"
HOMEPAGE="https://wiki.gnome.org/action/show/Apps/Aisleriot"

LICENSE="GPL-3 LGPL-3 FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="gnome qt4 sound"

RDEPEND="
	>=dev-libs/glib-2.32:2
	>=dev-scheme/guile-2.0.5[deprecated,regex]
	>=gnome-base/librsvg-2.32:2
	>=x11-libs/cairo-1.10
	>=x11-libs/gtk+-3.4:3
	gnome? ( >=gnome-base/gconf-2.0:2 )
	qt4? ( >=dev-qt/qtsvg-4.4:4 )
	sound? ( >=media-libs/libcanberra-0.26[gtk3] )"
DEPEND="${RDEPEND}
	app-arch/gzip
	>=app-text/yelp-tools-3.1.1
	dev-libs/libxml2
	>=dev-util/intltool-0.40.4
	dev-util/itstool
	sys-apps/lsb-release
	>=sys-devel/gettext-0.12
	virtual/pkgconfig
	gnome? ( app-text/docbook-xml-dtd:4.3 )"

src_prepare() {
	eautoreconf
	gnome2_src_prepare
}

src_configure() {
	local myconf=(
		--with-gtk=3.0
		--with-guile=auto
		--with-pysol-card-theme-path="${EPREFIX}${GAMES_DATADIR}"/pysolfc
	)

	if use gnome; then
		myconf+=(
			--with-platform=gnome
			--with-help-method=ghelp
		)
	else
		myconf+=(
			--with-platform=gtk-only
			--with-help-method=library
		)
	fi

	if use qt4; then
		myconf+=(
			--with-card-theme-formats=all
			--with-kde-card-theme-path="${EPREFIX}"/usr/share/apps/carddecks
		)
	else
		myconf+=( --with-card-theme-formats=svg,fixed,pysol )
	fi

	if use sound; then
		myconf+=( --enable-sound )
	else
		myconf+=( --disable-sound )
	fi

	gnome2_src_configure "${myconf[@]}"
}

pkg_postinst() {
	gnome2_pkg_postinst

	elog "Aisleriot can use additional card themes from games-board/pysolfc"
	elog "and kde-base/libkdegames."
}
