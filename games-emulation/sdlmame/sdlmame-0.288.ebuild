EAPI=8
PYTHON_COMPAT=( python3_{8..15} )
inherit desktop python-any-r1 toolchain-funcs qmake-utils xdg-utils

MY_PV="${PV/.}"

DESCRIPTION="Multiple Arcade Machine Emulator + Multi Emulator Super System (MESS)"
HOMEPAGE="http://mamedev.org/"
SRC_URI="https://github.com/mamedev/mame/archive/mame${MY_PV}.tar.gz -> mame-${PV}.tar.gz"

LICENSE="GPL-2+ BSD-2 MIT CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa debug opengl openmp tools"

RDEPEND="dev-db/sqlite:3
	dev-libs/expat
	media-libs/fontconfig
	media-libs/flac
	media-libs/libsdl2[joystick,opengl?,sound,video,X]
	media-libs/libpulse
	media-libs/portaudio
	media-libs/sdl2-ttf
	sys-libs/zlib
	virtual/jpeg:0
	virtual/opengl
	alsa? (
		media-libs/alsa-lib
		media-libs/portmidi
	)
	debug? (
		dev-qt/qtcore:6
		dev-qt/qtgui:6
		dev-qt/qtwidgets:6
	)
	x11-libs/libX11
	x11-libs/libXinerama
	dev-libs/libutf8proc
	media-libs/glm
	dev-libs/rapidjson
	dev-libs/pugixml"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	x11-base/xorg-proto"
BDEPEND="${PYTHON_DEPS}"
S="${WORKDIR}/mame-mame${MY_PV}"

USER_INI_PATH="\$HOME/.config/${PN}"
SYS_INI_PATH="/etc/${PN}"

# Function to disable a makefile option
disable_feature() {
	sed -i -e "/^[ 	]*$1.*=/s:^:# :" makefile || die
}

# Function to enable a makefile option
enable_feature() {
	sed -i -e "/^#.*$1.*=/s:^#[ 	]*::"  makefile || die
}

pkg_setup() {
	python-any-r1_pkg_setup
}

src_prepare() {
	default
	# Disable using bundled libraries
	enable_feature USE_SYSTEM_LIB_UTF8PROC
	enable_feature USE_SYSTEM_LIB_GLM
	enable_feature USE_SYSTEM_LIB_RAPIDJSON
	enable_feature USE_SYSTEM_LIB_PUGIXML
	enable_feature USE_SYSTEM_LIB_EXPAT
	enable_feature USE_SYSTEM_LIB_FLAC
	enable_feature USE_SYSTEM_LIB_JPEG
# Use bundled lua for now to ensure correct compilation (ref. b.g.o #407091)
#	enable_feature USE_SYSTEM_LIB_LUA
	enable_feature USE_SYSTEM_LIB_PORTAUDIO
	enable_feature USE_SYSTEM_LIB_SQLITE3
	enable_feature USE_SYSTEM_LIB_ZLIB

	# Disable warnings being treated as errors and enable verbose build output
	enable_feature NOWERROR
	enable_feature VERBOSE
	enable_feature IGNORE_GIT

	use amd64 && enable_feature PTR64
	use debug && enable_feature DEBUG
	use tools && enable_feature TOOLS
	disable_feature NO_X11 # bgfx needs X
	use openmp && enable_feature OPENMP

	if use alsa ; then
		enable_feature USE_SYSTEM_LIB_PORTMIDI
	else
		enable_feature NO_USE_MIDI
	fi

	sed -i \
		-e 's/ -Os//' \
		-e '/^\(CC\|CXX\|AR\) /s/=/?=/' \
		3rdparty/genie/build/gmake.linux/genie.make || die
}

