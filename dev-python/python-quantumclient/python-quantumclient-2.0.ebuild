# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Python client library for OpenStack Virtual Network Service
(Quantum)"
HOMEPAGE="http://wiki.openstack.org/Quantum"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/cliff-0.6.0
		virtual/python-argparse
		dev-python/httplib2
		>=dev-python/prettytable-0.6.0
		dev-python/simplejson
		dev-python/pyparsing"
RDEPEND="${DEPEND}"
