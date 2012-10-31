# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="This is a client for the OpenStack Nova API. There's a Python API
(the novaclient module), and a command-line script (nova). Each implements 100%
of the OpenStack Nova API."
HOMEPAGE="https://launchpad.net/nova"
SRC_URI="http://launchpad.net/nova/essex/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		 virtual/python-argparse
		 dev-python/httplib2
		 dev-python/prettytable"

