# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="A screencast tool to display keys"
HOMEPAGE="http://launchpad.net/screenkey"
SRC_URI="http://launchpad.net/screenkey/0.2/0.2.0/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pygtk:2
	dev-python/python-xlib"
RDEPEND="${DEPEND}"
