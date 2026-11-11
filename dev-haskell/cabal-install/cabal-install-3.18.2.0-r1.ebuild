# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit edo flag-o-matic multiprocessing

DESCRIPTION="The command-line interface for Cabal and Hackage"
HOMEPAGE="https://www.haskell.org/cabal/"
SRC_URI="
	https://github.com/haskell/cabal/archive/refs/tags/cabal-install-v${PV}.tar.gz
	!system-bootstrap? (
		https://github.com/haskell/cabal/releases/download/cabal-install-v${PV}/cabal-install-${PV}-x86_64-linux-unknown.tar.xz
	)
	https://hackage.haskell.org/package/aeson-2.2.5.0/aeson-2.2.5.0.tar.gz
	https://hackage.haskell.org/package/aeson-2.2.5.0/revision/0.cabal -> aeson-2.2.5.0.cabal
	https://hackage.haskell.org/package/alex-3.5.4.2/alex-3.5.4.2.tar.gz
	https://hackage.haskell.org/package/alex-3.5.4.2/revision/0.cabal -> alex-3.5.4.2.cabal
	https://hackage.haskell.org/package/ansi-terminal-1.1.5/ansi-terminal-1.1.5.tar.gz
	https://hackage.haskell.org/package/ansi-terminal-1.1.5/revision/0.cabal -> ansi-terminal-1.1.5.cabal
	https://hackage.haskell.org/package/ansi-terminal-types-1.1.3/ansi-terminal-types-1.1.3.tar.gz
	https://hackage.haskell.org/package/ansi-terminal-types-1.1.3/revision/0.cabal -> ansi-terminal-types-1.1.3.cabal
	https://hackage.haskell.org/package/ansi-wl-pprint-1.1.1/ansi-wl-pprint-1.1.1.tar.gz
	https://hackage.haskell.org/package/ansi-wl-pprint-1.1.1/revision/0.cabal -> ansi-wl-pprint-1.1.1.cabal
	https://hackage.haskell.org/package/assoc-1.1.1/assoc-1.1.1.tar.gz
	https://hackage.haskell.org/package/assoc-1.1.1/revision/2.cabal -> assoc-1.1.1.cabal
	https://hackage.haskell.org/package/async-2.2.6/async-2.2.6.tar.gz
	https://hackage.haskell.org/package/async-2.2.6/revision/0.cabal -> async-2.2.6.cabal
	https://hackage.haskell.org/package/atomic-counter-0.1.2.4/atomic-counter-0.1.2.4.tar.gz
	https://hackage.haskell.org/package/atomic-counter-0.1.2.4/revision/0.cabal -> atomic-counter-0.1.2.4.cabal
	https://hackage.haskell.org/package/attoparsec-0.14.4/attoparsec-0.14.4.tar.gz
	https://hackage.haskell.org/package/attoparsec-0.14.4/revision/6.cabal -> attoparsec-0.14.4.cabal
	https://hackage.haskell.org/package/base16-bytestring-1.0.2.0/base16-bytestring-1.0.2.0.tar.gz
	https://hackage.haskell.org/package/base16-bytestring-1.0.2.0/revision/1.cabal -> base16-bytestring-1.0.2.0.cabal
	https://hackage.haskell.org/package/base64-bytestring-1.2.1.0/base64-bytestring-1.2.1.0.tar.gz
	https://hackage.haskell.org/package/base64-bytestring-1.2.1.0/revision/1.cabal -> base64-bytestring-1.2.1.0.cabal
	https://hackage.haskell.org/package/base-orphans-0.9.4/base-orphans-0.9.4.tar.gz
	https://hackage.haskell.org/package/base-orphans-0.9.4/revision/0.cabal -> base-orphans-0.9.4.cabal
	https://hackage.haskell.org/package/bifunctors-5.6.3/bifunctors-5.6.3.tar.gz
	https://hackage.haskell.org/package/bifunctors-5.6.3/revision/1.cabal -> bifunctors-5.6.3.cabal
	https://hackage.haskell.org/package/character-ps-0.1/character-ps-0.1.tar.gz
	https://hackage.haskell.org/package/character-ps-0.1/revision/0.cabal -> character-ps-0.1.cabal
	https://hackage.haskell.org/package/charset-0.3.12/charset-0.3.12.tar.gz
	https://hackage.haskell.org/package/charset-0.3.12/revision/0.cabal -> charset-0.3.12.cabal
	https://hackage.haskell.org/package/colour-2.3.7/colour-2.3.7.tar.gz
	https://hackage.haskell.org/package/colour-2.3.7/revision/0.cabal -> colour-2.3.7.cabal
	https://hackage.haskell.org/package/comonad-5.0.10/comonad-5.0.10.tar.gz
	https://hackage.haskell.org/package/comonad-5.0.10/revision/0.cabal -> comonad-5.0.10.cabal
	https://hackage.haskell.org/package/contravariant-1.5.6/contravariant-1.5.6.tar.gz
	https://hackage.haskell.org/package/contravariant-1.5.6/revision/0.cabal -> contravariant-1.5.6.cabal
	https://hackage.haskell.org/package/cryptohash-sha256-0.11.102.1/cryptohash-sha256-0.11.102.1.tar.gz
	https://hackage.haskell.org/package/cryptohash-sha256-0.11.102.1/revision/6.cabal -> cryptohash-sha256-0.11.102.1.cabal
	https://hackage.haskell.org/package/data-fix-0.3.4/data-fix-0.3.4.tar.gz
	https://hackage.haskell.org/package/data-fix-0.3.4/revision/2.cabal -> data-fix-0.3.4.cabal
	https://hackage.haskell.org/package/directory-1.3.11.0/directory-1.3.11.0.tar.gz
	https://hackage.haskell.org/package/directory-1.3.11.0/revision/0.cabal -> directory-1.3.11.0.cabal
	https://hackage.haskell.org/package/directory-ospath-streaming-0.3/directory-ospath-streaming-0.3.tar.gz
	https://hackage.haskell.org/package/directory-ospath-streaming-0.3/revision/1.cabal -> directory-ospath-streaming-0.3.cabal
	https://hackage.haskell.org/package/distributive-0.6.3/distributive-0.6.3.tar.gz
	https://hackage.haskell.org/package/distributive-0.6.3/revision/0.cabal -> distributive-0.6.3.cabal
	https://hackage.haskell.org/package/dlist-1.0/dlist-1.0.tar.gz
	https://hackage.haskell.org/package/dlist-1.0/revision/2.cabal -> dlist-1.0.cabal
	https://hackage.haskell.org/package/echo-0.1.4/echo-0.1.4.tar.gz
	https://hackage.haskell.org/package/echo-0.1.4/revision/0.cabal -> echo-0.1.4.cabal
	https://hackage.haskell.org/package/ed25519-0.0.5.0/ed25519-0.0.5.0.tar.gz
	https://hackage.haskell.org/package/ed25519-0.0.5.0/revision/9.cabal -> ed25519-0.0.5.0.cabal
	https://hackage.haskell.org/package/edit-distance-0.2.2.1/edit-distance-0.2.2.1.tar.gz
	https://hackage.haskell.org/package/edit-distance-0.2.2.1/revision/1.cabal -> edit-distance-0.2.2.1.cabal
	https://hackage.haskell.org/package/file-io-0.2.0/file-io-0.2.0.tar.gz
	https://hackage.haskell.org/package/file-io-0.2.0/revision/0.cabal -> file-io-0.2.0.cabal
	https://hackage.haskell.org/package/hackage-security-0.6.3.3/hackage-security-0.6.3.3.tar.gz
	https://hackage.haskell.org/package/hackage-security-0.6.3.3/revision/0.cabal -> hackage-security-0.6.3.3.cabal
	https://hackage.haskell.org/package/hashable-1.5.1.0/hashable-1.5.1.0.tar.gz
	https://hackage.haskell.org/package/hashable-1.5.1.0/revision/0.cabal -> hashable-1.5.1.0.cabal
	https://hackage.haskell.org/package/hsc2hs-0.68.10/hsc2hs-0.68.10.tar.gz
	https://hackage.haskell.org/package/hsc2hs-0.68.10/revision/5.cabal -> hsc2hs-0.68.10.cabal
	https://hackage.haskell.org/package/HTTP-4000.5.0/HTTP-4000.5.0.tar.gz
	https://hackage.haskell.org/package/HTTP-4000.5.0/revision/1.cabal -> HTTP-4000.5.0.cabal
	https://hackage.haskell.org/package/indexed-traversable-0.1.5/indexed-traversable-0.1.5.tar.gz
	https://hackage.haskell.org/package/indexed-traversable-0.1.5/revision/0.cabal -> indexed-traversable-0.1.5.cabal
	https://hackage.haskell.org/package/indexed-traversable-instances-0.1.2.1/indexed-traversable-instances-0.1.2.1.tar.gz
	https://hackage.haskell.org/package/indexed-traversable-instances-0.1.2.1/revision/0.cabal -> indexed-traversable-instances-0.1.2.1.cabal
	https://hackage.haskell.org/package/integer-conversion-0.1.1/integer-conversion-0.1.1.tar.gz
	https://hackage.haskell.org/package/integer-conversion-0.1.1/revision/2.cabal -> integer-conversion-0.1.1.cabal
	https://hackage.haskell.org/package/integer-logarithms-1.0.5/integer-logarithms-1.0.5.tar.gz
	https://hackage.haskell.org/package/integer-logarithms-1.0.5/revision/0.cabal -> integer-logarithms-1.0.5.cabal
	https://hackage.haskell.org/package/network-3.2.8.0/network-3.2.8.0.tar.gz
	https://hackage.haskell.org/package/network-3.2.8.0/revision/0.cabal -> network-3.2.8.0.cabal
	https://hackage.haskell.org/package/network-uri-2.6.4.2/network-uri-2.6.4.2.tar.gz
	https://hackage.haskell.org/package/network-uri-2.6.4.2/revision/1.cabal -> network-uri-2.6.4.2.cabal
	https://hackage.haskell.org/package/OneTuple-0.4.3/OneTuple-0.4.3.tar.gz
	https://hackage.haskell.org/package/OneTuple-0.4.3/revision/0.cabal -> OneTuple-0.4.3.cabal
	https://hackage.haskell.org/package/open-browser-0.5.1.0/open-browser-0.5.1.0.tar.gz
	https://hackage.haskell.org/package/open-browser-0.5.1.0/revision/0.cabal -> open-browser-0.5.1.0.cabal
	https://hackage.haskell.org/package/optparse-applicative-0.19.0.0/optparse-applicative-0.19.0.0.tar.gz
	https://hackage.haskell.org/package/optparse-applicative-0.19.0.0/revision/1.cabal -> optparse-applicative-0.19.0.0.cabal
	https://hackage.haskell.org/package/parsers-0.12.12/parsers-0.12.12.tar.gz
	https://hackage.haskell.org/package/parsers-0.12.12/revision/1.cabal -> parsers-0.12.12.cabal
	https://hackage.haskell.org/package/prettyprinter-1.7.2/prettyprinter-1.7.2.tar.gz
	https://hackage.haskell.org/package/prettyprinter-1.7.2/revision/0.cabal -> prettyprinter-1.7.2.cabal
	https://hackage.haskell.org/package/prettyprinter-ansi-terminal-1.1.4/prettyprinter-ansi-terminal-1.1.4.tar.gz
	https://hackage.haskell.org/package/prettyprinter-ansi-terminal-1.1.4/revision/0.cabal -> prettyprinter-ansi-terminal-1.1.4.cabal
	https://hackage.haskell.org/package/prettyprinter-compat-ansi-wl-pprint-1.1.1/prettyprinter-compat-ansi-wl-pprint-1.1.1.tar.gz
	https://hackage.haskell.org/package/prettyprinter-compat-ansi-wl-pprint-1.1.1/revision/0.cabal -> prettyprinter-compat-ansi-wl-pprint-1.1.1.cabal
	https://hackage.haskell.org/package/primitive-0.9.1.0/primitive-0.9.1.0.tar.gz
	https://hackage.haskell.org/package/primitive-0.9.1.0/revision/1.cabal -> primitive-0.9.1.0.cabal
	https://hackage.haskell.org/package/process-1.6.30.0/process-1.6.30.0.tar.gz
	https://hackage.haskell.org/package/process-1.6.30.0/revision/0.cabal -> process-1.6.30.0.cabal
	https://hackage.haskell.org/package/QuickCheck-2.16.0.0/QuickCheck-2.16.0.0.tar.gz
	https://hackage.haskell.org/package/QuickCheck-2.16.0.0/revision/0.cabal -> QuickCheck-2.16.0.0.cabal
	https://hackage.haskell.org/package/random-1.3.1/random-1.3.1.tar.gz
	https://hackage.haskell.org/package/random-1.3.1/revision/0.cabal -> random-1.3.1.cabal
	https://hackage.haskell.org/package/regex-base-0.94.0.3/regex-base-0.94.0.3.tar.gz
	https://hackage.haskell.org/package/regex-base-0.94.0.3/revision/0.cabal -> regex-base-0.94.0.3.cabal
	https://hackage.haskell.org/package/regex-posix-0.96.0.2/regex-posix-0.96.0.2.tar.gz
	https://hackage.haskell.org/package/regex-posix-0.96.0.2/revision/0.cabal -> regex-posix-0.96.0.2.cabal
	https://hackage.haskell.org/package/rere-0.2.0.2/rere-0.2.0.2.tar.gz
	https://hackage.haskell.org/package/rere-0.2.0.2/revision/2.cabal -> rere-0.2.0.2.cabal
	https://hackage.haskell.org/package/resolv-0.2.0.3/resolv-0.2.0.3.tar.gz
	https://hackage.haskell.org/package/resolv-0.2.0.3/revision/0.cabal -> resolv-0.2.0.3.cabal
	https://hackage.haskell.org/package/safe-exceptions-0.1.7.4/safe-exceptions-0.1.7.4.tar.gz
	https://hackage.haskell.org/package/safe-exceptions-0.1.7.4/revision/1.cabal -> safe-exceptions-0.1.7.4.cabal
	https://hackage.haskell.org/package/scientific-0.3.8.1/scientific-0.3.8.1.tar.gz
	https://hackage.haskell.org/package/scientific-0.3.8.1/revision/0.cabal -> scientific-0.3.8.1.cabal
	https://hackage.haskell.org/package/semaphore-compat-2.0.1/semaphore-compat-2.0.1.tar.gz
	https://hackage.haskell.org/package/semaphore-compat-2.0.1/revision/0.cabal -> semaphore-compat-2.0.1.cabal
	https://hackage.haskell.org/package/semialign-1.4/semialign-1.4.tar.gz
	https://hackage.haskell.org/package/semialign-1.4/revision/0.cabal -> semialign-1.4.cabal
	https://hackage.haskell.org/package/semigroupoids-6.0.2/semigroupoids-6.0.2.tar.gz
	https://hackage.haskell.org/package/semigroupoids-6.0.2/revision/1.cabal -> semigroupoids-6.0.2.cabal
	https://hackage.haskell.org/package/splitmix-0.1.3.2/splitmix-0.1.3.2.tar.gz
	https://hackage.haskell.org/package/splitmix-0.1.3.2/revision/0.cabal -> splitmix-0.1.3.2.cabal
	https://hackage.haskell.org/package/StateVar-1.2.2/StateVar-1.2.2.tar.gz
	https://hackage.haskell.org/package/StateVar-1.2.2/revision/0.cabal -> StateVar-1.2.2.cabal
	https://hackage.haskell.org/package/strict-0.5.1/strict-0.5.1.tar.gz
	https://hackage.haskell.org/package/strict-0.5.1/revision/1.cabal -> strict-0.5.1.cabal
	https://hackage.haskell.org/package/tagged-0.8.10/tagged-0.8.10.tar.gz
	https://hackage.haskell.org/package/tagged-0.8.10/revision/2.cabal -> tagged-0.8.10.cabal
	https://hackage.haskell.org/package/tar-0.7.1.0/tar-0.7.1.0.tar.gz
	https://hackage.haskell.org/package/tar-0.7.1.0/revision/1.cabal -> tar-0.7.1.0.cabal
	https://hackage.haskell.org/package/tasty-1.5.4/tasty-1.5.4.tar.gz
	https://hackage.haskell.org/package/tasty-1.5.4/revision/1.cabal -> tasty-1.5.4.cabal
	https://hackage.haskell.org/package/tasty-quickcheck-0.11.1/tasty-quickcheck-0.11.1.tar.gz
	https://hackage.haskell.org/package/tasty-quickcheck-0.11.1/revision/7.cabal -> tasty-quickcheck-0.11.1.cabal
	https://hackage.haskell.org/package/terminal-size-0.3.4/terminal-size-0.3.4.tar.gz
	https://hackage.haskell.org/package/terminal-size-0.3.4/revision/1.cabal -> terminal-size-0.3.4.cabal
	https://hackage.haskell.org/package/text-iso8601-0.1.1.1/text-iso8601-0.1.1.1.tar.gz
	https://hackage.haskell.org/package/text-iso8601-0.1.1.1/revision/0.cabal -> text-iso8601-0.1.1.1.cabal
	https://hackage.haskell.org/package/text-short-0.1.6.1/text-short-0.1.6.1.tar.gz
	https://hackage.haskell.org/package/text-short-0.1.6.1/revision/0.cabal -> text-short-0.1.6.1.cabal
	https://hackage.haskell.org/package/th-abstraction-0.7.2.0/th-abstraction-0.7.2.0.tar.gz
	https://hackage.haskell.org/package/th-abstraction-0.7.2.0/revision/0.cabal -> th-abstraction-0.7.2.0.cabal
	https://hackage.haskell.org/package/th-compat-0.1.7/th-compat-0.1.7.tar.gz
	https://hackage.haskell.org/package/th-compat-0.1.7/revision/0.cabal -> th-compat-0.1.7.cabal
	https://hackage.haskell.org/package/these-1.2.1/these-1.2.1.tar.gz
	https://hackage.haskell.org/package/these-1.2.1/revision/3.cabal -> these-1.2.1.cabal
	https://hackage.haskell.org/package/time-1.14/time-1.14.tar.gz
	https://hackage.haskell.org/package/time-1.14/revision/1.cabal -> time-1.14.cabal
	https://hackage.haskell.org/package/time-compat-1.9.9/time-compat-1.9.9.tar.gz
	https://hackage.haskell.org/package/time-compat-1.9.9/revision/1.cabal -> time-compat-1.9.9.cabal
	https://hackage.haskell.org/package/transformers-compat-0.8/transformers-compat-0.8.tar.gz
	https://hackage.haskell.org/package/transformers-compat-0.8/revision/0.cabal -> transformers-compat-0.8.cabal
	https://hackage.haskell.org/package/tree-diff-0.3.5/tree-diff-0.3.5.tar.gz
	https://hackage.haskell.org/package/tree-diff-0.3.5/revision/1.cabal -> tree-diff-0.3.5.cabal
	https://hackage.haskell.org/package/typed-process-0.2.13.0/typed-process-0.2.13.0.tar.gz
	https://hackage.haskell.org/package/typed-process-0.2.13.0/revision/0.cabal -> typed-process-0.2.13.0.cabal
	https://hackage.haskell.org/package/unix-2.8.8.0/unix-2.8.8.0.tar.gz
	https://hackage.haskell.org/package/unix-2.8.8.0/revision/1.cabal -> unix-2.8.8.0.cabal
	https://hackage.haskell.org/package/unliftio-core-0.2.1.0/unliftio-core-0.2.1.0.tar.gz
	https://hackage.haskell.org/package/unliftio-core-0.2.1.0/revision/4.cabal -> unliftio-core-0.2.1.0.cabal
	https://hackage.haskell.org/package/unordered-containers-0.2.21/unordered-containers-0.2.21.tar.gz
	https://hackage.haskell.org/package/unordered-containers-0.2.21/revision/2.cabal -> unordered-containers-0.2.21.cabal
	https://hackage.haskell.org/package/uuid-types-1.0.6.1/uuid-types-1.0.6.1.tar.gz
	https://hackage.haskell.org/package/uuid-types-1.0.6.1/revision/0.cabal -> uuid-types-1.0.6.1.cabal
	https://hackage.haskell.org/package/vector-0.13.2.0/vector-0.13.2.0.tar.gz
	https://hackage.haskell.org/package/vector-0.13.2.0/revision/5.cabal -> vector-0.13.2.0.cabal
	https://hackage.haskell.org/package/vector-stream-0.1.0.1/vector-stream-0.1.0.1.tar.gz
	https://hackage.haskell.org/package/vector-stream-0.1.0.1/revision/4.cabal -> vector-stream-0.1.0.1.cabal
	https://hackage.haskell.org/package/witherable-0.5/witherable-0.5.tar.gz
	https://hackage.haskell.org/package/witherable-0.5/revision/2.cabal -> witherable-0.5.cabal
	https://hackage.haskell.org/package/zlib-0.7.1.1/zlib-0.7.1.1.tar.gz
	https://hackage.haskell.org/package/zlib-0.7.1.1/revision/1.cabal -> zlib-0.7.1.1.cabal
	https://hackage.haskell.org/package/zlib-clib-1.3.2/zlib-clib-1.3.2.tar.gz
	https://hackage.haskell.org/package/zlib-clib-1.3.2/revision/0.cabal -> zlib-clib-1.3.2.cabal
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

