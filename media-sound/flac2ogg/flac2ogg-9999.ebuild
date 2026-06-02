# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..15} )

inherit git-r3

DESCRIPTION="Multiprocess convert audio files from commandline "
HOMEPAGE="https://github.com/gryf/flac2ogg"
EGIT_REPO_URI="https://github.com/gryf/flac2ogg"

IUSE="+tags +lame mac wav m4a cue"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	media-libs/flac
	media-sound/vorbis-tools[ogg123]
	mac? ( media-sound/mac )
	lame? ( media-sound/lame )
	tags? ( media-libs/mutagen )
	m4a? ( media-video/mplayer )
	cue? (
		app-cdr/cuetools
		media-sound/shntool
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	pushd "${S}" || die
	mv flac2ogg.py flac2ogg

	dobin flac2ogg
}
