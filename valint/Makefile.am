include $(top_srcdir)/Makefile.decl

lib_LTLIBRARIES = libvalint-0.1.la

libvalint_0_1_la_SOURCES = \
	stub.vala \
	$(NULL)

libvalint_0_1_la_VALAFLAGS = \
	-H valint.h \
	-h valint-internals.h \
	--vapi valint-0.1.vapi \
	--internal-vapi valint-internals-0.1.vapi \
	--library valint-0.1 \
	--gir Valint-0.1.gir \
	--vapidir=$(top_srcdir)/vapi \
	--pkg config \
	$(COVERAGE_VALAFLAGS) \
	$(VALAFLAGS) \
	@VALINT_PACKAGES@ \
	$(NULL)

libvalint_0_1_la_CPPFLAGS = \
	$(GLIB_CFLAGS) \
	$(VALINT_CFLAGS) \
	$(COVERAGE_CFLAGS) \
	-include $(top_srcdir)/config.h \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\"
	$(NULL)

libvalint_0_1_la_LIBADD = \
	$(GLIB_LIBS) \
	$(VALINT_LIBS) \
	$(COVERAGE_LIBS) \
	$(NULL)

libvalint_0_1_la_LDFLAGS = \
	-version-info $(LIBVALINT_LT_VERSION) \
	-no-undefined \
	$(NULL)

valintincludedir = $(includedir)/valint-0.1

valintinclude_HEADERS = \
	valint.h \
	$(NULL)

vapidir = $(datadir)/vala/vapi

dist_vapi_DATA = \
	valint-0.1.vapi \
	$(NULL)

if HAVE_INTROSPECTION
girdir = @INTROSPECTION_GIRDIR@

gir_DATA = \
	Valint-0.1.gir \
	$(NULL)

typelibdir = @INTROSPECTION_TYPELIBDIR@
typelib_DATA = \
	Valint-0.1.typelib \
	$(NULL)

# Extract dlname from libfolks.la; see bug #658002.
# This is what g-ir-scanner does.
libvalint_dlname = \
	`$(SED) -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libvalint-0.1.la`
INTROSPECTION_COMPILER_ARGS= \
	-l $(libvalint_dlname)
Valint-0.1.typelib: Valint-0.1.gir
	@INTROSPECTION_COMPILER@ $(INTROSPECTION_COMPILER_ARGS) -o $@ $^
endif

Valint-0.1.gir valint-internals-0.1.vapi valint-0.1.vapi: libvalint-0.1.la

CLEANFILES = \
	valint-0.1.vapi \
	valint-internals-0.1.vapi \
	Valint-0.1.typelib \
	Valint-0.1.gir \
	$(NULL)