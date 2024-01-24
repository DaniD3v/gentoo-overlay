EAPI=8

inherit meson

DESCRIPTION="The best way to make beautiful and functional wayland widgets"
HOMEPAGE="https://github.com/Aylur/ags"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bluetooth battery network system-tray power-profiles"

GVC_URI="https://gitlab.gnome.org/GNOME/libgnome-volume-control"
GVC_COMMIT="dbfbacc9571fade87855907b78c6ed5e27c910dd"

SRC_URI="
	https://github.com/Aylur/ags/releases/download/v${PV}-beta/ags-v${PV}-beta.tar.gz
	https://raw.githubusercontent.com/DaniD3v/pkg-files/main/gentoo/AGS-nodemodules.tar.gz
"

DEPEND="
	dev-libs/glib:2
	>=dev-libs/gobject-introspection-1.49.1
	>=dev-libs/gjs-1.73.1
	x11-libs/gtk+:3
"

BDEPEND="
	${DEPEND}

	dev-lang/typescript
	>=dev-build/meson-0.62.0
"

DEPEND="
	${DEPEND}

	gui-libs/gtk-layer-shell[introspection]

	bluetooth? ( net-wireless/gnome-bluetooth )
	battery? ( sys-power/upower )
	network? ( net-misc/networkmanager )
	system-tray? ( dev-libs/libdbusmenu )
	power-profiles? ( sys-power/power-profiles-daemon )
"

S="${WORKDIR}/ags"

src_configure() {
	mv ../node_modules ./ # npm install from tarball
	meson setup build --prefix=/usr
}

src_compile() {
	meson_src_compile -C build
}

src_install() {
	meson_src_install -C build
}

