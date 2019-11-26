# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit toolchain-funcs

REVISION="b6aff41f09bb2c21ed7da3058c61a063726fa5d6"

NVIDIA_MODPROBE_VERSION="396.51"
NVIDIA_MODPROBE="nvidia-modprobe-${NVIDIA_MODPROBE_VERSION}"
NVIDIA_MODPROBE_URL="https://github.com/NVIDIA/nvidia-modprobe/archive/${NVIDIA_MODPROBE_VERSION}.tar.gz"

ELFTOOLCHAIN_VERSION="0.7.1"
ELFTOOLCHAIN="elftoolchain-${ELFTOOLCHAIN_VERSION}"
ELFTOOLCHAIN_URL="https://sourceforge.net/projects/elftoolchain/files/Sources/${ELFTOOLCHAIN}/${ELFTOOLCHAIN}.tar.bz2"

LIBTIRPC_VERSION="1.1.4"
LIBTIRPC="libtirpc-${LIBTIRPC_VERSION}"
LIBTIRPC_URL="https://downloads.sourceforge.net/project/libtirpc/libtirpc/${LIBTIRPC_VERSION}/${LIBTIRPC}.tar.bz2"

DESCRIPTION="NVIDIA container runtime library"
HOMEPAGE="https://github.com/NVIDIA/libnvidia-container"
SRC_URI="
	https://github.com/NVIDIA/libnvidia-container/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${NVIDIA_MODPROBE_URL} -> ${NVIDIA_MODPROBE}.tar.gz
	${ELFTOOLCHAIN_URL}
	${LIBTIRPC_URL}"

LICENSE="BSD LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"
IUSE=""

RDEPEND="
	>=sys-libs/libcap-2.10
	sys-libs/libseccomp"
DEPEND="sys-devel/bmake"

src_unpack() {
	default

	local DEPS_SRC="${S}/deps/src"

	mkdir -p "${DEPS_SRC}"
	mv "${NVIDIA_MODPROBE}" "${DEPS_SRC}"
	mv "${ELFTOOLCHAIN}" "${DEPS_SRC}"
	mv "${LIBTIRPC}" "${DEPS_SRC}"

	touch "${DEPS_SRC}/${NVIDIA_MODPROBE}/.download_stamp"
	touch "${DEPS_SRC}/${ELFTOOLCHAIN}/.download_stamp"
	touch "${DEPS_SRC}/${LIBTIRPC}/.download_stamp"
}

src_prepare() {
	sed -i "/^REVISION :=/s/.*/REVISION := $REVISION/" mk/common.mk

	eapply "${FILESDIR}/fix-ldconfig-real.patch"
	eapply "${FILESDIR}/fix-tirpc.patch"
	eapply "${FILESDIR}/fix-uidgid.patch"
	eapply_user
}

src_compile() {
	tc-ld-disable-gold
	emake WITH_TIRPC=yes all
}

src_install() {
	dobin nvidia-container-cli

	ln -sf libnvidia-container.so."${PV}" libnvidia-container.so.1
	dolib.so libnvidia-container.so.*

	dodoc COPYING* LICENSE NOTICE
}
