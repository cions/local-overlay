# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A modern, extremely fast, JavaScript and CSS bundler and minifier"
HOMEPAGE="https://esbuild.github.io/"
SRC_URI="https://github.com/evanw/esbuild/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD MIT"
SLOT="${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror test"

QA_PRESTRIPPED="usr/bin/esbuild-${PV}"

src_unpack() {
	unpack "${FILESDIR}/${PF}-vendor.tar.xz"
	go-module_src_unpack
}

src_compile() {
	ego build -mod=vendor ./cmd/esbuild
}

src_install() {
	newbin esbuild esbuild-${PV}
}
