# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="This is a client for the OpenStack Keystone API. There's a Python
API (the keystoneclient module), and a command-line script (keystone). The
Keystone 2.0 API is still a moving target, so this module will remain in 'Beta'
status until the API is finalized and fully implemented."
HOMEPAGE="https://github.com/openstack/python-keystoneclient"
SRC_URI="http://launchpad.net/keystone/essex/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		virtual/python-argparse
		dev-python/coverage
		dev-python/httplib2
		dev-python/mock
		dev-python/mox
        dev-python/nose
		dev-python/pep8
		dev-python/prettytable
		dev-python/simplejson"
RDEPEND="${DEPEND}"

