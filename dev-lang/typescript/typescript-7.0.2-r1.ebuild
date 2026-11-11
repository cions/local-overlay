# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Superset of JavaScript with optional static typing (native Go compiler)"
HOMEPAGE="https://www.typescriptlang.org/"
SRC_URI="https://github.com/microsoft/TypeScript/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 BSD BSD-2 CC-BY-4.0 MIT Unicode-DFS-2016 W3C"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="!dev-lang/typescript-bin"
BDEPEND=">=dev-lang/go-1.26"

MY_P="TypeScript-${PV}"
S="${WORKDIR}/${MY_P}/tsc"

PATCHES=(
	"${FILESDIR}"/typescript-7.0.2-typescript-native-preview.patch
)

QA_PRESTRIPPED="usr/lib/typescript/tsc"

src_unpack() {
	unpack "${FILESDIR}/${PF}-vendor.tar.xz"
	go-module_src_unpack
}

src_compile() {
	ego build -tags="noembed" -o tsgo ./cmd/tsgo
}

src_install() {
	local libdir="/usr/lib/typescript"

	exeinto "${libdir}"
	newexe tsgo tsc

	insinto "${libdir}"
	doins internal/bundled/libs/*.d.ts

	dosym -r "${libdir}"/tsc /usr/bin/tsc

	dodoc README.md NOTICE.txt
}
