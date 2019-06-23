# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

MY_PV="${PV/_}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Amiga emulator based on WinUAE emulation code"
HOMEPAGE="https://fs-uae.net/"
SRC_URI="https://fs-uae.net/stable/${MY_PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+lua"

DEPEND=">=media-libs/libsdl2-2.0.0[joystick,opengl,X]
	media-libs/openal
	media-libs/libpng
	dev-libs/glib:2
	sys-libs/zlib
	media-libs/glew
	media-libs/libmpeg2
	media-libs/freetype:2
	lua? ( >=dev-lang/lua-5.1 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
