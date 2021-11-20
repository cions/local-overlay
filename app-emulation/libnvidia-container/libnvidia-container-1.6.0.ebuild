# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit toolchain-funcs

REVISION="dd2c49d6699e4d8529fbeaa58ee91554977b652e"

NVIDIA_MODPROBE_VERSION="495.44"
NVIDIA_MODPROBE="nvidia-modprobe-${NVIDIA_MODPROBE_VERSION}"
NVIDIA_MODPROBE_URL="https://github.com/NVIDIA/nvidia-modprobe/archive/${NVIDIA_MODPROBE_VERSION}.tar.gz"

LIBTIRPC_VERSION="1.1.4"
LIBTIRPC="libtirpc-${LIBTIRPC_VERSION}"
LIBTIRPC_URL="https://downloads.sourceforge.net/project/libtirpc/libtirpc/${LIBTIRPC_VERSION}/${LIBTIRPC}.tar.bz2"

DESCRIPTION="NVIDIA container runtime library"
HOMEPAGE="https://github.com/NVIDIA/libnvidia-container"
SRC_URI="
	https://github.com/NVIDIA/libnvidia-container/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${NVIDIA_MODPROBE_URL} -> ${NVIDIA_MODPROBE}.tar.gz
	${LIBTIRPC_URL}"

LICENSE="Apache-2.0 BSD LGPL-3+ MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"
IUSE=""
DOCS="COPYING COPYING.LESSER LICENSE NOTICE README.md"

RDEPEND="
	>=sys-libs/libcap-2.10
	sys-libs/libseccomp
	virtual/libelf"
DEPEND="sys-devel/bmake"

src_unpack() {
	default

	local DEPS_SRC="${S}/deps/src"
	mkdir -p "${DEPS_SRC}"

	mv "${NVIDIA_MODPROBE}" "${DEPS_SRC}"
	touch "${DEPS_SRC}/${NVIDIA_MODPROBE}/.download_stamp"

	mv "${LIBTIRPC}" "${DEPS_SRC}"
	touch "${DEPS_SRC}/${LIBTIRPC}/.download_stamp"
}

src_prepare() {
	eapply "${FILESDIR}"/${P}-fix-tirpc.patch
	eapply "${FILESDIR}"/${P}-fix-uidgid.patch
	eapply "${FILESDIR}"/${P}-nvidia-modprobe.patch

	default
}

src_compile() {
	tc-ld-disable-gold

	emake \
		DESTDIR='$(DEPS_DIR)' \
		REVISION="${REVISION}" \
		WITH_LIBELF=yes \
		WITH_TIRPC=yes \
		prefix=/usr \
		all
}

src_install() {
	dobin nvidia-container-cli
	ln -sf libnvidia-container.so."${PV}" libnvidia-container.so."$(ver_cut 1)"
	ln -sf libnvidia-container.so."$(ver_cut 1)" libnvidia-container.so
	dolib.so libnvidia-container.so*
	einstalldocs
}