QA_CONFIGURE_OPTIONS="--with-compiler --with-cc"

pkg_setup() {
	: ${CABAL:=cabal}
	if ! use system-bootstrap; then
		CABAL="${WORKDIR}/cabal"
	fi
	export CABAL
}

src_unpack() {
	unpack "cabal-install-v${PV}.tar.gz"
	use system-bootstrap || unpack "${P}-x86_64-linux-unknown.tar.xz"

	mkdir -p "${WORKDIR}/vendor" || die
	local f
	for f in ${A}; do
		[[ "${f}" == "cabal-install-v${PV}.tar.gz" ]] && continue
		[[ "${f}" == "${P}-x86_64-linux-unknown.tar.xz" ]] && continue
		ln -s "${DISTDIR}/${f}" "${WORKDIR}/vendor/${f}" || die
	done

	cat <<-EOF >> "${T}/cabal.config"
	repository local
	  url: file+noindex://${WORKDIR}/vendor
	EOF
	export CABAL_CONFIG="${T}/cabal.config"
}

src_prepare() {
	cp "${FILESDIR}/${PF}.freeze" cabal.release.project.freeze || die

	default
}

src_configure() {
	filter-lto

	GHC_OPTIONS="${HCFLAGS}"
	local flag
	for flag in ${CFLAGS}; do
		GHC_OPTIONS+=" -optc${flag}"
	done
	GHC_OPTIONS+=" -optl-Wl,-z,relro"
	GHC_OPTIONS+=" -optl-Wl,-z,now"

	local cabal_conf=(
		--enable-optimization=2
		--disable-executable-stripping
		--disable-library-stripping
		--disable-tests
		--ghc-options="${GHC_OPTIONS}"
		--jobs=$(makeopts_jobs)
	)

	edo ${CABAL} v2-configure --project-file="cabal.release.project" "${cabal_conf[@]}"
}

src_compile() {
	edo ${CABAL} v2-build --project-file="cabal.release.project" --builddir="${WORKDIR}/_build" cabal-install
}

src_install() {
	dobin "${WORKDIR}"/_build/build/x86_64-linux/ghc-*/${P}/x/cabal/opt/build/cabal/cabal
}
