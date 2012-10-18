# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="ftp-cloudfs is a ftp server acting as a proxy to Rackspace Cloud
Files or to OpenStack Swift. It allow you to connect via any FTP client to do
upload/download or create containers."
HOMEPAGE="https://github.com/chmouel/ftp-cloudfs"
EGIT_REPO_URI="git://github.com/chmouel/${PN}.git"
# 0.18
EGIT_COMMIT="473f895"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		>=dev-python/python-cloudfiles-1.3.0
		>=dev-python/pyftpdlib-0.6.0
		>=dev-python/python-daemon-1.6
		>=dev-python/python-memcache-1.45"
RDEPEND="${DEPEND}"

