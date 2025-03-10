# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2

DESCRIPTION="The GNOME Structured File Library"
HOMEPAGE="https://developer.gnome.org/gsf/"
SRC_URI="https://download.gnome.org/sources/libgsf/1.14/libgsf-1.14.53.tar.xz -> libgsf-1.14.53.tar.xz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0/114" # libgsf-1.so version
KEYWORDS="*"
IUSE="bzip2 gtk +introspection"

RDEPEND="
	>=dev-libs/glib-2.62.2:2
	>=dev-libs/libxml2-2.4.16:2
	sys-libs/zlib
	bzip2? ( app-arch/bzip2 )
	gtk? (
		x11-libs/gdk-pixbuf:2
		media-gfx/imagemagick
	)
	introspection? ( >=dev-libs/gobject-introspection-1.62.0:= )
"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.12
	>=dev-util/intltool-0.35.0
	dev-libs/gobject-introspection-common
	virtual/pkgconfig
"

src_configure() {
	gnome2_src_configure \
		--disable-static \
		$(use_with bzip2 bz2) \
		$(use_enable introspection) \
		$(use_with gtk gdk-pixbuf)
}