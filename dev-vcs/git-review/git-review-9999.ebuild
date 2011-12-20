# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPORT_PYTHON_ABIS=1
PYTHON_DEPEND="2:2.7"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils git-2

DESCRIPTION="Tool to submit code to Gerrit"
HOMEPAGE="https://launchpad.net/git-review"
EGIT_REPO_URI=https://github.com/openstack-ci/git-review.git

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
         dev-vcs/git"

