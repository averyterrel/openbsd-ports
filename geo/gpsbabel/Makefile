USE_WXNEEDED=		Yes

COMMENT-main=		GPS waypoint, track, and route conversion tool
COMMENT-tk=		Tk front-end to gpsbabel
COMMENT-qt=		Qt front-end to gpsbabel

VERSION=		1.6.0.1
GH_ACCOUNT=		gpsbabel
GH_PROJECT=		gpsbabel
GH_TAGNAME=		gpsbabel_1_6_0.1
DISTNAME=		gpsbabel-${VERSION}
PKGNAME-main=		gpsbabel-${VERSION}
PKGNAME-tk=		gpsbabel-tk-${VERSION}
PKGNAME-qt=		gpsbabel-qt-${VERSION}
REVISION-main=		3
REVISION-qt=		3
CATEGORIES=		geo

HOMEPAGE=		https://www.gpsbabel.org/

# GPLv2
PERMIT_PACKAGE=		Yes

COMPILER =		base-clang ports-gcc base-gcc

AUTOCONF_VERSION=	2.69
CONFIGURE_STYLE=	autoconf qmake
USE_GMAKE=		yes
CONFIGURE_ARGS+=	--with-zlib=system
CONFIGURE_ENV+=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -lshp" \
			WEB=${WRKSRC}

MULTI_PACKAGES=		-main -tk -qt

MODULES=		devel/qmake x11/tk x11/qt5
MODQMAKE_PROJECTS =	gui/app.pro

# /usr/local/bin/gpsbabel (from the -main subpackage) is linked against Qt5Core
LIB_DEPENDS-main=	${MODGCC4_CPPLIBDEP} \
			x11/qt5/qtbase \
			devel/libusb-compat \
			devel/shapelib

cWANTLIB =		c m pthread
WANTLIB-main += Qt5Core shp>=1 usb z ${cWANTLIB} ${COMPILER_LIBCXX}
WANTLIB-tk =
WANTLIB-qt += ${COMPILER_LIBCXX} ${cWANTLIB} GL Qt5Core Qt5Gui Qt5Network
WANTLIB-qt += Qt5Positioning Qt5PrintSupport Qt5Qml Qt5Quick Qt5WebChannel
WANTLIB-qt += Qt5WebEngineCore Qt5WebEngineWidgets Qt5Widgets Qt5Xml Qt5QmlModels


LIB_DEPENDS-tk=
LIB_DEPENDS-qt=		${MODGCC4_CPPLIBDEP} \
			x11/qt5/qtwebengine
PKG_ARCH-tk=	*
RUN_DEPENDS-tk=		geo/gpsbabel \
			${MODTK_RUN_DEPENDS}
RUN_DEPENDS-qt=		geo/gpsbabel \
			devel/desktop-file-utils

pre-configure:
	${SUBST_CMD} ${WRKSRC}/guibabel
	@perl -pi -e 's/gpsbabelfe-bin/guibabel-qt/' \
		${WRKSRC}/gui/gpsbabel.desktop

post-build:
	${MODQMAKE_build}

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/gpsbabel ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKBUILD}/gui/objects/gpsbabelfe \
		${PREFIX}/bin/guibabel-qt
	${INSTALL_SCRIPT} ${WRKSRC}/guibabel ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/gpsbabel
	${INSTALL_DATA} ${WRKSRC}/README* ${PREFIX}/share/doc/gpsbabel
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/gui/gpsbabel.desktop \
		${PREFIX}/share/applications
	${INSTALL_DATA_DIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/gui/images/appicon.png \
		${PREFIX}/share/pixmaps/gpsbabel.png

.include <bsd.port.mk>
