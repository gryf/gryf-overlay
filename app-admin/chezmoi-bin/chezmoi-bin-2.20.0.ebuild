# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

MY_PN="${PN%-bin}"

DESCRIPTION="Manage your dotfiles across multiple diverse machines, securely."
HOMEPAGE="https://www.chezmoi.io/"
SRC_URI="
	amd64? ( https://github.com/twpayne/${MY_PN}/releases/download/v${PV}/${MY_PN}_${PV}_linux_amd64.deb )
	arm? ( https://github.com/twpayne/${MY_PN}/releases/download/v${PV}/${MY_PN}_${PV}_linux_armel.deb )
	arm64? ( https://github.com/twpayne/${MY_PN}/releases/download/v${PV}/${MY_PN}_${PV}_linux_arm64.deb )
	ppc64? ( https://github.com/twpayne/${MY_PN}/releases/download/v${PV}/${MY_PN}_${PV}_linux_ppc64.deb )
	x86? ( https://github.com/twpayne/${MY_PN}/releases/download/v${PV}/${MY_PN}_${PV}_linux_i386.deb )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="mirror"

QA_PREBUILT="
	usr/bin/${MY_PN}"

S="${WORKDIR}"

src_unpack() {
	unpack_deb "${A}"
}

src_install() {
	insinto /
	doins -r *

	fperms +x /usr/bin/${MY_PN}
}
