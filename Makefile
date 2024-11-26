
lib.name = unauthorized

# for the MINGW which has the timespec struct defined twice
cflags = -Ishared -DHAVE_STRUCT_TIMESPEC

define forWindows
	ldlibs += -lpthread
	exe.extension = .exe
endef

#######################################################################

audience~.class.sources := audience~.c

# datafiles = \
$(wildcard cyclone_objects/abstractions/*.pd) \
$(wildcard documentation/help_files/*.pd) \
$(wildcard documentation/extra_files/*.*) \
LICENSE.txt \
README.pdf \

PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
