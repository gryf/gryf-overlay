# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit git-r3
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://github.com/gryf/pygtktalog"
EGIT_REPO_URI="https://github.com/gryf/pygtktalog.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/exifread
	dev-python/sqlalchemy
	media-libs/mutagen
"
DEPEND="${RDEPEND}"
