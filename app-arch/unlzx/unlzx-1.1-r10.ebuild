# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit toolchain-funcs

DESCRIPTION="Unarchiver for Amiga LZX archives"
SRC_URI="http://aminet.net/misc/unix/${PN}.c.gz http://aminet.net/misc/unix/${PN}.c.readme"
HOMEPAGE="http://aminet.net/package/misc/unix/unlzx.c"

SLOT="0"
LICENSE="freedist"
IUSE=""
KEYWORDS="alpha amd64 ~hppa ppc sparc x86 ~amd64-linux ~x86-linux ~ppc-macos"

src_unpack() {
	mkdir "${S}"
	gzip -dc "${DISTDIR}"/${PN}.c.gz > "${S}"/unlzx.c
	cp "${DISTDIR}"/${PN}.c.gz.readme  "${S}"/${PN}.c.gz.readme
}

src_compile() {
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -o unlzx unlzx.c || die
}

src_install() {
	dobin unlzx
	dodoc unlzx.c.gz.readme
}
