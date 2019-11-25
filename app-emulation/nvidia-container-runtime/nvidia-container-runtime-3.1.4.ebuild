# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit unpacker

DESCRIPTION="NVIDIA container runtime"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-runtime/wiki"
SRC_URI="https://nvidia.github.io/nvidia-container-runtime/ubuntu18.04/amd64/${PN}_${PV}-1_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"
IUSE=""

RDEPEND="
	>=app-emulation/nvidia-container-toolkit-1.0.5
	<app-emulation/nvidia-container-toolkit-2.0.0
	sys-libs/libseccomp"
DEPEND=""

S="${WORKDIR}"

src_unpack() {
	unpacker_src_unpack
}

src_install() {
	dobin usr/bin/nvidia-container-runtime

	gunzip usr/share/doc/${PN}/*.gz
	dodoc usr/share/doc/${PN}/*
}
