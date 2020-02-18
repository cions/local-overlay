# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit unpacker

DESCRIPTION="NVIDIA container runtime hook"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-runtime/wiki"
SRC_URI="https://nvidia.github.io/nvidia-container-runtime/ubuntu18.04/amd64/${PN}_${PV}-1_amd64.deb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"
IUSE=""

RDEPEND="
	>=app-emulation/libnvidia-container-0.1.0
	<app-emulation/libnvidia-container-2.0.0"
DEPEND=""

S="${WORKDIR}"

src_unpack() {
	unpacker_src_unpack
}

src_install() {
	dobin usr/bin/nvidia-container-toolkit
	dosym nvidia-container-toolkit /usr/bin/nvidia-container-runtime-hook

	insinto /etc/nvidia-container-runtime
	doins etc/nvidia-container-runtime/config.toml

	gunzip usr/share/doc/${PN}/*.gz
	dodoc usr/share/doc/${PN}/*
}
