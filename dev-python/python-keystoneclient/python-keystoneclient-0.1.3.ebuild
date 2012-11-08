# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="This is a client for the OpenStack Keystone API. There's a Python
API (the keystoneclient module), and a command-line script (keystone). The
Keystone 2.0 API is still a moving target, so this module will remain in 'Beta'
status until the API is finalized and fully implemented."
HOMEPAGE="https://github.com/openstack/python-keystoneclient"
EGIT_REPO_URI="https://github.com/openstack/python-keystoneclient.git"
# v 0.1.3
EGIT_COMMIT="0a8c960"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		virtual/python-argparse
		>=dev-python/httplib2-0.7.0
		dev-python/prettytable
		dev-python/simplejson"
RDEPEND="${DEPEND}"

