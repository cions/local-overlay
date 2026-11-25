# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

DESCRIPTION="a privacy-focused web browser developed by Mullvad VPN and Tor Project"
HOMEPAGE="https://mullvad.net/"
SRC_URI="https://github.com/mullvad/mullvad-browser/releases/download/${PV}/mullvad-browser-linux-x86_64-${PV}.tar.xz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="
	app-accessibility/at-spi2-core:2
	app-misc/mime-types
	dev-libs/dbus-glib
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	gui-libs/gtk
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-video/ffmpeg
	sys-apps/dbus
	sys-libs/glibc
	x11-libs/cairo
	x11-themes/hicolor-icon-theme
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXt
	x11-libs/libXtst
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libXext
	x11-libs/pango
"

S="${WORKDIR}/mullvad-browser"

QA_PREBUILT="*"

src_prepare() {
	sed -i \
		-e 's@^Name=.*@Name=Mullvad Browser@' \
		-e 's@^Exec=.*@Exec=/opt/mullvad-browser/Browser/start-mullvad-browser --detach@' \
		-e 's@^X-MullvadBrowser-ExecShell=.*@X-MullvadBrowser-ExecShell=/opt/mullvad-browser/Browser/start-mullvad-browser --detach@' \
		-e 's@^Icon=.*@Icon=mullvad-browser@' \
		start-mullvad-browser.desktop || die

	default
}

src_install() {
	insinto /opt/mullvad-browser/
	doins -r Browser

	fperms +x /opt/mullvad-browser/Browser/abicheck
	fperms +x /opt/mullvad-browser/Browser/execdesktop
	fperms +x /opt/mullvad-browser/Browser/glxtest
	fperms +x /opt/mullvad-browser/Browser/*.so
	fperms +x /opt/mullvad-browser/Browser/libstdc++/libstdc++.so.6
	fperms +x /opt/mullvad-browser/Browser/mullvadbrowser
	fperms +x /opt/mullvad-browser/Browser/mullvadbrowser.real
	fperms +x /opt/mullvad-browser/Browser/start-mullvad-browser
	fperms +x /opt/mullvad-browser/Browser/updater
	fperms +x /opt/mullvad-browser/Browser/vaapitest
	fperms +x /opt/mullvad-browser/Browser/vulkantest

	touch "${D}/opt/mullvad-browser/Browser/is-packaged-app" || die

	dosym ../../opt/mullvad-browser/Browser/start-mullvad-browser /usr/bin/${PN}

	domenu start-mullvad-browser.desktop

	local size
	for size in 16 32 48 64 128; do
		newicon -s ${size} "Browser/browser/chrome/icons/default/default${size}.png" "mullvad-browser.png"
	done
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
