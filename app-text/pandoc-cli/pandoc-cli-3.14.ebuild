# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CABAL_PACKAGES="
	aeson-2.3.2.0@1
	aeson-pretty-0.8.11@0
	alex-3.5.4.2@0
	ansi-terminal-1.1.5@0
	ansi-terminal-types-1.1.3@0
	appar-0.1.8@0
	asciidoc-0.1.1.1@0
	assoc-1.1.1@2
	async-2.2.6@0
	attoparsec-0.14.4@6
	attoparsec-aeson-2.2.2.0@1
	auto-update-0.2.8@0
	base16-2.0@0
	base16-bytestring-1.0.2.0@1
	base64-2.1@0
	base64-bytestring-1.2.1.0@1
	base-compat-0.15.0@0
	base-orphans-0.9.4@0
	base-unicode-symbols-0.2.4.2@0
	bifunctors-5.6.3@1
	binary-0.8.9.3@0
	bitvec-1.1.6.0@0
	blaze-builder-0.4.4.1@0
	blaze-html-0.9.2.0@1
	blaze-markup-0.8.3.0@2
	boring-0.2.2.1@1
	bsb-http-chunked-0.0.0.4@4
	byteorder-1.0.4@0
	Cabal-3.18.2.0@0
	cabal-doctest-1.0.13@0
	Cabal-syntax-3.18.2.0@0
	call-stack-0.4.0@0
	case-insensitive-1.2.2.0@0
	cassava-0.5.4.1@0
	cborg-0.2.10.0@3
	cereal-0.5.8.3@0
	character-ps-0.1@0
	citeproc-0.14.2@0
	cmdargs-0.10.22@0
	colour-2.3.7@0
	commonmark-0.3.2@0
	commonmark-extensions-0.2.8@0
	commonmark-pandoc-0.3.0.2@0
	comonad-5.0.10@0
	conduit-1.3.6.1@0
	conduit-extra-1.3.8@1
	constraints-0.14.4@0
	containers-0.7@0
	contravariant-1.5.6@0
	cookie-0.5.1@0
	cryptohash-md5-0.11.101.0@6
	crypton-2.2.6@1
	crypton-asn1-encoding-0.10.0@0
	crypton-asn1-parse-0.10.0@0
	crypton-asn1-types-0.4.1@0
	crypton-connection-0.4.6@3
	crypton-pem-0.3.0@0
	crypton-socks-0.6.2@0
	crypton-x509-1.10.1@0
	crypton-x509-store-1.10.0@0
	crypton-x509-system-1.10.0@0
	crypton-x509-validation-1.10.1@0
	data-default-0.8.0.2@0
	data-default-class-0.2.0.0@0
	data-fix-0.3.4@2
	dec-0.0.6@2
	Diff-2.0.1@0
	digest-0.0.2.1@0
	directory-1.3.11.0@0
	distributive-0.6.3@0
	djot-0.1.4.3@0
	dlist-1.0@2
	doclayout-0.6@0
	doctemplates-0.11.1@0
	easy-file-0.2.6@0
	ech-config-0.0.2@0
	emojis-0.1.6@0
	erf-2.0.0.0@0
	fast-logger-3.2.9@0
	file-embed-0.0.16.0@0
	file-io-0.2.0@0
	generics-sop-0.5.1.4@3
	Glob-0.10.2@3
	gridtables-0.1.1.1@0
	haddock-library-1.11.0@6
	half-0.3.3@3
	happy-2.2@0
	happy-lib-2.2@0
	hashable-1.5.1.0@0
	haskell-lexer-1.2.1@0
	hpke-0.4.0@0
	hsc2hs-0.68.10@5
	hslua-2.5.0@0
	hslua-aeson-2.3.2.1@0
	hslua-classes-2.3.2@0
	hslua-cli-1.4.4@0
	hslua-core-2.3.2.1@0
	hslua-list-1.1.4@0
	hslua-marshalling-2.3.2@0
	hslua-module-doclayout-1.2.1.1@1
	hslua-module-path-1.2.0@0
	hslua-module-system-1.3.0@0
	hslua-module-text-1.2.0@0
	hslua-module-version-1.2.0.1@0
	hslua-module-zip-1.2.1@1
	hslua-objectorientation-2.5.0@0
	hslua-packaging-2.4.1@0
	hslua-repl-0.1.2@1
	hslua-typing-0.2.0@0
	http2-5.4.13@1
	http-api-data-0.7@1
	http-client-0.7.19@0
	http-client-tls-0.4.0@0
	http-date-0.0.13@0
	http-media-0.8.1.1@3
	http-semantics-0.4.2@0
	http-types-0.12.6@0
	HUnit-1.6.2.0@0
	indexed-traversable-0.1.5@0
	indexed-traversable-instances-0.1.2.1@0
	integer-conversion-0.1.1@2
	integer-logarithms-1.0.5@0
	iproute-1.8.0@0
	ipynb-0.2@1
	isocline-1.1.0@0
	jira-wiki-markup-1.5.1@1
	JuicyPixels-3.3.9@1
	lpeg-1.1.0.1@0
	lua-2.3.4@0
	mime-types-0.1.2.2@0
	mmorph-1.2.2@2
	monad-control-1.0.3.1@0
	mono-traversable-1.0.21.0@0
	network-3.2.13.0@0
	network-byte-order-0.1.9@0
	network-control-0.1.7@0
	network-uri-2.6.4.2@1
	old-locale-1.0.0.7@2
	OneTuple-0.4.3@0
	Only-0.1@2
	optparse-applicative-0.19.0.0@1
	ordered-containers-0.2.5@0
	pandoc-lua-marshal-0.3.3@0
	pandoc-types-1.23.1.2@0
	parsec-3.1.18.0@1
	prettyprinter-1.7.2@0
	prettyprinter-ansi-terminal-1.1.4@0
	pretty-show-1.10@0
	primitive-0.9.1.0@1
	process-1.6.30.0@0
	psqueues-0.2.8.3@2
	QuickCheck-2.18.0.0@0
	quote-quot-0.2.2.0@0
	ram-0.22.1@0
	random-1.3.1@0
	recv-0.1.3@0
	regex-base-0.94.0.3@0
	regex-tdfa-1.3.2.7@0
	resourcet-1.3.0@0
	safe-0.3.21@1
	scientific-0.3.10.0@0
	semialign-1.4@0
	semigroupoids-6.0.2@1
	serialise-0.2.6.1@5
	servant-0.20.3.0@7
	servant-server-0.20.3.0@5
	simple-sendfile-0.2.33@0
	singleton-bool-0.1.8@2
	skylighting-0.15.0.1@0
	skylighting-core-0.15.0.1@0
	skylighting-format-ansi-0.1@0
	skylighting-format-blaze-html-0.1.2.2@0
	skylighting-format-context-0.1.0.2@0
	skylighting-format-latex-0.1@0
	skylighting-format-typst-0.1@0
	some-1.1@0
	sop-core-0.5.0.2@6
	split-0.2.5.1@0
	splitmix-0.1.3.2@0
	StateVar-1.2.2@0
	streaming-commons-0.2.3.1@0
	strict-0.5.1@1
	syb-0.7.4@0
	tagged-0.8.11@0
	tagsoup-0.14.8@0
	tasty-1.5.5@0
	tasty-bench-0.5.1@0
	tasty-golden-2.3.6@0
	tasty-hunit-0.10.2@0
	tasty-quickcheck-0.11.1@7
	temporary-1.3@0
	terminal-size-0.3.4@1
	texmath-0.13.3.5@0
	text-2.1.4@0
	text-builder-1.0.0.5@0
	text-builder-core-0.1.1.3@0
	text-builder-linear-0.1.4@0
	text-conversions-0.3.1.1@0
	text-iso8601-0.1.1.2@0
	text-short-0.1.6.1@0
	th-abstraction-0.7.2.0@0
	th-compat-0.1.7@0
	these-1.2.1@3
	th-lift-0.8.7@0
	th-lift-instances-0.1.20@0
	time-1.14@1
	time-compat-1.9.9@1
	time-hourglass-0.3.0@0
	time-manager-0.5.2@0
	tls-2.5.1@0
	toml-parser-2.0.2.0@3
	transformers-base-0.4.6.1@0
	transformers-compat-0.7.2@0
	typed-process-0.2.13.0@0
	typst-0.12.1@0
	typst-symbols-0.3@0
	unicode-collation-0.1.3.7@0
	unicode-data-0.9.0@0
	unicode-transforms-0.4.0.1@10
	uniplate-1.6.13@1
	unix-2.8.8.0@1
	unix-compat-0.7.4.1@0
	unix-time-0.6.0@0
	unliftio-core-0.2.1.0@4
	unordered-containers-0.2.21@2
	utf8-string-1.0.2@0
	uuid-types-1.0.6.1@0
	vault-0.3.2.0@0
	vector-0.13.2.0@5
	vector-algorithms-0.9.1.0@1
	vector-stream-0.1.0.1@4
	wai-3.2.5@0
	wai-app-static-3.2.1@0
	wai-cors-0.2.7@0
	wai-extra-3.1.18@0
	wai-logger-2.5.1@0
	warp-3.4.21@0
	witherable-0.5@2
	word8-0.1.4@0
	xml-1.3.14@2
	xml-conduit-1.10.1.0@0
	xml-types-0.3.8@0
	yamlet-1.0.0.1@0
	yamlet-aeson-1.0.0.1@0
	zip-archive-0.5@0
	zlib-0.7.1.1@1
	zlib-clib-1.3.2@0
"

inherit cabal

DESCRIPTION="Universal markup converter"
HOMEPAGE="https://pandoc.org/"
SRC_URI="
	https://github.com/jgm/pandoc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CABAL_PACKAGES_SRC_URIS}
"

LICENSE="Apache-2.0"
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
"

S="${WORKDIR}/pandoc-${PV}"

src_unpack() {
	unpack "${P}.tar.gz"
	cabal_src_unpack
}

src_prepare() {
	cp "${FILESDIR}/${PF}.freeze" cabal.project.freeze || die

	default
}

src_compile() {
	cabal_src_compile exe:pandoc
}

src_install() {
	dobin "$(cabal list-bin exe:pandoc)"
	dosym pandoc usr/bin/pandoc-lua
	dosym pandoc usr/bin/pandoc-server

	doman pandoc-cli/man/pandoc.1
	doman pandoc-cli/man/pandoc-lua.1
	doman pandoc-cli/man/pandoc-server.1
}
