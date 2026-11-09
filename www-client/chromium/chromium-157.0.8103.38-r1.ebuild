# Copyright 2009-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GN_MIN_VER="0.2601"
GO_MIN_VER="1.25.0"
NODE_MIN_VER="24.16.0-r1"
ESBUILD_VER="0.28.2"
TSC_MIN_VER="7.0.2"
LLVM_COMPAT=( 23 )
PYTHON_COMPAT=( python3_{11..15} )
PYTHON_REQ_USE="xml(+)"
RUST_MIN_VER="1.91.0"
RUST_NEEDS_LLVM="1"
RUST_REQ_USE="rustfmt"

inherit desktop edo flag-o-matic llvm-r2 multiprocessing ninja-utils pax-utils python-any-r1 rust toolchain-funcs xdg-utils

DESCRIPTION="the open-source browser behind the Google Chrome"
HOMEPAGE="https://www.chromium.org/"
SRC_URI="https://github.com/chromium-linux-tarballs/chromium-tarballs/releases/download/${PV}/chromium-${PV}-linux.tar.xz"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Base64 Boost-1.0 CC-BY-3.0 CC-BY-4.0 Clear-BSD FFT2D FTL"
LICENSE+=" IJG ISC LGPL-2 LGPL-2.1 MIT MPL-1.1 MPL-2.0 Ms-PL PSF-2 SGI-B-2.0 SSLeay SunSoft Unicode-3.0"
LICENSE+=" Unicode-DFS-2015 Unlicense UoI-NCSA ZLIB libtiff openssl"

SLOT="stable"
KEYWORDS="~amd64"
RESTRICT="mirror"

CHROMIUM_LANGS="
	af am ar bg bn ca cs da de el en-GB es es-419 et fa fi fil fr gu he hi hr
	hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr sv sw
	ta te th tr uk ur vi zh-CN zh-TW
"
IUSE="cups +hangouts +proprietary-codecs +vaapi wayland +widevine"

_chromium_set_l10n_IUSE() {
	local lang
	for lang in ${CHROMIUM_LANGS}; do
		IUSE+=" +l10n_${lang}"
	done
}
_chromium_set_l10n_IUSE
unset -f _chromium_set_l10n_IUSE

RDEPEND="
	>=app-accessibility/at-spi2-core-2.46.0:2
	app-arch/bzip2:=
	dev-libs/expat:=
	dev-libs/glib:2
	dev-libs/libffi:=
	>=dev-libs/libxml2-2.12.4:=[icu]
	dev-libs/libxslt:=
	dev-libs/nspr:=
	>=dev-libs/nss-3.26:=
	>=media-libs/alsa-lib-1.0.19:=
	media-libs/flac:=
	media-libs/fontconfig:=
	>=media-libs/freetype-2.11.0-r1:=
	media-libs/libjpeg-turbo:=
	media-libs/libpulse:=
	>=media-libs/libwebp-0.4.0:=
	media-libs/mesa:=[X,wayland?]
	>=media-libs/openh264-2.6.0:=
	media-video/pipewire:=
	net-misc/curl[ssl]
	sys-apps/dbus:=
	sys-apps/pciutils:=
	sys-libs/zlib:=[minizip]
	virtual/ttf-fonts
	virtual/udev
	x11-base/xorg-proto:=
	x11-libs/cairo:=
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3[X,wayland?]
	x11-libs/libX11:=
	x11-libs/libXcomposite:=
	x11-libs/libXcursor:=
	x11-libs/libXdamage:=
	x11-libs/libXext:=
	x11-libs/libXfixes:=
	>=x11-libs/libXi-1.6.0:=
	x11-libs/libXrandr:=
	x11-libs/libXrender:=
	x11-libs/libXtst:=
	x11-libs/libxcb:=
	x11-libs/libxkbcommon:=
	x11-libs/libxshmfence:=
	x11-libs/pango:=
	cups? ( >=net-print/cups-1.3.11:= )
	vaapi? ( >=media-libs/libva-2.7:=[X,wayland?] )
	wayland? ( dev-libs/wayland:= )"
