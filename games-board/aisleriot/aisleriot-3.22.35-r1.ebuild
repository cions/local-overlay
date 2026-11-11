# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils meson

DESCRIPTION="A collection of solitaire card games for GNOME"
HOMEPAGE="https://wiki.gnome.org/Apps/Aisleriot"
SRC_URI="https://gitlab.gnome.org/GNOME/aisleriot/-/archive/${PV}/${P}.tar.bz2"

LICENSE="FDL-1.1+ GPL-3+ LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gnome pysolfc sound"
RESTRICT="mirror strip test"

RDEPEND="
	>=dev-libs/glib-2.32:2
	>=dev-scheme/guile-2.0.5[deprecated,regex]
	>=gnome-base/librsvg-2.32:2
	>=x11-libs/cairo-1.10
	>=x11-libs/gtk+-3.18:3
	gnome? ( >=gnome-base/gconf-2.0:2 )
	pysolfc? ( games-board/pysolfc )
	sound? ( >=media-libs/libcanberra-0.26[gtk3] )
"
DEPEND="
	${RDEPEND}
	dev-libs/libxml2
	x11-misc/shared-mime-info
"
BDEPEND="
	app-arch/gzip
	app-arch/bzip2
	>=app-text/yelp-tools-3.1.1
	dev-util/desktop-file-utils
	dev-util/glib-utils
	virtual/pkgconfig
"

QA_PREBUILT='*.go'

src_prepare() {
	gnome2_environment_reset

	sed -i 's/default_teme_format/default_theme_format/' meson.build || die

	default
}

src_configure() {
	local emesonargs=(
		-Ddefault_theme_format="svg-rsvg"
		-Ddocs="true"
		-Dhelp_method="$(usex gnome ghelp library)"
		-Dtheme_kde="false"
		-Dtheme_pysol_path="${EPREFIX}/usr/share/pysolfc"
		$(meson_use gnome gconf)
		$(meson_use pysolfc theme_pysol)
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
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	gnome2_schemas_update
	use gnome && gnome2_gconf_uninstall
}
