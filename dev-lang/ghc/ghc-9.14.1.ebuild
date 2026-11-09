# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

BOOTSTRAP_PV="9.12.2"
PYTHON_COMPAT=( python3_{11..15} )

inherit edo multiprocessing python-any-r1 toolchain-funcs

DESCRIPTION="The Glasgow Haskell Compiler"
HOMEPAGE="https://www.haskell.org/ghc/"
SRC_URI="
	https://downloads.haskell.org/~ghc/${PV}/ghc-${PV}-src.tar.xz
	!system-bootstrap? (
		https://downloads.haskell.org/~ghc/${BOOTSTRAP_PV}/ghc-${BOOTSTRAP_PV}-x86_64-alpine3_12-linux-static-int_native.tar.xz
		https://downloads.haskell.org/~ghc/${PV}/hadrian-bootstrap-sources/hadrian-bootstrap-sources-${BOOTSTRAP_PV}.tar.gz
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
	system-bootstrap? (
		>=dev-lang/ghc-9.10
		dev-haskell/cabal-install
	)
"

QA_CONFIGURE_OPTIONS="--with-compiler --with-cc"
QA_PRESTRIPPED='.*\.so'

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

	local GHC_FLAGS=(
		-mbmi2
		-msse4.2
		-mavx512f
		-mavx512cd
		-mfma
		-optc-O2
		-optc-march=native
		-optl-Wl,-z,relro
		-optl-Wl,-z,now
	)

	mkdir _build || die
	echo "*.*.ghc.*.opts += ${GHC_FLAGS[*]}" >> _build/hadrian.settings
	echo "*.*.cc.*.opts += ${GHC_FLAGS[*]}" >> _build/hadrian.settings
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

	edo ${hadrian} binary-dist-dir "${hadrian_args[@]}" ${HADRIAN_EXTRA_ARGS}
}

src_install() {
	pushd "_build/bindist/${P}-${CHOST}" >/dev/null || die
	econf --datadir="/usr/$(get_libdir)/ghc-${PV}/share" --disable-ld-override --with-js-cpp-flags=""
	emake DESTDIR="${D}" install
	popd >/dev/null || die

	rm -rf "${ED}"/usr/$(get_libdir)/ghc-${PV}/share/doc/ || die
	find "${ED}" -name '*.conf.copy' -delete || die
}
