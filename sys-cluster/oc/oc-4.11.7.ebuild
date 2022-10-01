# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

DESCRIPTION="OpenShift command line client"
HOMEPAGE="https://github.com/openshift/origin https://www.openshift.org/"
SRC_URI="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${PV}/openshift-client-linux.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion"

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	dobin "oc"
	cd "${S}"
	./oc completion bash > oc_completion
	newbashcomp oc_completion oc
}
