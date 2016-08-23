# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs user

DESCRIPTION="Transparent redirector of any TCP connection to proxy"
HOMEPAGE="http://darkk.net.ru/redsocks/"
SRC_URI="mirror://github/darkk/${PN}/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="dev-libs/libevent
	net-firewall/iptables"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_compile() {
	emake
}

src_install() {
	dobin redsocks
	dodoc README doc/*
	insinto /etc/redsocks
	newins redsocks.conf.example redsocks.conf
}
