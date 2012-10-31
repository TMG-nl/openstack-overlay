# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="This is a client library for Glance built on the OpenStack Images
API."
HOMEPAGE="http://docs.openstack.org/developer/python-glanceclient"
EGIT_REPO_URI="https://github.com/openstack/${PN}.git"
# 0.5.1
EGIT_COMMIT="3f67c46"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		virtual/python-argparse
		>=dev-python/prettytable-0.6
		<dev-python/prettytable-0.7
		>=dev-python/python-keystoneclient-0.1.2
		<dev-python/python-keystoneclient-0.2
		<dev-python/warlock-2"
RDEPEND="${DEPEND}"

