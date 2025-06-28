# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit gnome2-utils meson

DESCRIPTION="A collection of solitaire card games for GNOME"
HOMEPAGE="https://wiki.gnome.org/Apps/Aisleriot https://gitlab.gnome.org/GNOME/aisleriot"
SRC_URI="https://gitlab.gnome.org/GNOME/aisleriot/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3+ LGPL-3+ FDL-1.1+ FDL-1.3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="gnome qt5 sound"

RDEPEND="
	>=dev-libs/glib-2.32:2
	>=dev-scheme/guile-2.0.5[deprecated,regex]
	>=gnome-base/librsvg-2.32:2
	>=x11-libs/cairo-1.10
	>=x11-libs/gtk+-3.18:3
	gnome? ( >=gnome-base/gconf-2.0:2 )
	qt5? ( >=dev-qt/qtsvg-5.0:5 )
	sound? ( >=media-libs/libcanberra-0.26[gtk3] )"
DEPEND="${RDEPEND}
	app-arch/gzip
	app-arch/bzip2
	>=app-text/yelp-tools-3.1.1
	dev-libs/libxml2
	dev-util/desktop-file-utils
	dev-util/glib-utils
	x11-misc/shared-mime-info
	virtual/pkgconfig"

src_prepare() {
	gnome2_environment_reset

	eapply "${FILESDIR}"/${PN}-fix-typo.patch

	default
}

src_configure() {
	local emesonargs=(
		-Ddefault_theme_format=$(usex qt5 svg-qtsvg svg-rsvg)
		-Ddocs=true
		-Dhelp_method=$(usex gnome ghelp library)
		-Dtheme_kde=true
		-Dtheme_kde_path="${EPREFIX}"/usr/share/apps/carddecks
		-Dtheme_pysol=true
		-Dtheme_pysol_path="${EPREFIX}"/usr/share/pysolfc
		$(meson_use gnome gconf)
		$(meson_use qt5 theme_svg_qtsvg)
		$(meson_use sound)
	)
	meson_src_configure
}

pkg_preinst() {
	use gnome && gnome2_gconf_savelist
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	gnome2_schemas_update
	use gnome && gnome2_gconf_install

	elog "Aisleriot can use additional card themes from games-board/pysolfc"
	elog "and kde-base/libkdegames."
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	gnome2_schemas_update
	use gnome && gnome2_gconf_uninstall
}
