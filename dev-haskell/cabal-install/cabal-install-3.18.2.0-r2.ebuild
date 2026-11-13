# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CABAL_PACKAGES="
	aeson-2.2.5.0@0
	alex-3.5.4.2@0
	ansi-terminal-1.1.5@0
	ansi-terminal-types-1.1.3@0
	ansi-wl-pprint-1.1.1@0
	assoc-1.1.1@2
	async-2.2.6@0
	atomic-counter-0.1.2.4@0
	attoparsec-0.14.4@6
	base16-bytestring-1.0.2.0@1
	base64-bytestring-1.2.1.0@1
	base-orphans-0.9.4@0
	bifunctors-5.6.3@1
	character-ps-0.1@0
	charset-0.3.12@0
	colour-2.3.7@0
	comonad-5.0.10@0
	contravariant-1.5.6@0
	cryptohash-sha256-0.11.102.1@6
	data-fix-0.3.4@2
	directory-1.3.11.0@0
	directory-ospath-streaming-0.3@1
	distributive-0.6.3@0
	dlist-1.0@2
	echo-0.1.4@0
	ed25519-0.0.5.0@9
	edit-distance-0.2.2.1@1
	file-io-0.2.0@0
	hackage-security-0.6.3.3@0
	hashable-1.5.1.0@0
	hsc2hs-0.68.10@5
	HTTP-4000.5.0@1
	indexed-traversable-0.1.5@0
	indexed-traversable-instances-0.1.2.1@0
	integer-conversion-0.1.1@2
	integer-logarithms-1.0.5@0
	network-3.2.8.0@0
	network-uri-2.6.4.2@1
	OneTuple-0.4.3@0
	open-browser-0.5.1.0@0
	optparse-applicative-0.19.0.0@1
	parsers-0.12.12@1
	prettyprinter-1.7.2@0
	prettyprinter-ansi-terminal-1.1.4@0
	prettyprinter-compat-ansi-wl-pprint-1.1.1@0
	primitive-0.9.1.0@1
	process-1.6.30.0@0
	QuickCheck-2.16.0.0@0
	random-1.3.1@0
	regex-base-0.94.0.3@0
	regex-posix-0.96.0.2@0
	rere-0.2.0.2@2
	resolv-0.2.0.3@0
	safe-exceptions-0.1.7.4@1
	scientific-0.3.8.1@0
	semaphore-compat-2.0.1@0
	semialign-1.4@0
	semigroupoids-6.0.2@1
	splitmix-0.1.3.2@0
	StateVar-1.2.2@0
	strict-0.5.1@1
	tagged-0.8.10@2
	tar-0.7.1.0@1
	tasty-1.5.4@1
	tasty-quickcheck-0.11.1@7
	terminal-size-0.3.4@1
	text-iso8601-0.1.1.1@0
	text-short-0.1.6.1@0
	th-abstraction-0.7.2.0@0
	th-compat-0.1.7@0
	these-1.2.1@3
	time-1.14@1
	time-compat-1.9.9@1
	transformers-compat-0.8@0
	tree-diff-0.3.5@1
	typed-process-0.2.13.0@0
	unix-2.8.8.0@1
	unliftio-core-0.2.1.0@4
	unordered-containers-0.2.21@2
	uuid-types-1.0.6.1@0
	vector-0.13.2.0@5
	vector-stream-0.1.0.1@4
	witherable-0.5@2
	zlib-0.7.1.1@1
	zlib-clib-1.3.2@0
"

inherit cabal

DESCRIPTION="The command-line interface for Cabal and Hackage"
HOMEPAGE="https://www.haskell.org/cabal/"
SRC_URI="
	https://github.com/haskell/cabal/archive/refs/tags/cabal-install-v${PV}.tar.gz
	!system-bootstrap? (
		https://github.com/haskell/cabal/releases/download/cabal-install-v${PV}/cabal-install-${PV}-x86_64-linux-unknown.tar.xz
	)
	${CABAL_PACKAGES_SRC_URIS}
"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="+system-bootstrap"
RESTRICT="mirror test"

RDEPEND="
	dev-libs/gmp:=
	dev-libs/libffi:=
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-lang/ghc
	system-bootstrap? ( dev-haskell/cabal-install )
"

S="${WORKDIR}/cabal-cabal-install-v${PV}"

src_unpack() {
	unpack "cabal-install-v${PV}.tar.gz"
	use system-bootstrap || unpack "${P}-x86_64-linux-unknown.tar.xz"
	cabal_src_unpack
}

src_prepare() {
	cp "${FILESDIR}/${PF}.freeze" cabal.release.project.freeze || die

	default
}

src_configure() {
	if ! use system-bootstrap; then
		export CABAL="${WORKDIR}/cabal"
	fi

	cabal_src_configure --project-file="cabal.release.project"
}

src_compile() {
	cabal_src_compile --project-file="cabal.release.project" cabal-install
}

src_install() {
	dobin "${WORKDIR}/_build/build/x86_64-linux/ghc-$(ghc-version)/${P}/x/cabal/opt/build/cabal/cabal"
}
