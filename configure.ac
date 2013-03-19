# configure.ac

AC_INIT([valint],[0.1])
AC_CONFIG_SRCDIR([Makefile.am])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([no-dist-gzip dist-bzip2])

# Enable silent rules is available
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

AM_MAINTAINER_MODE

AC_PROG_CC
AM_PROG_CC_C_O
AC_DISABLE_STATIC
AC_PROG_LIBTOOL
AC_PROG_INSTALL
IT_PROG_INTLTOOL([0.35])

LIBVALINT_LT_VERSION="4:0:2"
AC_SUBST(LIBVALINT_LT_VERSION)
AM_PROG_VALAC([0.18.0])
AC_SUBST(VALAC)

pkg_modules="libvala-0.18 >= 0.18"
VALINT_PACKAGES="--pkg libvala-0.18"
PKG_CHECK_MODULES(VALINT, [$pkg_modules])
AC_SUBST(VALINT_CFLAGS)
AC_SUBST(VALINT_LIBS)
AC_SUBST(VALINT_PACKAGES)

GETTEXT_PACKAGE=valint
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], ["$GETTEXT_PACKAGE"], [Gettext Package])
AC_SUBST(GETTEXT_PACKAGE)
AM_GNU_GETTEXT_VERSION([0.18.1])
AM_GLIB_GNU_GETTEXT

AC_ARG_ENABLE(coverage,
	AS_HELP_STRING([--enable-coverage],
	[compile with coverage profiling and debug (gcc only)]),
	enable_coverage=$enableval,enable_coverage=no)
AM_CONDITIONAL(ENABLE_COVERAGE, test x$enable_coverage != xno)

AS_IF([test "x$enable_coverage" != xno],
	[COVERAGE_CFLAGS="-fprofile-arcs -ftest-coverage"
	 COVERAGE_VALAFLAGS="-g"
	 COVERAGE_LIBS="-lgcov"
	 AC_SUBST(COVERAGE_CFLAGS)
	 AC_SUBST(COVERAGE_VALAFLAGS)
	 AC_SUBST(COVERAGE_LIBS)

	 AC_PATH_PROG(LCOV, lcov, :)
	 AC_SUBST(LCOV)
	 AS_IF([test "$LCOV" = :],
		[AC_MSG_ERROR([lcov is necessary for testing code coverage (http://ltp.sourceforge.net/coverage/lcov.php)])])])

GLIB_REQUIRED=2.32
PKG_CHECK_MODULES(GLIB, glib-2.0 >= $GLIB_REQUIRED gobject-2.0 >= $GLIB_REQUIRED)
AC_SUBST(GLIB_CFLAGS)
AC_SUBST(GLIB_LIBS)

GOBJECT_INTROSPECTION_CHECK([0.9.0])

AC_CONFIG_FILES([
	Makefile
	po/Makefile.in
	valint/Makefile
	valint-cli/Makefile
	vapi/Makefile
	tests/Makefile
])
AC_OUTPUT
