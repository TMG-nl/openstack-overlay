# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="Python bindings to the OpenStack Volume API"
HOMEPAGE="http://docs.openstack.org/developer/python-cinderclient/"
EGIT_REPO_URI="https://github.com/openstack/${PN}.git"
# 1.0
EGIT_COMMIT="2e6be69"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		dev-python/argparse
		dev-python/prettytable
		dev-python/simplejson
		dev-python/httplib2"
RDEPEND="${DEPEND}"

