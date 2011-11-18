# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pip/pip-1.0.2.ebuild,v 1.2 2011/09/10 12:42:56 radhermit Exp $

EAPI="3"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3*"
inherit bash-completion-r1 distutils eutils

DESCRIPTION="Installs python packages -- replacement for easy_install"
HOMEPAGE="http://www.pip-installer.org/ http://pypi.python.org/pypi/pip/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="zsh-completion"

RDEPEND="dev-python/setuptools"
DEPEND="${RDEPEND}"

# Tests require a couple libraries not yet in the tree, aren't bundled with
# the default tarball from pypi, and have a couple failures anyway
RESTRICT="test"

DOCS="AUTHORS.txt docs/configuration.txt docs/how-to-contribute.txt
	docs/index.txt docs/news.txt docs/requirement-format.txt"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.0.1-unversioned.patch
	distutils_src_prepare
}

src_install() {
	distutils_src_install
	COMPLETION="${T}/completion.tmp"

	"$(PYTHON -f)" pip/runner.py completion --bash > "${COMPLETION}" || die
	newbashcomp "${COMPLETION}" ${PN}

	if use zsh-completion ; then
		"$(PYTHON -f)" pip/runner.py completion --zsh > "${COMPLETION}" || die
		insinto /usr/share/zsh/site-functions
		newins "${COMPLETION}" _pip || die
	fi
}
