# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

DESCRIPTION="NVIDIA container runtime hook"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-runtime/wiki"
SRC_URI="
	https://nvidia.github.io/libnvidia-container/ubuntu18.04/amd64/libnvidia-container-tools_${PV}-1_amd64.deb
	https://nvidia.github.io/libnvidia-container/ubuntu18.04/amd64/libnvidia-container1_${PV}-1_amd64.deb
	https://nvidia.github.io/nvidia-container-runtime/ubuntu18.04/amd64/nvidia-container-toolkit_${PV}-1_amd64.deb"

LICENSE="BSD LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"
IUSE=""

RDEPEND="
	sys-libs/libcap
	sys-libs/libseccomp"
DEPEND=""

S="${WORKDIR}"

src_unpack() {
	local deb
	for deb in ${A}; do
		unpack_deb ${deb}
	done
}

src_install() {
	dobin usr/bin/nvidia-container-toolkit
	dobin usr/bin/nvidia-container-cli

	dolib.so usr/lib/x86_64-linux-gnu/libnvidia-container.so.*

	insinto /etc/nvidia-container-runtime
	doins  etc/nvidia-container-runtime/config.toml

	insinto /usr/share/doc/${P}
	gunzip usr/share/doc/*/*.gz
	doins -r usr/share/doc/*
}
