# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
PYPI_NO_NORMALIZE=1
PYPI_PN="bandcamp-downloader"

inherit distutils-r1 git-r3

DESCRIPTION="Simple python script to download Bandcamp albums"
HOMEPAGE="https://github.com/iheanyi/bandcamp-dl"
EGIT_REPO_URI="https://github.com/iheanyi/bandcamp-dl.git"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/beautifulsoup4-4.11.1
	>=dev-python/chardet-4.0.0
	>=dev-python/demjson3-3.0.5
	>=dev-python/docopt-ng-0.8.1
	>=dev-python/requests-2.31.0
	>=dev-python/unicode-slugify-0.1.5
	>=media-libs/mutagen-1.45.1
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
