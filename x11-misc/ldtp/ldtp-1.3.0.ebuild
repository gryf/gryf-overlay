# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# For bugs/comments/suggestion
# Navtej Singh (n.s.buttar@gmail.com)


DESCRIPTION="A high quality test automation framework for desktop applications."
HOMEPAGE="http://ldtp.freedesktop.org"
#http://download.freedesktop.org/ldtp/1.x/1.3.x/ldtp-1.3.0.tar.gz
SRC_URI="http://download.freedesktop.org/${PN}/1.x/1.3.x/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~ia64 ~x86"
IUSE="localization goptionparse newroles"
DEPEND="gnome-extra/at-spi
	    >=dev-libs/glib-2.2.0
		gnome-extra/libgail-gnome
		gnome-base/gail
		dev-lang/python
		localization? ( sys-devel/gettext )
	    dev-libs/libxml2"
RDEPEND="${DEPEND}"


src_compile()
{
	econf \
        $(use_enable localization) \
        $(use_enable goptionparse) \
        $(use_enable newroles) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install()
{
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS COPYING NEWS README TODO
}
