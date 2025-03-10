# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 gnome3 meson vala

DESCRIPTION="A GObject-based library for accessing the Secret Service API of the freedesktop.org project, a cross-desktop effort to access passwords, tokens and other types of secrets."
HOMEPAGE="https://wiki.gnome.org/Projects/Libsecret"
SRC_URI="https://github.com/GNOME/libsecret/tarball/e59012225c2857d53738574423416b541f11a131 -> libsecret-0.21.6-e590122.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
IUSE="bash-completion +crypt +gnome-keyring gtk-doc +introspection tpm +vala"
REQUIRED_USE="
	gtk-doc? ( crypt )
	vala? ( introspection )
"

S="${WORKDIR}/GNOME-libsecret-e590122"

RDEPEND="
	>=dev-libs/glib-2.44.0
	crypt? ( >=dev-libs/libgcrypt-1.2.2 )
	bash-completion? ( app-shells/bash-completion )
	tpm? ( >=app-crypt/tpm2-tss-3.0.3 )"
DEPEND="${RDEPEND}
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	gtk-doc? ( >=dev-util/gi-docgen-2021.7 )
	introspection? ( >=dev-libs/gobject-introspection-1.29 )
	vala? ( $(vala_depend) )"
PDEPEND="gnome-keyring? ( gnome-base/gnome-keyring )"

src_prepare() {
	use vala && vala_src_prepare
	default
}

src_configure() {
	local emesonargs=(
		$(meson_feature bash-completion bash_completion) # meson_feature for enabled or disabled options
		-Dbashcompdir="$(get_bashcompdir)"
		-Dcrypto="libgcrypt"
		$(meson_use gtk-doc gtk_doc) # meson_use for true or false options
		$(meson_use introspection)
		$(meson_use tpm tpm2)
		$(meson_use vala vapi)
	)
	meson_src_configure
}
