# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pep8/pep8-0.6.1.ebuild,v 1.1 2011/06/10 19:42:46 rafaelmartins Exp $

EAPI=3

PYTHON_DEPEND="2:2.4 3:3.1"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Python style guide checker"
HOMEPAGE="http://github.com/jcrocholl/pep8 http://pypi.python.org/pypi/pep8"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="${PN}.py"

# tests aren't part of the official distfile yet. see:
# https://github.com/jcrocholl/pep8/pull/25
