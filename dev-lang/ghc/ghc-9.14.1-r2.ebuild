# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

BOOTSTRAP_PV="9.12.2"
PYTHON_COMPAT=( python3_{11..15} )

inherit edo flag-o-matic multiprocessing python-any-r1 toolchain-funcs

DESCRIPTION="The Glasgow Haskell Compiler"
HOMEPAGE="https://www.haskell.org/ghc/"
SRC_URI="
	https://downloads.haskell.org/~ghc/${PV}/ghc-${PV}-src.tar.xz
	!system-bootstrap? (
		https://downloads.haskell.org/~ghc/${BOOTSTRAP_PV}/ghc-${BOOTSTRAP_PV}-x86_64-alpine3_12-linux-static-int_native.tar.xz
		https://downloads.haskell.org/~ghc/${PV}/hadrian-bootstrap-sources/hadrian-bootstrap-sources-${BOOTSTRAP_PV}.tar.gz
	)
	system-bootstrap? (
		https://hackage.haskell.org/package/base16-bytestring-1.0.2.0/base16-bytestring-1.0.2.0.tar.gz
		https://hackage.haskell.org/package/base16-bytestring-1.0.2.0/revision/1.cabal -> base16-bytestring-1.0.2.0.cabal
		https://hackage.haskell.org/package/clock-0.8.4/clock-0.8.4.tar.gz
		https://hackage.haskell.org/package/clock-0.8.4/revision/0.cabal -> clock-0.8.4.cabal
		https://hackage.haskell.org/package/cryptohash-sha256-0.11.102.1/cryptohash-sha256-0.11.102.1.tar.gz
		https://hackage.haskell.org/package/cryptohash-sha256-0.11.102.1/revision/6.cabal -> cryptohash-sha256-0.11.102.1.cabal
		https://hackage.haskell.org/package/extra-1.8.1/extra-1.8.1.tar.gz
		https://hackage.haskell.org/package/extra-1.8.1/revision/0.cabal -> extra-1.8.1.cabal
		https://hackage.haskell.org/package/filepattern-0.1.3/filepattern-0.1.3.tar.gz
		https://hackage.haskell.org/package/filepattern-0.1.3/revision/0.cabal -> filepattern-0.1.3.cabal
		https://hackage.haskell.org/package/hashable-1.5.1.0/hashable-1.5.1.0.tar.gz
		https://hackage.haskell.org/package/hashable-1.5.1.0/revision/0.cabal -> hashable-1.5.1.0.cabal
		https://hackage.haskell.org/package/heaps-0.4.1/heaps-0.4.1.tar.gz
		https://hackage.haskell.org/package/heaps-0.4.1/revision/0.cabal -> heaps-0.4.1.cabal
		https://hackage.haskell.org/package/js-dgtable-0.5.2/js-dgtable-0.5.2.tar.gz
		https://hackage.haskell.org/package/js-dgtable-0.5.2/revision/0.cabal -> js-dgtable-0.5.2.cabal
		https://hackage.haskell.org/package/js-flot-0.8.3/js-flot-0.8.3.tar.gz
		https://hackage.haskell.org/package/js-flot-0.8.3/revision/0.cabal -> js-flot-0.8.3.cabal
		https://hackage.haskell.org/package/js-jquery-3.7.1/js-jquery-3.7.1.tar.gz
		https://hackage.haskell.org/package/js-jquery-3.7.1/revision/0.cabal -> js-jquery-3.7.1.cabal
		https://hackage.haskell.org/package/primitive-0.9.1.0/primitive-0.9.1.0.tar.gz
		https://hackage.haskell.org/package/primitive-0.9.1.0/revision/1.cabal -> primitive-0.9.1.0.cabal
		https://hackage.haskell.org/package/random-1.3.1/random-1.3.1.tar.gz
		https://hackage.haskell.org/package/random-1.3.1/revision/0.cabal -> random-1.3.1.cabal
		https://hackage.haskell.org/package/shake-0.19.9/shake-0.19.9.tar.gz
		https://hackage.haskell.org/package/shake-0.19.9/revision/0.cabal -> shake-0.19.9.cabal
		https://hackage.haskell.org/package/splitmix-0.1.3.2/splitmix-0.1.3.2.tar.gz
		https://hackage.haskell.org/package/splitmix-0.1.3.2/revision/0.cabal -> splitmix-0.1.3.2.cabal
		https://hackage.haskell.org/package/unordered-containers-0.2.21/unordered-containers-0.2.21.tar.gz
		https://hackage.haskell.org/package/unordered-containers-0.2.21/revision/2.cabal -> unordered-containers-0.2.21.cabal
		https://hackage.haskell.org/package/utf8-string-1.0.2/utf8-string-1.0.2.tar.gz
		https://hackage.haskell.org/package/utf8-string-1.0.2/revision/0.cabal -> utf8-string-1.0.2.cabal
	)
