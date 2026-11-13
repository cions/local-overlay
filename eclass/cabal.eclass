# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: cabal.eclass
# @MAINTAINER:
# cions <cions@tuta.com>
# @AUTHOR:
# cions <cions@tuta.com>
# @SUPPORTED_EAPIS: 8
# @BLURB: An eclass for Haskell application building.
# @DESCRIPTION:
# Helper eclass to handle cabal vendoring repository setup and building process.

inherit multiprocessing

# Maintain version-testing compatibility with ebuilds not using EAPI 7.
case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

: ${GHC:=ghc}
: ${CABAL:=cabal}
: ${HACKAGE_URL:=https://hackage.haskell.org}

QA_CONFIGURE_OPTIONS="--with-compiler --with-cc"

_set_cabal_packages_src_uris() {
	local uris=()
	local package revision
	for package in ${CABAL_PACKAGES}; do
		revision="${package##*@}"
		package="${package%@*}"
		uris+=(
			"${HACKAGE_URL}/package/${package}/${package}.tar.gz"
			"${HACKAGE_URL}/package/${package}/revision/${revision}.cabal -> ${package}.cabal"
		)
	done

	local IFS=$'\n'
	CABAL_PACKAGES_SRC_URIS="${uris[*]}"
	export CABAL_PACKAGES_SRC_URIS
}
_set_cabal_packages_src_uris
unset -f _set_cabal_packages_src_uris

# @FUNCTION: ghc-version
# @DESCRIPTION:
# return version of ghc as reported by '--numeric-version'
_GHC_VERSION_CACHE=""
ghc-version() {
	${GHC} --numeric-version
}

# @FUNCTION: cabal-version
# @DESCRIPTION:
# return version of cabal-install as reported by '--numeric-version'
ghc-cabal-version() {
	${CABAL} --numeric-version
}

# @FUNCTION: ghc-options
# @DESCRIPTION:
# return the user-supplied options for GHC constructed from HCFLAGS and CFLAGS
ghc-options() {
	local flag
	set -- ${HCFLAGS}
	for flag in ${CFLAGS}; do
		case "${flag}" in
			-flto*) continue ;;
		esac
		set -- "$@" "-optc${flag}"
	done
	for flag in -Wl,-z,relro -Wl,-z,now; do
		set -- "$@" "-optl${flag}"
	done
	echo "$*"
}

cabal_src_unpack() {
	mkdir -p "${WORKDIR}/vendor"
	local package
	for package in ${CABAL_PACKAGES}; do
		package="${package%@*}"
		ln -s "${DISTDIR}/${package}.tar.gz" "${WORKDIR}/vendor/${package}.tar.gz" || die "Failed to vendoring ${package}.tar.gz"
		ln -s "${DISTDIR}/${package}.cabal" "${WORKDIR}/vendor/${package}.cabal" || die "Failed to vendoring ${package}.cabal"
	done

	cat <<-EOF >> "${T}/cabal.config"
	repository local
	  url: file+noindex://${WORKDIR}/vendor
	EOF
	export CABAL_CONFIG="${T}/cabal.config"
}

cabal_src_configure() {
	local ecabalconf=(
		--enable-optimization=2
		--disable-executable-stripping
		--disable-library-stripping
		--disable-tests
		--ghc-options="$(ghc-options)"
		--jobs=$(makeopts_jobs)
	)

	set -- ${CABAL} v2-configure "${ecabalconf[@]}" "$@"
	echo "$@"
	"$@" || die "${CABAL} v2-configure failed"
}

cabal_src_compile() {
	set -- ${CABAL} v2-build --builddir="${WORKDIR}/_build" "$@"
	echo "$@"
	"$@" || die "${CABAL} v2-build failed"
}

EXPORT_FUNCTIONS src_unpack src_configure src_compile
