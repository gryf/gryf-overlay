# Copyright 1999-2006 Gentoo Foundation 
# Distributed under the terms of the GNU General Public License v2 
# $Header: /var/cvsroot/gentoo-x86/net-misc/nozomi/nozomi-2.21.ebuild,v 1.1 2006/08/28 09:25:36 mariano Exp $ 

inherit eutils linux-mod 

nozomifile="nozomi_2.21alpha_060917.tar.gz" 

DESCRIPTION="Driver for modem Option Globetrotter UMTS/EDGE " 
HOMEPAGE="http://www.pharscape.org" 
#SRC_URI="/usr/portage/distfiles/${PN}-2.21.tar.bz2" 
SRC_URI="${nozomifile}" 
LICENSE="GPL-2" 
SLOT="0" 
KEYWORDS="x86 ~amd64" 
RESTRICT="fetch" 
IUSE="" 
MODULE_NAMES="nozomi(kernel/drivers/pci/hotplug:)" 
BUILD_TARGETS=" " 
FETCH_NOZOMI="http://www.pharscape.org/index2.php?option=com_forum&Itemid=68&page=download&id=18" 
CONFIG_CHECK="MODULES" 

S=${WORKDIR}/nozomi_2.21alpha_060917 


pkg_setup() { 
   linux-mod_pkg_setup 
   BUILD_PARAMS="KDIR=${KV_DIR}" 
} 

pkg_nofetch() { 
   einfo "Please download ${nozomifile} from:" 
   einfo ${FETCH_NOZOMI} 
   einfo "and move it to ${DISTDIR}" 
} 

src_unpack() { 
   if [ ! -r ${DISTDIR}/${nozomifile} ]; then 
      die "cannot read ${nozomifile}. Please check the permission and try again." 
   fi 
   for pkg in ${A}; do 
      cd ${WORKDIR} 
      unpack ${pkg} 
      if kernel_is ge 2 6 20 ; then 
                      cd ${S} 
         epatch "${FILESDIR}"/${P}-kernel-2.6.20.patch 
      fi
      if kernel_is ge 2 6 22 ; then 
                      cd ${S} 
	 epatch "${FILESDIR}"/${P}-pci_module_init.patch
      fi 

   done 
} 


src_compile() { 
   linux-mod_src_compile 

    
} 


src_install() { 
   linux-mod_src_install 
   #dodir /usr/share/${PN}/samples 
   #insinto   /usr/share/${PN}/samples 
   #doins "${FILESDIR}"/net 
   #doins "${FILESDIR}"/www.plusgsm.pl 
   #doins "${FILESDIR}"/chat-www.plusgsm.pl 
   #doins "${FILESDIR}"/51-3g-datacard.rules 

    
} 

pkg_postinst() { 
   linux-mod_pkg_postinst 
   einfo "Have fun :)" 
    
}
