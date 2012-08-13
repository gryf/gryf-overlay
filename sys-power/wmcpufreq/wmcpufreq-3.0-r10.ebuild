# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="wmcpufreq displays frequency, used driver and active governor"
HOMEPAGE="http://dockapps.org/file.php/id/309"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ppc sparc x86"
IUSE=""
SRC_URI="http://dockapps.windowmaker.org/download.php/id/862/wmcpufreq-3.0.tar.gz"
DEPEND="virtual/libc
	>=sys-power/cpufrequtils-002
	>=gnome-base/libglade-2.0"

src_compile() {
	make || die
	cd util
	./configure
	make
	cd ..
}

src_install () {
	into /usr
	dobin wmcpufreq/wmcpufreq
	dobin util/src/gcpufreqset
}