src_compile() {
	local targetargs
	local qtdebug=$(usex debug 1 0)
	local ini_path="${USER_INI_PATH};${SYS_INI_PATH}"

	# hack to replace shitty lua escape quotation
	sed -i \
		-e 's|\(#define INI_PATH\) "$HOME/.APP_NAME.*|\1 "'${ini_path}'"|' \
		src/osd/sdl/sdlopts.cpp || die
	# and for futureproof:
	sed -i \
		-e 's|\(#define INI_PATH\) "$HOME/.APP_NAME.*|\1 "'${ini_path}'"|' \
		src/osd/sdl3/sdlopts.cpp || die
	# untill its fixed: https://github.com/mamedev/mame/issues/10927

	# Workaround conflicting $ARCH variable used by both Gentoo's
	# portage and by Mame's build scripts
	PYTHON_EXECUTABLE=${PYTHON} \
	OVERRIDE_CC=$(tc-getCC) \
	OVERRIDE_CXX=$(tc-getCXX) \
	OVERRIDE_LD=$(tc-getCXX) \
	QT_SELECT=qt6 \
	QT_HOME="$(qt6_get_libdir)/qt6" \
	ARCH= \
	emake ${targetargs} \
		USE_QTDEBUG=${qtdebug} \
		AR=$(tc-getAR)
}

src_install() {
	local MAMEBIN=mame
	dobin ${MAMEBIN}
	dosym ${MAMEBIN} "/usr/bin/${PN}"
	doman docs/man/mame.6

	insinto "/usr/share/${PN}"
	doins -r keymaps hash

	# Create default mame.ini and inject Gentoo settings into it
	./${MAMEBIN} -noreadconfig -showconfig > "${T}/mame.ini" || die
	# -- Paths --
	for f in {rom,hash,sample,art,font,crosshair} ; do
		sed -i \
			-e "s:\(${f}path\)[ \t]*\(.*\):\1 \t\t${USER_INI_PATH}/\2;/usr/share/${PN}/\2:" \
			"${T}/mame.ini" || die
	done
	for f in {ctrlr,cheat} ; do
		sed -i \
			-e "s:\(${f}path\)[ \t]*\(.*\):\1 \t\t${USER_INI_PATH}/\2;${SYS_INI_PATH}/\2;/usr/share/${PN}/\2:" \
			"${T}/mame.ini" || die
	done
	# -- Directories
	for f in {cfg,nvram,memcard,input,state,snapshot,diff,comment} ; do
		sed -i \
			-e "s:\(${f}_directory\)[ \t]*\(.*\):\1 \t\t${USER_INI_PATH}/\2:" \
			"${T}/mame.ini" || die
	done
	# -- Keymaps --
	sed -i \
		-e "s:\(keymap_file\)[ \t]*\(.*\):\1 \t\t${USER_INI_PATH}/\2:" \
		"${T}/mame.ini" || die
	for f in keymaps/km*.map ; do
		sed -i \
			-e "/^keymap_file/a \#keymap_file \t\t/usr/share/${PN}/keymaps/${f##*/}" \
			"${T}/mame.ini" || die
	done
	insinto ${SYS_INI_PATH}
	doins "${T}/mame.ini" "${FILESDIR}/vector.ini"

	#dodoc docs/{config,mame,newvideo}.txt
	keepdir \
		"/usr/share/${PN}"/{ctrlr,cheat,roms,samples,artwork,crosshair} \
		"${SYS_INI_PATH}"/{ctrlr,cheat}

	if use tools ; then
		for f in castool chdman floptool imgtool jedutil ldresample ldverify romcmp ; do
			newbin ${f} ${PN}-${f}
			newman docs/man/${f}.1 ${PN}-${f}.1
		done
		#newbin ldplayer${suffix} ${PN}-ldplayer
		#newman docs/man/ldplayer.1 ${PN}-ldplayer.1
	fi

	newicon "${FILESDIR}/${PN}.png" "${PN}".png
}

pkg_postinst() {
	xdg_desktop_database_update

	elog "It is strongly recommended to change either the system-wide"
	elog "  ${SYS_INI_PATH}/mame.ini or use a per-user setup at ~/.${PN}/mame.ini"
	elog
	if use opengl ; then
		elog "You built ${PN} with opengl support and should set"
		elog "\"video\" to \"opengl\" in mame.ini to take advantage of that"
		elog
		elog "For more info see http://wiki.mamedev.org"
	fi
}

pkg_postrm(){
	xdg_desktop_database_update
}
