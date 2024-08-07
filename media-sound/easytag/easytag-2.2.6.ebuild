# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools gnome.org xdg-utils autotools

DESCRIPTION="GTK+ utility for editing MP2, MP3, MP4, FLAC, Ogg and other media tags"
HOMEPAGE="https://wiki.gnome.org/Apps/EasyTAG"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="flac gtk2 mp3 mp4 nls speex vorbis wavpack"

RDEPEND=">=x11-libs/gtk+-2.24:2
	mp3? (
		>=media-libs/id3lib-3.8.3-r7
		media-libs/libid3tag
		)
	flac? (
		media-libs/flac
		media-libs/libvorbis
		)
	mp4? ( media-libs/taglib[mp4(+)] )
	vorbis? ( media-libs/libvorbis )
	wavpack? ( media-sound/wavpack )
	speex? (
		media-libs/speex
		media-libs/libvorbis
		)"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

# PATCHES=(
	# "${FILESDIR}"/${P}-001-format-overflow.patch
	# "${FILESDIR}"/${P}-002-declaration-after-statement.patch
	# "${FILESDIR}"/${P}-003-desktop.patch
	# "${FILESDIR}"/${P}-004-docs.patch
	# "${FILESDIR}"/${P}-005-taglib.patch
# )

DOCS=( AUTHORS ChangeLog HACKING NEWS README THANKS TODO )

src_configure() {
	eautoreconf
	econf \
		$(use_enable nls) \
		$(use_enable mp3) \
		$(use_enable mp3 id3v23) \
		$(use_enable vorbis ogg) \
		$(use_enable speex) \
		$(use_enable flac) \
		$(use_enable mp4) \
		$(use_enable wavpack) \
		$(use_with gtk2)
	# workaround for gcc>10
	sed -i -e 's/\(^CFLAGS = .*\)/\1 -fcommon/' Makefile || die
}

pkg_postinst() { xdg_desktop_database_update; }
pkg_postrm() { xdg_desktop_database_update; }
