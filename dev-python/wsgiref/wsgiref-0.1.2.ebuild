# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="This is a standalone release of the wsgiref library, that provides
validation support for WSGI 1.0.1 (PEP 3333) for Python versions < 3.2, and
includes the new wsgiref.util.test() utility function."
HOMEPAGE="http://pypi.python.org/pypi/wsgiref/0.1.2"
SRC_URI="http://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.zip"

LICENSE="PSF ZPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools 
	    app-arch/unzip"
RDEPEND="${DEPEND}"

