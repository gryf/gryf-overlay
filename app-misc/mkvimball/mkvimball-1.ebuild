# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/vim/vim-7.3.75.ebuild,v 1.1 2010/12/08 20:19:54 lack Exp $

EAPI=3

DESCRIPTION="Little util for creating vimball archives written in C"
HOMEPAGE="http://mysite.verizon.net/astronaut/src/index.html#MKVIMBALL"
SRC_URI="http://mysite.verizon.net/astronaut/src/${PN}.tar.gz"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

S="${WORKDIR}/MKVIMBALL"

src_install(){
	mkdir -p "${D}"usr/bin
	cp mkvimball "${D}"usr/bin
}
