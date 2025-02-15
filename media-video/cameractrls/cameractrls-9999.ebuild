# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools

inherit git-r3 distutils-r1

DESCRIPTION="Camera controls for Linux "
HOMEPAGE="https://github.com/soyersoyer/cameractrls"
EGIT_REPO_URI="https://github.com/gryf/cameractrls"
IUSE="-daemon gtk3 -gtk4 ptz view"

LICENSE="LGPLv3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-libs/gtk
	>=x11-libs/gtk+-3.22
	dev-python/pygobject[${PYTHON_USEDEP}]
	media-libs/libsdl2
	dev-libs/libspnav
"
RDEPEND="${DEPEND}"
BDEPEND=""
