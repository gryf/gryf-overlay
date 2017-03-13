# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Full Color Paint tool"
HOMEPAGE="http://azsky2.html.xdomain.jp/linux/azpainterb/index.html"
SRC_URI="https://osdn.net/frs/redir.php?m=onet&f=%2F${PN}%2F67265%2F${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/libXi
	virtual/jpeg"
RDEPEND="${DEPEND}"
