COMMENT =	pcap bgp parser

MODPY_EGG_VERSION =	0.2.22
DISTNAME =	pbgpp-${MODPY_EGG_VERSION}
REVISION =	4

CATEGORIES =	net

MAINTAINER =	Peter Hessler <phessler@openbsd.org>

# Apache 2.0
PERMIT_PACKAGE =	Yes

MODULES =		lang/python
MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools

RUN_DEPENDS =		net/py-pcapy${MODPY_FLAVOR}
BUILD_DEPENDS +=	${RUN_DEPENDS}

# tests depend on a running kafka
NO_TEST =		Yes

.include <bsd.port.mk>
