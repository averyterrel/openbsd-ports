COMMENT =	PostgreSQL Database Modeler

VERSION =	1.1.4

GH_ACCOUNT =	pgmodeler
GH_PROJECT =	pgmodeler
GH_TAGNAME =	v${VERSION}

SHARED_LIBS +=  canvas		0.0 # 1.0
SHARED_LIBS +=  cli		0.0 # 1.0
SHARED_LIBS +=  connector	0.0 # 1.0
SHARED_LIBS +=  core		0.0 # 1.0
SHARED_LIBS +=  gui		0.0 # 1.0
SHARED_LIBS +=  parsers		2.0 # 1.0
SHARED_LIBS +=  utils		1.1 # 1.0

CATEGORIES =	databases

HOMEPAGE =	https://www.pgmodeler.io

# GPLv3 only
PERMIT_PACKAGE =	Yes

WANTLIB += GL Qt6Core Qt6Gui Qt6Network Qt6PrintSupport Qt6Svg
WANTLIB += Qt6Widgets X11 Xext c execinfo m pq xml2
WANTLIB += ${COMPILER_LIBCXX}

CONFIGURE_ENV =		CXXFLAGS="${CXXFLAGS} -std=c++11" \
			LOCALBASE="${LOCALBASE}"

MODULES =		devel/qmake \
			x11/qt6
MODQMAKE_PROJECTS =	pgmodeler.pro tests/tests.pro
MODQMAKE_ARGS =		DOCDIR=${PREFIX}/share/doc/pgmodeler \
			NO_UPDATE_CHECK=1 \
			PREFIX=${PREFIX} \
			SAMPLESDIR=${PREFIX}/share/examples/pgmodeler
LIB_DEPENDS =		databases/postgresql \
			x11/qt6/qtsvg

SEPARATE_BUILD =	No
USE_GMAKE =		Yes

post-patch:
	sed -i -e 's/linux/unix/' \
	       -e 's/^ BUILDNUM=.*/ BUILDNUM=${VERSION}/' ${WRKSRC}/pgmodeler.pri

post-install:
	rm -Rf ${PREFIX}/bin/tests
	${INSTALL_DATA_DIR} ${PREFIX}/lib/pgmodeler/plugins

do-test:
	cd ${WRKBUILD}; \
	for d in lib*/; do \
		LD_LIBRARY_PATH=$${LD_LIBRARY_PATH:+$${LD_LIBRARY_PATH}:}$$PWD/$${d%/}; \
	done; \
	export LD_LIBRARY_PATH; \
	ln -sf ../../../schemas tests/src/databasemodeltest/schemas; \
	okay=true; \
	for t in ${WRKBUILD}/tests/src/*test; do \
		(cd $$t; ./*test) || okay=false; \
	done; \
	$$okay

.include <bsd.port.mk>
