# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit eutils multiprocessing python-any-r1 git-r3

DESCRIPTION="EDK II Open Source UEFI firmware for x86_64 virtual machine"
HOMEPAGE="http://www.tianocore.org/edk2"
EGIT_REPO_URI="https://github.com/tianocore/edk2.git"

OPENSSL_PV="1.1.0e"
OPENSSL_P="openssl-${OPENSSL_PV}"
SRC_URI="secure-boot? ( mirror://openssl/source/${OPENSSL_P}.tar.gz )"

LICENSE="BSD-2 MIT"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="debug +secure-boot"

RDEPEND=""
DEPEND="${PYTHON_DEPS}
	>=dev-lang/nasm-2.0.7
	>=sys-power/iasl-20160729"

pkg_setup() {
	python-any-r1_pkg_setup
}

src_prepare() {
	eapply "${FILESDIR}/edk2-use-ld-bfd.patch"
	eapply_user

	if use secure-boot; then
		local openssldir="CryptoPkg/Library/OpensslLib/openssl"
		mkdir "${openssldir}" || die
		mv "${WORKDIR}/${OPENSSL_P}" "${openssldir}" || die
	fi
}

src_compile() {
	case ${ARCH} in
		amd64) TARGET_ARCH=X64 ;;
		x86)   TARGET_ARCH=IA32 ;;
		*)     die "Unsupported ${ARCH}" ;;
	esac
	TARGET_NAME=$(usex debug DEBUG RELEASE)
	TARGET_TOOLS=GCC49

	emake ARCH=${TARGET_ARCH} -C BaseTools -j1

	. edksetup.sh BaseTools || die "edksetup.sh failed"

	./OvmfPkg/build.sh \
		-a "${TARGET_ARCH}" \
		-b "${TARGET_NAME}" \
		-t "${TARGET_TOOLS}" \
		-n $(makeopts_jobs) \
		-D SECURE_BOOT_ENABLE=$(usex secure-boot TRUE FALSE) \
		-D FD_SIZE_2MB \
		|| die "OvmfPkg/build.sh failed"
}

src_install() {
	local builddir="Build/Ovmf${TARGET_ARCH}/${TARGET_NAME}_${TARGET_TOOLS}/FV"

	insinto /usr/share/${PN}
	doins "${builddir}"/OVMF{,_CODE,_VARS}.fd
}
