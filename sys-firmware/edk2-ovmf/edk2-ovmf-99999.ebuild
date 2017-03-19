# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{2_6,2_7} )
inherit eutils multiprocessing toolchain-funcs python-single-r1 git-r3

DESCRIPTION="EDK II Open Source UEFI Firmware"
HOMEPAGE="http://www.tianocore.org/"
EGIT_REPO_URI="https://github.com/tianocore/edk2.git"

OPENSSL_PV="1.0.2k"
OPENSSL_P="openssl-${OPENSSL_PV}"
SRC_URI="mirror://openssl/source/${OPENSSL_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="debug +qemu +secure-boot"

RDEPEND="qemu? ( app-emulation/qemu )"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	>=dev-lang/nasm-2.0.7
	sys-power/iasl"

src_prepare() {
	eapply "${FILESDIR}/edk2-use-ld-bfd.patch"
	eapply_user

	if use secure-boot; then
		local openssllib="${S}/CryptoPkg/Library/OpensslLib"
		mv "${WORKDIR}/${OPENSSL_P}" "${openssllib}" || die
		pushd "${openssllib}/${OPENSSL_P}" >/dev/null
		patch -p1 "${openssllib}/EDKII_${OPENSSL_P}.patch" || die
		popd >/dev/null
		./Install.sh || die
	fi
}

src_configure() {
	BUILDTARGET=$(usex debug DEBUG RELEASE)
	case ${ARCH} in
		amd64)	TARGET_ARCH=X64 ;;
		x86)	TARGET_ARCH=IA32 ;;
		*)	die "Unsupported ${ARCH}" ;;
	esac
}

src_compile() {
	emake ARCH=${TARGET_ARCH} -C BaseTools -j1

	. edksetup.sh BaseTools || die "edksetup.sh failed"

	./OvmfPkg/build.sh \
		-a "${TARGET_ARCH}" \
		-b "${BUILDTARGET}" \
		-n $(makeopts_jobs) \
		-D SECURE_BOOT_ENABLE=$(usex secure-boot TRUE FALSE) \
		-D FD_SIZE_2MB \
		|| die "OvmfPkg/build.sh failed"
}

src_install() {
	local fv=( "${S}"/Build/Ovmf${TARGET_ARCH}/${BUILDTARGET}_*/FV )
	[[ ${#fv} -gt 0 ]] || die "FV not found"

	insinto "/usr/share/${PN}"
	doins "${fv}"/OVMF{,_CODE,_VARS}.fd
	dosym OVMF.fd "/usr/share/${PN}/bios.bin"

	if use qemu; then
		dosym "../${PN}/OVMF.fd" /usr/share/qemu/efi-bios.bin
	fi
}