BDEPEND="${RDEPEND}
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/clang[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}
		llvm-core/llvm:${LLVM_SLOT}
		llvm-core/lld:${LLVM_SLOT}
		llvm-runtimes/compiler-rt-sanitizers:${LLVM_SLOT}[cfi]
	')
	${RUST_DEPEND}
	app-alternatives/ninja
	>=app-arch/gzip-1.7
	>=dev-build/gn-${GN_MIN_VER}
	>=dev-lang/go-${GO_MIN_VER}
	>=dev-lang/typescript-${TSC_MIN_VER}
	dev-lang/perl
	>=dev-util/bindgen-0.72.1
	dev-util/crubit
	dev-util/esbuild:${ESBUILD_VER}
	>=dev-util/gperf-3.2
	dev-vcs/git
	>=net-libs/nodejs-${NODE_MIN_VER}[inspector]
	sys-apps/hwdata
	>=sys-devel/bison-2.4.3
	sys-devel/flex
	virtual/pkgconfig
	x11-misc/xdg-utils"

PATCHES=(
	"${FILESDIR}"/m157-compiler-builtins.patch
	"${FILESDIR}"/m157-compiler-warnings.patch
	"${FILESDIR}"/m157-llvm-prefix.patch
	"${FILESDIR}"/m157-rust-bindgen-libclang-path.patch
	"${FILESDIR}"/m157-rust-sysroot.patch
	"${FILESDIR}"/m157-system-crubit.patch
)

