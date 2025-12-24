# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="AROS tool to create .info files for Amiga based platforms"
HOMEPAGE="https://www.amigadev.com/ports/ilbmtoicon"
EGIT_REPO_URI="https://github.com/AmigaPorts/ilbmtoicon"

LICENSE="AROS PUBLIC LICENSE (APL) 1.4"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DEPEND="
	media-libs/libpng
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ilbmtoicon || die
	dobin infoinfo || die
	dodoc README.md
}
