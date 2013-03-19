include $(top_srcdir)/Makefile.decl

bin_PROGRAMS = valint

valint_SOURCES = \
	main.vala \
	$(NULL)

valint_DEPENDENCIES = \
	$(top_srcdir)/valint/valint-0.1.vapi \
	$(NULL)

valint_VALAFLAGS = \
	--vapidir $(top_srcdir)/valint \
	--vapidir $(top_srcdir)/vapi \
	--pkg valint-0.1 \
	--pkg config \
	$(VALAFLAGS) \
	$(NULL)

valint_CPPFLAGS = \
	$(VALINT_CFLAGS) \
	$(GLIB_CFLAGS) \
	-I$(top_srcdir)/valint \
	-include $(top_srcdir)/config.h \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\" \
	$(NULL)

valint_LDADD = \
	$(GLIB_LIBS) \
	$(top_srcdir)/valint/libvalint-0.1.la \
	$(NULL)