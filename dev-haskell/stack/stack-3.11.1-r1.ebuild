# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CABAL_PACKAGES="
	aeson-2.2.4.1@0
	aeson-warning-parser-0.1.1@0
	annotated-wl-pprint-0.7.0@1
	ansi-terminal-1.1.5@0
	ansi-terminal-types-1.1.3@0
	appar-0.1.8@0
	assoc-1.1.1@2
	async-2.2.6@0
	atomic-counter-0.1.2.4@0
	attoparsec-0.14.4@6
	attoparsec-aeson-2.2.2.0@1
	auto-update-0.2.6@0
	base16-1.0@4
	base16-bytestring-1.0.2.0@1
	base64-1.0@3
	base64-bytestring-1.2.1.0@1
	basement-0.0.16@0
	base-orphans-0.9.4@0
	bifunctors-5.6.3@1
	bitvec-1.1.6.0@0
	blaze-builder-0.4.4.1@0
	blaze-html-0.9.2.0@1
	blaze-markup-0.8.3.0@2
	byteorder-1.0.4@0
	casa-client-0.0.4@0
	casa-types-0.0.3@0
	case-insensitive-1.2.1.0@0
	cborg-0.2.10.0@3
	cereal-0.5.8.3@0
	character-ps-0.1@0
	clock-0.8.4@0
	cmdargs-0.10.22@0
	colour-2.3.7@0
	comonad-5.0.10@0
	companion-0.1.0@0
	conduit-1.3.6.1@0
	conduit-combinators-1.3.0@0
	conduit-extra-1.3.8@1
	contravariant-1.5.6@0
	cookie-0.5.1@0
	cryptohash-sha256-0.11.102.1@6
	crypton-1.0.6@0
	crypton-asn1-encoding-0.10.0@0
	crypton-asn1-parse-0.10.0@0
	crypton-asn1-types-0.4.1@0
	crypton-conduit-0.2.3@1
	crypton-connection-0.4.5@1
	crypton-pem-0.3.0@0
	crypton-socks-0.6.2@0
	crypton-x509-1.8.0@1
	crypton-x509-store-1.8.0@0
	crypton-x509-system-1.8.0@0
	crypton-x509-validation-1.8.0@1
	data-default-0.8.0.2@0
	data-default-class-0.2.0.0@0
	data-fix-0.3.4@2
	digest-0.0.2.1@0
	directory-ospath-streaming-0.3@1
	distributive-0.6.3@0
	dlist-1.0@2
	easy-file-0.2.5@0
	ech-config-0.0.1@1
	echo-0.1.4@0
	ed25519-0.0.5.0@9
	extra-1.8.1@0
	fast-logger-3.2.6@0
	file-embed-0.0.16.0@0
	filelock-0.1.1.9@0
	fsnotify-0.4.4.0@0
	generic-deriving-1.14.7@0
	Glob-0.10.2@3
	hackage-security-0.6.3.2@2
	half-0.3.3@3
	happy-2.2@0
	happy-lib-2.2@0
	hashable-1.5.1.0@0
	haskell-src-exts-1.23.1@0
	haskell-src-meta-0.8.15@1
	hi-file-parser-0.1.8.0@0
	hinotify-0.4.2@0
	hpack-0.39.5@0
	hpke-0.0.0@1
	hsc2hs-0.68.10@5
	http-api-data-0.7@1
	http-client-0.7.19@0
	http-client-tls-0.3.6.4@3
	http-conduit-2.3.9.1@1
	http-download-0.2.1.0@0
	http-types-0.12.4@1
	indexed-traversable-0.1.4@2
	indexed-traversable-instances-0.1.2.1@0
	infer-license-0.2.0@0
	integer-conversion-0.1.1@2
	integer-logarithms-1.0.5@0
	iproute-1.7.15@0
	libyaml-0.1.4@0
	libyaml-clib-0.2.5@0
	lifted-base-0.2.3.12@0
	lift-type-0.1.2.0@0
	megaparsec-9.7.0@1
	memory-0.18.0@1
	microlens-0.4.14.0@0
	microlens-mtl-0.2.1.0@0
	microlens-th-0.4.3.17@1
	mime-types-0.1.2.2@0
	monad-control-1.0.3.1@0
	monad-logger-0.3.42@0
	monad-loops-0.4.3@0
	mono-traversable-1.0.21.0@0
	mtl-compat-0.2.2@0
	mustache-2.4.3.1@0
	neat-interpolation-0.5.1.4@0
	network-3.2.8.0@0
	network-byte-order-0.1.8@0
	network-uri-2.6.4.2@1
	old-locale-1.0.0.7@2
	old-time-1.1.1.0@0
	OneTuple-0.4.2.1@0
	open-browser-0.4.0.0@0
	optparse-applicative-0.19.0.0@1
	pantry-0.11.2@2
	parser-combinators-1.3.1@0
	path-0.9.6@1
	path-io-1.8.2@1
	path-pieces-0.2.1@1
	persistent-2.18.1.0@0
	persistent-sqlite-2.13.3.1@0
	persistent-template-2.12.0.0@0
	prettyprinter-1.7.1@0
	prettyprinter-ansi-terminal-1.1.3@0
	primitive-0.9.1.0@1
	project-template-0.2.1.0@0
	QuickCheck-2.16.0.0@0
	random-1.3.1@0
	replace-megaparsec-1.5.0.1@0
	resource-pool-0.5.0.0@0
	resourcet-1.3.0@0
	retry-0.9.3.1@0
	rio-0.1.24.0@0
	rio-orphans-0.1.2.0@0
	rio-prettyprint-0.1.9.0@0
	safe-0.3.21@1
	safe-exceptions-0.1.7.4@1
	scientific-0.3.8.1@0
	semialign-1.3.1.1@0
	semigroupoids-6.0.2@1
	serialise-0.2.6.1@5
	silently-1.2.5.4@0
	split-0.2.5@0
	splitmix-0.1.3.2@0
	StateVar-1.2.2@0
	static-bytes-0.1.1@0
	stm-chans-3.0.0.11@0
	streaming-commons-0.2.3.1@0
	strict-0.5.1@1
	string-interpolate-0.3.4.0@7
	syb-0.7.4@0
	tagged-0.8.10@2
	tar-0.7.0.0@2
	tar-conduit-0.4.1@0
	tasty-1.5.4@1
	temporary-1.3@0
	text-conversions-0.3.1.1@0
	text-iso8601-0.1.1.1@0
	text-metrics-0.3.3@1
	text-short-0.1.6.1@0
	th-abstraction-0.7.2.0@0
	th-compat-0.1.7@0
	these-1.2.1@3
	th-expand-syns-0.4.12.0@1
	th-lift-0.8.7@0
	th-lift-instances-0.1.20@0
	th-orphans-0.13.17@0
	th-reify-many-0.1.10@0
	time-compat-1.9.9@1
	time-hourglass-0.3.0@0
	tls-2.2.2@1
	transformers-base-0.4.6.1@0
	transformers-compat-0.7.2@0
	typed-process-0.2.13.0@0
	unix-compat-0.7.4.1@0
	unix-time-0.4.17@0
	unliftio-0.2.25.1@0
	unliftio-core-0.2.1.0@4
	unordered-containers-0.2.21@2
	utf8-string-1.0.2@0
	uuid-types-1.0.6.1@0
	vault-0.3.1.6@0
	vector-0.13.2.0@5
	vector-algorithms-0.9.1.0@1
	vector-stream-0.1.0.1@4
	witherable-0.5@2
	yaml-0.11.11.2@2
	zip-archive-0.4.3.2@1
	zlib-0.7.1.1@1
