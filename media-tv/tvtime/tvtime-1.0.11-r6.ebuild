# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# ebuild has been based on Debian package and patches.

EAPI=7

inherit autotools eutils git-r3

DESCRIPTION="High quality television application for use with video capture cards"
HOMEPAGE="https://git.linuxtv.org/tvtime.git/about/"
EGIT_REPO_URI="https://git.linuxtv.org/tvtime.git"
EGIT_COMMIT="v${PV}"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris"
IUSE="nls static xinerama"

RDEPEND="dev-libs/icu
	dev-libs/libxml2
	media-libs/alsa-lib
	media-libs/freetype
	media-libs/libpng
	sys-libs/zlib
	x11-libs/libICE
	x11-libs/libXScrnSaver
	x11-libs/libXext
	x11-libs/libXv
	x11-libs/libXxf86vm
	xinerama? ( x11-libs/libXinerama )"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-saveconfig.patch"
	"${FILESDIR}/${P}-home.diff"
	"${FILESDIR}/${P}-freetype.patch"
	"${FILESDIR}/${P}-fix-warning-implicit-declaration-major.patch"
	"${FILESDIR}/${P}-disable-insecure-temp-file.patch"
	"${FILESDIR}/${P}-libxml2.patch"
	"${FILESDIR}/${P}-metainfo.patch"
)

src_prepare() {
	eapply ${PATCHES[@]}
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_enable static) \
		$(use_with xinerama) \
		|| die "econf failed"
}
