# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils virtualx pax-utils

DESCRIPTION="VDPAU driver with VA-API/OpenGL backend."
HOMEPAGE="https://github.com/i-rinat/libvdpau-va-gl/"
SRC_URI="https://github.com/i-rinat/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	media-libs/glu
	virtual/ffmpeg
	virtual/opengl
	x11-libs/libva[X]
	x11-libs/libvdpau
	x11-libs/libX11
	x11-libs/libXext"
DEPEND="${RDEPEND}"

DOCS=(ChangeLog README.md)

src_compile() {
	cmake-utils_src_compile
	echo "export VDPAU_DRIVER=va_gl" > "${BUILD_DIR}/libvdpau_va_gl.sh"
	if use test; then
		cmake-utils_src_make build-tests
		pax-mark m "${BUILD_DIR}"/tests/test-*
	fi
}

src_test() {
	VIRTUALX_COMMAND=cmake-utils_src_test virtualmake
}

src_install() {
	cmake-utils_src_install
	insinto /etc/profile.d
	doins "${BUILD_DIR}"/libvdpau_va_gl.sh
}
