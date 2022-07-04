# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="A simple GUI frontend for the scrot, imlib2, or ImageMagick screenshooters"
HOMEPAGE="https://github.com/thenaterhood/gscreenshot"
SRC_URI="https://github.com/thenaterhood/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND="
	dev-python/pillow
	dev-python/pygobject
	dev-python/setuptools
	media-gfx/scrot
	x11-misc/xclip"

RDEPEND="${DEPEND}"

DOCS=( README.md )
