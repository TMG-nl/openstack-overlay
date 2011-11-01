# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* -jython"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils eutils

DESCRIPTION="Lightweight in-process concurrent programming"
HOMEPAGE="http://pypi.python.org/pypi/greenlet"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

DOCS="AUTHORS NEWS README"

src_prepare() {
	distutils_src_prepare
	epatch "${FILESDIR}/${P}-python-3.2.patch"
}

