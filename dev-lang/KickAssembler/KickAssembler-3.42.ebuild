# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2

DESCRIPTION="Cross assembler for 6510 code"
HOMEPAGE="http://www.theweb.dk/KickAssembler/Main.php"
SRC_URI="http://www.theweb.dk/KickAssembler/${PN}${PV}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jre-1.8"
RDEPEND="${DEPEND}"

THENAME="KickAss"

S=${WORKDIR}

src_install() {
	java-pkg_jarinto /opt/${PN}
	java-pkg_newjar ${THENAME}.jar ${THENAME}.jar
	java-pkg_dolauncher \
		${PN} \
		--jar /opt/${PN}/${THENAME}.jar \
		-into /opt

	#into /opt/${PN}
	cp -a "${S}/Examples" ${D}/opt/${PN} || die "Failed to copy examples"
	cp "${S}/${THENAME}.cfg" ${D}/opt/${PN} || die "Failed to copy config"
	docinto KickAssembler.pdf /opt/${PN}
}
