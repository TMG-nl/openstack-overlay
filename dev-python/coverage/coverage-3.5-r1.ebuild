# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/coverage/coverage-3.5.ebuild,v 1.1 2011/09/10 14:00:40 djc Exp $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Code coverage measurement for Python"
HOMEPAGE="http://nedbatchelder.com/code/coverage/ http://pypi.python.org/pypi/coverage"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

PYTHON_MODNAME="coverage"
