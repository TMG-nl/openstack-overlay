# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/jinja/jinja-2.5.5.ebuild,v 1.11 2011/02/13 20:37:36 grobian Exp $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="setup.py"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="Jinja2"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A small but fast and easy to use stand-alone template engine written in pure python."
HOMEPAGE="http://jinja.pocoo.org/ http://pypi.python.org/pypi/Jinja2"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris"
IUSE="doc examples i18n vim-syntax"

RDEPEND="dev-python/markupsafe
	dev-python/setuptools
	i18n? ( >=dev-python/Babel-0.9.3 )"
DEPEND="${RDEPEND}
	doc? ( >=dev-python/sphinx-0.6 )"

S="${WORKDIR}/${MY_P}"

DOCS="CHANGES"
PYTHON_MODNAME="jinja2"

set_global_options() {
	if [[ "$(python_get_implementation)" != "Jython" ]]; then
		DISTUTILS_GLOBAL_OPTIONS=("--with-debugsupport")
	else
		DISTUTILS_GLOBAL_OPTIONS=()
	fi
}

distutils_src_compile_pre_hook() {
	set_global_options
}

src_compile(){
	distutils_src_compile

	if use doc; then
		einfo "Generation of documentation"
		cd docs
		PYTHONPATH=".." emake html || die "Building of documentation failed"
	fi
}

distutils_src_test_pre_hook() {
	set_global_options
}

distutils_src_install_pre_hook() {
	set_global_options
}

src_install(){
	distutils_src_install
	python_clean_installation_image

	if use doc; then
		dohtml -r docs/_build/html/* || die "Installation of documentation failed"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples || die "Installation of examples failed"
	fi

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins ext/Vim/* || die "Installation of Vim syntax files failed"
	fi
}
