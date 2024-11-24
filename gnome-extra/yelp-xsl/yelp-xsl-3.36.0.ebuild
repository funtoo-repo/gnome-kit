# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome.org

DESCRIPTION="XSL stylesheets for yelp"
HOMEPAGE="https://git.gnome.org/browse/yelp-xsl"

LICENSE="GPL-2+ LGPL-2.1+ MIT FDL-1.1+"
SLOT="0"
IUSE=""
KEYWORDS="*"

RDEPEND="
	>=dev-libs/libxml2-2.6.12:=
	>=dev-libs/libxslt-1.1.8:=
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.40
	>=dev-util/itstool-1.2.0
	sys-devel/gettext
	virtual/awk
	virtual/pkgconfig
"