"

inherit cabal shell-completion

DESCRIPTION="The Haskell Tool Stack"
HOMEPAGE="https://haskellstack.org/"
SRC_URI="
	https://github.com/commercialhaskell/stack/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CABAL_PACKAGES_SRC_URIS}
"

LICENSE="BSD GPL-3 LGPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="
	dev-libs/gmp:=
	dev-libs/libffi:=
	virtual/zlib:=
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-lang/ghc
	dev-haskell/cabal-install
	virtual/pkgconfig
"

src_unpack() {
	unpack "${P}.tar.gz"

	cabal_src_unpack
}

src_prepare() {
	echo "packages: ." > cabal.project
	cp "${FILESDIR}/${PF}.freeze" cabal.project.freeze || die

	default
}

src_configure() {
	local ecabalconf=(
		--flags="-developer-mode disable-git-info -integration-tests"
		--allow-newer="cborg:base"
		--allow-newer="cborg:containers"
		--allow-newer="persistent:template-haskell"
		--allow-newer="serialise:base"
		--allow-newer="serialise:containers"
		--allow-newer="serialise:time"
	)

	cabal_src_configure "${ecabalconf[@]}"
}

src_install() {
	local stack="${WORKDIR}/_build/build/x86_64-linux/ghc-$(ghc-version)/${P}/opt/build/stack/stack"

	dobin "${stack}"

	"${stack}" --bash-completion-script stack > "${T}"/stack.bash
	"${stack}" --zsh-completion-script stack > "${T}"/stack.zsh
	"${stack}" --fish-completion-script stack > "${T}"/stack.fish

	newbashcomp "${T}"/stack.bash stack
	newzshcomp "${T}"/stack.zsh _stack
	dofishcomp "${T}"/stack.fish
}
