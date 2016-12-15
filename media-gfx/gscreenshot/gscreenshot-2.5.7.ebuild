# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
PYTHON_SINGLE_TARGET="python2_7"

inherit distutils-r1

DESCRIPTION="Python screenshot GTK program"
HOMEPAGE="https://github.com/thenaterhood/gscreenshot"
SRC_URI="https://github.com/thenaterhood/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/pillow
	dev-python/pygobject"

RDEPEND="${DEPEND}
	media-gfx/scrot"

DOCS=( README.md )

python_test() {
	nosetests -w "${BUILD_DIR}"/lib \
	|| die "Tests fail with ${EPYTHON}"
}
