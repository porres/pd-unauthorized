
lib.name = unauthorized

# for the MINGW which has the timespec struct defined twice
cflags = -Ishared -DHAVE_STRUCT_TIMESPEC

define forWindows
	ldlibs += -lpthread
	exe.extension = .exe
endef

#######################################################################

audience~.class.sources := audience~.c
beatify~.class.sources := beatify~.c
blinkenlights.class.sources := blinkenlights.c
compressor~.class.sources := compressor~.c
cooled~.class.sources := cooled~.c
countund.class.sources := countund.c
disto~.class.sources := disto~.c
exciter.class.sources := exciter.c
filterbank~.class.sources := filterbank~.c
filters.class.sources := filters.c
formant~.class.sources := formant~.c
mp3amp~.class.sources := mp3amp~.c
playlist.class.sources := playlist.c
probalizer.class.sources := probalizer.c
randomblock~.class.sources := randomblock~.c
samplebox~.class.sources := samplebox~.c
scratcher~.class.sources := scratcher~.c
scrolllist.class.sources := scrolllist.c
sonogram~.class.sources := sonogram~.c
spigot~.class.sources := spigot~.c
vocoder~.class.sources := vocoder~.c
wahwah~.class.sources := wahwah~.c

#speexout~.class.sources := speexout~.c
#pianoroll.class.sources := pianoroll.c
#grid.class.sources := grid.c
#mp3cast~.class.sources := mp3cast~.c
#speexout~.c



# datafiles = \
$(wildcard cyclone_objects/abstractions/*.pd) \
$(wildcard documentation/help_files/*.pd) \
$(wildcard documentation/extra_files/*.*) \
LICENSE.txt \
README.pdf \

PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
