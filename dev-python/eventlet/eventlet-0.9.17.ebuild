# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

DESCRIPTION="Highly concurrent networking library"
HOMEPAGE="http://pypi.python.org/pypi/eventlet"
SRC_URI="http://pypi.python.org/packages/source/e/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples test"

DEPEND="doc? ( dev-python/sphinx )
        test? ( dev-python/greenlet )"
RDEPEND="${DEPEND}
		 dev-python/greenlet"

src_compile() {
	distutils_src_compile

	if use doc ; then
		emake -C doc html || die
	fi
}

src_install() {
	distutils_src_install

	use doc && dohtml -r doc/_build/html/*

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples || die
	fi
}

