# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2

DESCRIPTION="Cross assembler for 6510 code"
HOMEPAGE="http://www.theweb.dk/KickAssembler/Main.php"
# This is unchanged archive downloaded from homepage. For some reason IIS 
# which is used for hosting rejects direct download for tools like curl/wget, 
# hence the mirror on my web server.
SRC_URI="https://nc.vimja.com/s/yHgwbktCejJ3d3T/download/${PN}${PV}.zip"

KEYWORDS="~amd64 ~x86"

LICENSE=""
SLOT="0"
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
	java-pkg_dolauncher \
		${THENAME}3To4Converter \
		--jar /opt/${PN}/${THENAME}3To4Converter.jar \
		-into /opt

	#into /opt/${PN}
	cp -a "${S}/Examples" ${D}/opt/${PN} || die "Failed to copy examples"
	cp "${S}/${THENAME}.cfg" ${D}/opt/${PN} || die "Failed to copy config"
	docinto KickAssembler.pdf /opt/${PN}
}
