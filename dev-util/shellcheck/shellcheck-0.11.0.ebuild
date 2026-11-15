# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CABAL_PACKAGES="
	aeson-2.2.5.1@0
	ansi-terminal-1.1.5@0
	ansi-terminal-types-1.1.3@0
	assoc-1.1.1@2
	base-orphans-0.9.4@0
	bifunctors-5.6.3@1
	character-ps-0.1@0
	colour-2.3.7@0
	comonad-5.0.10@0
	contravariant-1.5.6@0
	data-fix-0.3.4@2
	Diff-1.0.2@0
	distributive-0.6.3@0
	dlist-1.0@2
	fgl-5.8.3.1@0
	hashable-1.5.1.0@0
	hsc2hs-0.68.10@5
	indexed-traversable-0.1.5@0
	indexed-traversable-instances-0.1.2.1@0
	integer-conversion-0.1.1@2
	integer-logarithms-1.0.5@0
	network-uri-2.6.4.2@1
	OneTuple-0.4.3@0
	optparse-applicative-0.19.0.0@1
	prettyprinter-1.7.2@0
	prettyprinter-ansi-terminal-1.1.4@0
	primitive-0.9.1.0@1
	QuickCheck-2.16.0.0@0
	random-1.3.1@0
	regex-base-0.94.0.3@0
	regex-tdfa-1.3.2.7@0
	scientific-0.3.10.0@0
	semialign-1.4@0
	semigroupoids-6.0.2@1
	splitmix-0.1.3.2@0
	StateVar-1.2.2@0
	strict-0.5.1@1
	tagged-0.8.11@0
	tasty-1.5.5@0
	terminal-size-0.3.4@1
	text-iso8601-0.1.1.2@0
	text-short-0.1.6.1@0
	th-abstraction-0.7.2.0@0
	th-compat-0.1.7@0
	these-1.2.1@3
	time-compat-1.9.9@1
	transformers-compat-0.8@0
	unordered-containers-0.2.21@2
	uuid-types-1.0.6.1@0
	vector-0.13.2.0@5
	vector-stream-0.1.0.1@4
	witherable-0.5@2
"

inherit cabal

DESCRIPTION="a static analysis tool for shell scripts"
HOMEPAGE="https://www.shellcheck.net"
SRC_URI="
	https://github.com/koalaman/shellcheck/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CABAL_PACKAGES_SRC_URIS}
"

LICENSE="GPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="
	dev-libs/gmp:=
	dev-libs/libffi:=
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-lang/ghc
	dev-haskell/cabal-install
"

src_unpack() {
	unpack "${P}.tar.gz"
	cabal_src_unpack
}

src_prepare() {
	cp "${FILESDIR}/${PF}.freeze" cabal.project.freeze || die

	default
}

src_install() {
	dobin "$(cabal list-bin exe:shellcheck)"
}
