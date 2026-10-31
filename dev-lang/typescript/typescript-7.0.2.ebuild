# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Superset of JavaScript with optional static typing (native Go compiler)"
HOMEPAGE="https://www.typescriptlang.org/ https://github.com/microsoft/TypeScript/"
SRC_URI="https://github.com/microsoft/TypeScript/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

MY_P="TypeScript-${PV}"
S="${WORKDIR}/${MY_P}/tsc"

LICENSE="Apache-2.0 BSD BSD-2 CC-BY-4.0 MIT Unicode-DFS-2016 W3C"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="!dev-lang/typescript-bin"
BDEPEND=">=dev-lang/go-1.26"

src_unpack() {
	unpack "${FILESDIR}/typescript-${PV}-vendor.tar.xz"
	go-module_src_unpack
}

src_compile() {
	CGO_ENABLED=0 ego build -tags="noembed" -o tsgo ./cmd/tsgo
}

src_test() {
	ego test -tags="noembed" ./internal/{core,tspath,scanner,parser}/...
}

src_install() {
	local dest=/usr/lib/${PN}

	exeinto "${dest}"
	newexe tsgo tsc

	insinto "${dest}"
	doins internal/bundled/libs/*.d.ts

	dosym -r "${dest}"/tsc /usr/bin/tsc

	dodoc README.md NOTICE.txt
}
