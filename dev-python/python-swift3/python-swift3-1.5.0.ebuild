# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="Openstack Swift S3 library for Python"
HOMEPAGE="https://github.com/fujita/swift3"
#EGIT_REPO_URI="https://github.com/fujita/swift3.git"
EGIT_REPO_URI="https://github.com/hyves-org/swift3.git"
# 1.5.0
EGIT_COMMIT="7f0b466"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
        dev-python/nose"
RDEPEND="${DEPEND}"