python_check_deps() {
	python_has_version "dev-python/clang[${PYTHON_USEDEP}]"
	python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

pkg_setup() {
	llvm-r1_pkg_setup
	python-any-r1_pkg_setup
	rust_pkg_setup

	filter-lto
}

restore_binary() {
	mkdir -p "$(dirname "$2")" || die
	ln -s "$1" "$2" || die
}

src_prepare() {
	einfo "Removing bundled binaries from source tree"
	local bundled_binaries=( $(${EPYTHON} "${FILESDIR}/bin-finder.py" --elf "${S}" | awk '{print $1}') )
	edo rm -f "${bundled_binaries[@]}"

	restore_binary "${BROOT}/usr/bin/node" "${S}/third_party/node/linux/node-linux-x64/bin/node"
	restore_binary "${BROOT}/usr/bin/tsc" "${S}/third_party/typescript/linux-amd64/src/lib/tsc"
	restore_binary "${BROOT}/usr/bin/esbuild-${ESBUILD_VER}" "${S}/third_party/devtools-frontend/src/third_party/esbuild/esbuild"
	restore_binary "${BROOT}/usr/bin/go" "${S}/third_party/dawn/tools/golang/linux-amd64/bin/go"
	restore_binary "${BROOT}/usr/bin/gperf" "${S}/third_party/gperf/cipd/bin/gperf"

	sed -i 's/^script_executable = ".*"/script_executable = "'"${EPYTHON}"'"/' .gn || die
	sed -i 's/^NODE_VERSION=".*"/NODE_VERSION="'"$("${BROOT}"/usr/bin/node --version)"'"/' third_party/node/update_node_binaries || die
	sed -i '/exceptions_list = \[/a\    '"'${BROOT}/usr/lib/typescript/'," tools/typescript/validate_tsconfig.py || die
	sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' tools/generate_shim_headers/generate_shim_headers.py || die
	sed -i '/"nightly_portable_simd",/d' third_party/rust/bytemuck/v1/BUILD.gn || die

	default
}

src_configure() {
	local myconf_gn=(
		"target_cpu=\"x64\""
		"target_os=\"linux\""
		"custom_toolchain=\"//build/toolchain/linux/unbundle:default\""
		"host_toolchain=\"//build/toolchain/linux/unbundle:default\""
		"clang_version=\"${LLVM_SLOT}\""
		"clang_base_path=\"${BROOT}/usr\""
		"llvm_prefix=\"$(get_llvm_prefix -b)\""
		"clang_use_chrome_plugins=false"
		"rust_sysroot_absolute=\"$(get_rust_prefix -b)\""
		"rustc_version=\"${RUST_SLOT}\""
		"rust_bindgen_root=\"${BROOT}/usr\""
		"rust_bindgen_libclang_path=\"$(get_llvm_prefix -b)/$(get_libdir)\""
		"rust_crubit_root=\"${BROOT}/usr/$(get_libdir)/crubit\""
		"fatal_linker_warnings=false"
		"is_official_build=true"
		"symbol_level=0"
		"enable_hangout_services_extension=$(usex hangouts true false)"
		"enable_widevine=$(usex widevine true false)"
		"ffmpeg_branding=\"$(usex proprietary-codecs Chrome Chromium)\""
		"google_api_key=\"AIzaSyDEAOvatFo0eTgsV_ZlEzx0ObmepsMzfAc\""
		"link_pulseaudio=true"
		"ozone_platform=\"$(usex wayland wayland x11)\""
		"proprietary_codecs=$(usex proprietary-codecs true false)"
		"safe_browsing_use_unrar=false"
		"treat_warnings_as_errors=false"
		"use_cups=$(usex cups true false)"
		"use_kerberos=false"
		"use_sysroot=false"
		"use_system_libffi=true"
		"use_vaapi=$(usex vaapi true false)"
		"v8_metagen_libclang_so=\"$(get_llvm_prefix -b)/$(get_libdir)/libclang.so\""
		"v8_metagen_libclang_bindings_dir=\"$(python_get_sitedir)\""
	)

	einfo "Configuring Chromium ..."
	edo gn gen --args="${myconf_gn[*]}${EXTRA_GN:+ ${EXTRA_GN}}" out/Release
}

src_compile() {
	local -x RUSTC_BOOTSTRAP=1

	local x
	for x in mksnapshot v8_context_snapshot_generator code_cache_generator; do
		eninja -C out/Release "${x}"
		pax-mark m "out/Release/${x}"
	done

	eninja -C out/Release chrome chromedriver chrome_sandbox
	pax-mark m out/Release/chrome

	mv out/Release/chromedriver{.unstripped,} || die

	rm -f out/Release/locales/*.pak.info || die

	edo ${EPYTHON} "${FILESDIR}/generate-support-files.py" --installdir "/usr/$(get_libdir)/chromium-browser" --channel "${SLOT}"
}

src_install() {
	local browser_suffix=""
	if [[ "${SLOT}" != "stable" ]]; then
		browser_suffix="-${SLOT}"
	fi
	local CHROMIUM_HOME="/usr/$(get_libdir)/chromium-browser${browser_suffix}"

	exeinto "${CHROMIUM_HOME}"
	doexe out/Release/chrome

	newexe out/Release/chrome_sandbox chrome-sandbox
	fperms 4755 "${CHROMIUM_HOME}/chrome-sandbox"

	doexe out/Release/chromedriver
	doexe out/Release/chrome_crashpad_handler

	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" "/usr/bin/chromium-browser${browser_suffix}"
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" "/usr/bin/chromium${browser_suffix}"
	dosym "${CHROMIUM_HOME}/chromedriver" "/usr/bin/chromedriver${browser_suffix}"

	pushd out/Release/locales >/dev/null || die
	local lang pak
	for lang in ${CHROMIUM_LANGS}; do
		[[ -f "${lang}.pak" ]] || eqawarn "no .pak file for ${lang}"
	done
	for pak in *.pak; do
		lang="${pak%.pak}"
		lang="${lang%%_*}"
		[[ "${lang}" == en-US ]] && continue
		has "${lang}" ${CHROMIUM_LANGS} || eqawarn "no ${lang} in CHROMIUM_LANGS"
		use "l10n_${lang}" || rm -f "${pak}" "${pak}.info" || die
	done
	rm -f fake-bidi.pak fake-bidi.pak.info || die
	popd >/dev/null || die

	insinto "${CHROMIUM_HOME}"
	doins "${FILESDIR}/chromium-launcher.sh"
	doins out/Release/*.bin
	doins out/Release/*.pak
	doins out/Release/*.so
	doins out/Release/*.so.[0-9]
	doins out/Release/icudtl.dat
	doins -r out/Release/locales
	doins -r out/Release/MEIPreload
	doins out/Release/vk_swiftshader_icd.json

	if [[ -d out/Release/swiftshader ]]; then
		insinto "${CHROMIUM_HOME}/swiftshader"
		doins out/Release/swiftshader/*.so
	fi

	# Install icons
	local branding size
	for size in 16 24 32 48 64 128 256; do
		case ${size} in
			16|32) branding="chrome/app/theme/default_100_percent/chromium" ;;
				*) branding="chrome/app/theme/chromium" ;;
		esac
		newicon -s ${size} "${branding}/product_logo_${size}.png" "chromium-browser${browser_suffix}.png"
	done

	# Install desktop entry
	domenu "out/Release/chromium-browser${browser_suffix}.desktop"

	# Install GNOME default application entry
	insinto /usr/share/gnome-control-center/default-apps
	doins "out/Release/chromium-browser${browser_suffix}.xml"

	# Install AppStream metadata
	insinto /usr/share/appdata
	doins "out/Release/chromium-browser${browser_suffix}.appdata.xml"

	# Install manpage
	doman "out/Release/chromium-browser${browser_suffix}.1"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	readme.gentoo_print_elog
}
