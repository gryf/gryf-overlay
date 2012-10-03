# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Conservative Quake 1 engine and QuakeWorld client"
HOMEPAGE="http://disenchant.net/engine.html"
SRC_URI="http://disenchant.net/files/engine/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"

S=${WORKDIR}/${P}
dir=${GAMES_DATADIR}/quake1

# These dependencies have not been checked
COMMON="media-libs/alsa-lib
	virtual/jpeg
	media-libs/libogg
	media-libs/libpng
	media-libs/libvorbis
	net-libs/gnutls
	virtual/opengl
	media-libs/libsdl
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXxf86vm"
DEPEND="${COMMON}
	dev-util/pkgconfig
	x11-proto/xextproto
	x11-proto/xf86dgaproto
	x11-proto/xf86vidmodeproto
	x11-proto/xproto"

src_unpack() {
	unpack ${A}
	echo "${S}"
	cd "${S}"
}

src_compile() {
#	local apps
#	use dedicated && apps="${apps} tyr-qwsv"
#	use X && apps="${apps} tyr-quake tyr-qwcl"
#	if use opengl || [[ -z "${apps}" ]] ; then
#		apps="${apps} tyr-glquake tyr-glqwcl"
#	fi

	emake QBASEDIR="${dir}" || die "emake ${apps} failed"
}

src_install() {
	dogamesbin tyr-* || die "dogamesbin failed"

	dodoc readme.txt

	prepgamesdirs
}
