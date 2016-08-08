# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Full Color Paint tool"
HOMEPAGE="http://azsky2.html.xdomain.jp/linux/azpainterb/index.html"
SRC_URI="https://osdn.jp/frs/redir.php?m=cznic&f=%2Fazpainterb%2F66065%2Fazpainterb-1.0.2.tar.bz2"

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
