# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

PYTHON_DEPEND="2"

inherit git-2 distutils-r1

DESCRIPTION="Python client library for OpenStack Virtual Network Service
(Quantum)"
HOMEPAGE="http://docs.openstack.org/developer/python-quantumclient/"
EGIT_REPO_URI="https://github.com/openstack/${PN}.git"
EGIT_COMMIT="bc7ba5e"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/cliff-1.2.1
		virtual/python-argparse
		dev-python/httplib2
		>=dev-python/prettytable-0.6
		dev-python/simplejson
		dev-python/pyparsing"
RDEPEND="${DEPEND}"
