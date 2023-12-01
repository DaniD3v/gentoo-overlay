EAPI=8

inherit unpacker xdg

DESCRIPTION="Cisco's packet tracer"
HOMEPAGE="https://www.netacad.com/portal/resources/packet-tracer"
SRC_URI="CiscoPacketTracer_821_Ubuntu_64bit.deb"

LICENSE="Cisco"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="fetch mirror strip"

S=${WORKDIR}

pkg_nofetch(){
	ewarn "To install this package, you need a Cisco account."
        ewarn "You can download the packettracer file from"
	ewarn "${HOMEPAGE}."
        ewarn "Download the packettracer binary named"
	ewarn "\"${A}\" and move it to your DISTDIR directory."
        ewarn "(most likely /var/cache/distfiles)."
        ewarn "Finally, proceed with the installation."
}

src_install(){
	mkdir -p ${ED}/usr/share/applications
	cp ${FILESDIR}/packettracer.desktop ${ED}/usr/share/applications/

	cp -r . ${ED}
	dobin opt/pt/packettracer
}
