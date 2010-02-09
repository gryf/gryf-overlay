# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: gryf's overlay, v 1.0 2007/01/31 21:11:10 gryf Exp $

inherit ruby

DESCRIPTION="Ruby localization with locale library"
SRC_URI="http://freebsd.unixfreunde.de/sources/${P}.tar.gz"
SLOT="0"
KEYWORDS="amd64 x86"
PATCHES="${FILESDIR}/ruby_locale_get_method.patch"
