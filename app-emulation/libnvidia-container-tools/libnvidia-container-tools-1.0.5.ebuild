# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit unpacker

DESCRIPTION="NVIDIA container runtime library (command-line tools)"
HOMEPAGE="https://github.com/NVIDIA/libnvidia-container"
SRC_URI="https://nvidia.github.io/libnvidia-container/ubuntu18.04/amd64/${PN}_${PV}-1_amd64.deb"

LICENSE="BSD LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"
IUSE=""

RDEPEND="
	>=app-emulation/libnvidia-container1-1.0.5
	>=sys-libs/libcap-2.10"
DEPEND=""

S="${WORKDIR}"

src_unpack() {
	unpacker_src_unpack
}

src_install() {
	dobin usr/bin/nvidia-container-cli

	gunzip usr/share/doc/${PN}/*.gz
	dodoc usr/share/doc/${PN}/*
}