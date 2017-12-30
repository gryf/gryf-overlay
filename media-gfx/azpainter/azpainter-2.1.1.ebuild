# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Full Color Paint tool"
HOMEPAGE="https://osdn.net/projects/azpainter/"
SRC_URI="https://osdn.net/projects/azpainter/downloads/68339/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/libXi
	virtual/jpeg
	media-libs/libpng
	sys-libs/zlib"
RDEPEND="${DEPEND}"
