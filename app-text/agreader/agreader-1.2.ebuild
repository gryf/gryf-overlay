EAPI=7

inherit eutils

DESCRIPTION="Read AmigaGuide hybertext documents on console"
SRC_URI="http://aminet.net/misc/unix/AGReader.tar.bz2"
HOMEPAGE="http://aminet.net/package/misc/unix/AGReader"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

S="${WORKDIR}/AGReader"

src_compile() {
	cd "${WORKDIR}"/AGReader/Sources && make || die "make failed"
}

src_install() {
	dobin "${WORKDIR}"/AGReader/Sources/agr
	dodoc "${WORKDIR}"/AGReader/Docs/*
}
