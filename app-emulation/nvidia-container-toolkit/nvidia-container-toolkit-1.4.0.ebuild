# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit unpacker

DESCRIPTION="NVIDIA container runtime hook"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-runtime"
SRC_URI="https://nvidia.github.io/nvidia-container-runtime/ubuntu20.04/amd64/${PN}_${PV}-1_amd64.deb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"
IUSE=""

RDEPEND="
	>=app-emulation/libnvidia-container-1.3.1
	<app-emulation/libnvidia-container-2.0.0"
DEPEND=""

S="${WORKDIR}"

src_install() {
	dobin usr/bin/nvidia-container-toolkit
	dosym nvidia-container-toolkit /usr/bin/nvidia-container-runtime-hook

	insinto /etc/nvidia-container-runtime
	doins etc/nvidia-container-runtime/config.toml

	gunzip usr/share/doc/${PN}/*.gz
	dodoc usr/share/doc/${PN}/*
}
