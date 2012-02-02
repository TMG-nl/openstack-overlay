# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="CloudFiles client library for Python"
HOMEPAGE="http://pypi.python.org/pypi/python-cloudfiles/"
EGIT_REPO_URI="https://github.com/rackspace/python-cloudfiles.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
        dev-python/nose
		dev-python/epydoc"
RDEPEND="${DEPEND}"

