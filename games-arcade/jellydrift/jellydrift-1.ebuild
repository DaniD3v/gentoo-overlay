EAPI=8

inherit desktop xdg

DESCRIPTION="car go vroom zoom skrrrt"
HOMEPAGE="https://danidev.itch.io/jelly-drift"
SRC_URI="https://github.com/DaniD3v/aur-files/raw/main/JellyDrift.tar.xz"

LICENSE="@FREE"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="strip"

S="${WORKDIR}/JellyDrift"

src_install() {
    insinto /opt/jellydrift
    doins -r ${S}/*

    chmod +x ${D}/opt/jellydrift/JellyDriftLinux.x86_64

    dobin "${FILESDIR}/jellydrift"
    domenu "${FILESDIR}/jellydrift.desktop"
}

pkg_postinst() {
    xdg_desktop_database_update
}

pkg_postrm() {
    xdg_desktop_database_update
}
