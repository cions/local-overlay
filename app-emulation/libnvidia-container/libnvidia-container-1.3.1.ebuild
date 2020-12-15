# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit toolchain-funcs

REVISION="ac02636a318fe7dcc71eaeb3cc55d0c8541c1072"

NVIDIA_MODPROBE_VERSION="450.57"
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
	mv "${LIBTIRPC}" "${DEPS_SRC}"

	touch "${DEPS_SRC}/${NVIDIA_MODPROBE}/.download_stamp"
	touch "${DEPS_SRC}/${LIBTIRPC}/.download_stamp"
}

src_prepare() {
	sed -i "/^REVISION :=/s/.*/REVISION := $REVISION/" mk/common.mk

	eapply "${FILESDIR}"/${P}-fix-tirpc.patch
	eapply "${FILESDIR}"/${P}-nvidia-modprobe.patch
	eapply "${FILESDIR}"/${P}-fix-uidgid.patch

	default
}

src_compile() {
	tc-ld-disable-gold
	emake WITH_LIBELF=yes WITH_TIRPC=yes all
}

src_install() {
	dobin nvidia-container-cli
	dosym ldconfig /sbin/ldconfig.real

	ln -sf libnvidia-container.so."${PV}" libnvidia-container.so."$(ver_cut 1)"
	ln -sf libnvidia-container.so."$(ver_cut 1)" libnvidia-container.so
	dolib.so libnvidia-container.so*

	dodoc COPYING* LICENSE NOTICE
}
