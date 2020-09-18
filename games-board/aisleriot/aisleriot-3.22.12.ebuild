# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

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

	eapply "${FILESDIR}"/${PN}-fix-shebang.patch
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
	local f

	XDG_ECLASS_DESKTOPFILES=()
	while IFS= read -r -d '' f; do
		XDG_ECLASS_DESKTOPFILES+=( ${f} )
	done < <(cd "${ED}" && find 'usr/share/applications' -type f -print0 2>/dev/null)

	XDG_ECLASS_ICONFILES=()
	while IFS= read -r -d '' f; do
		XDG_ECLASS_ICONFILES+=( ${f} )
	done < <(cd "${ED}" && find 'usr/share/icons' -type f -print0 2>/dev/null)

	XDG_ECLASS_MIMEINFOFILES=()
	while IFS= read -r -d '' f; do
		XDG_ECLASS_MIMEINFOFILES+=( ${f} )
	done < <(cd "${ED}" && find 'usr/share/mime' -type f -print0 2>/dev/null)

	gnome2_gconf_savelist
	gnome2_schemas_savelist
}

pkg_postinst() {
	if [[ ${#XDG_ECLASS_DESKTOPFILES[@]} -gt 0 ]]; then
		xdg_desktop_database_update
	else
		debug-print "No .desktop files to add to database"
	fi

	if [[ ${#XDG_ECLASS_ICONFILES[@]} -gt 0 ]]; then
		xdg_icon_cache_update
	else
		debug-print "No icon files to add to cache"
	fi

	if [[ ${#XDG_ECLASS_MIMEINFOFILES[@]} -gt 0 ]]; then
		xdg_mimeinfo_database_update
	else
		debug-print "No mime info files to add to database"
	fi

	gnome2_gconf_install
	if [[ -n ${GNOME2_ECLASS_GLIB_SCHEMAS} ]]; then
		gnome2_schemas_update
	fi

	elog "Aisleriot can use additional card themes from games-board/pysolfc"
	elog "and kde-base/libkdegames."
}

pkg_postrm() {
	if [[ ${#XDG_ECLASS_DESKTOPFILES[@]} -gt 0 ]]; then
		xdg_desktop_database_update
	else
		debug-print "No .desktop files to add to database"
	fi

	if [[ ${#XDG_ECLASS_ICONFILES[@]} -gt 0 ]]; then
		xdg_icon_cache_update
	else
		debug-print "No icon files to add to cache"
	fi

	if [[ ${#XDG_ECLASS_MIMEINFOFILES[@]} -gt 0 ]]; then
		xdg_mimeinfo_database_update
	else
		debug-print "No mime info files to add to database"
	fi

	if [[ -n ${GNOME2_ECLASS_GLIB_SCHEMAS} ]]; then
		gnome2_schemas_update
	fi
}
