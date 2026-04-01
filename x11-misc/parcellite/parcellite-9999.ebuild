# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools xdg git-r3

MY_P=${PN}-${PV/_}
DESCRIPTION="Lightweight GTK+ based clipboard manager"
HOMEPAGE="https://parcellite.sourceforge.net/"
EGIT_REPO_URI="https://git.code.sf.net/p/parcellite/git"
EGIT_COMMIT="4a0eafddcbc5bc0e55201ccf5bfeca80523df78c"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

RDEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:2
	x11-misc/xdotool"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-util/intltool
	sys-devel/gettext
	"

PATCHES=( "${FILESDIR}"/${PN}-desktop-QA.patch )

src_install() {
	default
	gzip -d "${ED}"/usr/share/man/man1/${PN}.gz || die
}