"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror test"
IUSE="+system-bootstrap"

RDEPEND="
	dev-libs/gmp:=
	dev-libs/libffi:=
	sys-libs/ncurses:=[unicode(+)]
"
DEPEND="${RDEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	dev-lang/perl
	dev-python/sphinx
	virtual/pkgconfig
	system-bootstrap? (
		>=dev-lang/ghc-9.10
		dev-haskell/cabal-install
	)
"

QA_CONFIGURE_OPTIONS="--with-compiler --with-cc"
QA_PRESTRIPPED='.*\.so'

src_unpack() {
	unpack "ghc-${PV}-src.tar.xz"

	if use system-bootstrap; then
		mkdir -p "${WORKDIR}/vendor" || die
		local f
		for f in ${A}; do
			[[ "${f}" == "ghc-${PV}-src.tar.xz" ]] && continue
			ln -s "${DISTDIR}/${f}" "${WORKDIR}/vendor/${f}" || die
		done

		cat <<-EOF >> "${T}/cabal.config"
		repository local
		  url: file+noindex://${WORKDIR}/vendor
		EOF
		export CABAL_CONFIG="${T}/cabal.config"
	else
		unpack "ghc-${BOOTSTRAP_PV}-x86_64-alpine3_12-linux-static-int_native.tar.xz"
	fi
}

src_prepare() {
	if ! use system-bootstrap; then
		sed -i \
			-e 's:"gcc":"'"$(tc-getCC)"'":g' \
			-e 's:"g++":"'"$(tc-getCXX)"'":g' \
			-e 's:"ld":"'"$(tc-getLD)"'":g' \
			-e 's:"ar":"'"$(tc-getAR)"'":g' \
			-e 's:"ranlib":"'"$(tc-getRANLIB)"'":g' \
			"${WORKDIR}/ghc-${BOOTSTRAP_PV}-x86_64-unknown-linux/lib/settings" || die
	fi

	sed -i '/^index-state: /d' hadrian/cabal.project || die

	default
}

src_configure() {
	if ! use system-bootstrap; then
		export GHC="${WORKDIR}/ghc-${BOOTSTRAP_PV}-x86_64-unknown-linux/bin/ghc"
	fi

	local econf_args=(
		--disable-ld-override
		--disable-numa
		--with-system-libffi
		--with-ffi-includes="$($(tc-getPKG_CONFIG) --cflags-only-I libffi | sed 's/-I//g')"
		--with-js-cpp-flags=""
	)

	tc-export CC CXX LD AR RANLIB

	econf "${econf_args[@]}"

	filter-lto

	GHC_OPTIONS="${HCFLAGS}"
	local flag
	for flag in ${CFLAGS}; do
		GHC_OPTIONS+=" -optc${flag}"
	done
	GHC_OPTIONS+=" -optl-Wl,-z,relro"
	GHC_OPTIONS+=" -optl-Wl,-z,now"

	mkdir -p _build || die
	echo "*.*.ghc.*.opts += ${GHC_OPTIONS}" >> _build/hadrian.settings
	echo "*.*.cc.*.opts += ${GHC_OPTIONS}" >> _build/hadrian.settings
}

src_compile() {
	local hadrian="hadrian/build"
	local hadrian_args=(
		--color
		--verbose
		--jobs=$(makeopts_jobs)
		--flavour=release
		--docs=no-haddocks
		--docs=no-sphinx-html
		--docs=no-sphinx-pdfs
	)

	if ! use system-bootstrap; then
		pushd hadrian/bootstrap >/dev/null || die
		edo ${EPYTHON} bootstrap.py \
			-w "${WORKDIR}/ghc-${BOOTSTRAP_PV}-x86_64-unknown-linux/bin/ghc" \
			-s "${DISTDIR}/hadrian-bootstrap-sources-${BOOTSTRAP_PV}.tar.gz"
		popd >/dev/null || die
		hadrian="hadrian/bootstrap/_build/bin/hadrian"
	fi

	edo ${hadrian} binary-dist-dir "${hadrian_args[@]}"
}

src_install() {
	pushd "_build/bindist/${P}-${CHOST}" >/dev/null || die
	econf --datadir="${EPREFIX}/usr/$(get_libdir)/ghc-${PV}/share" --disable-ld-override --with-js-cpp-flags=""
	emake DESTDIR="${D}" install
	popd >/dev/null || die

	rm -rf "${ED}/usr/$(get_libdir)/ghc-${PV}/share/doc/" || die
	find "${ED}" -name '*.conf.copy' -delete || die
}
