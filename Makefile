
lib.name = unauthorized

export CPPFLAGS="-I/opt/homebrew/include"

# for the MINGW which has the timespec struct defined twice
cflags = -Ishared -DHAVE_STRUCT_TIMESPEC

LDFLAGS += -lspeex -L/opt/homebrew/lib -undefined dynamic_lookup

#######################################################################

audience~.class.sources := src/audience~.c
beatify~.class.sources := src/beatify~.c
blinkenlights.class.sources := src/blinkenlights.c
compressor~.class.sources := src/compressor~.c
cooled~.class.sources := src/cooled~.c
countund.class.sources := src/countund.c
disto~.class.sources := src/disto~.c
exciter.class.sources := src/exciter.c
filterbank~.class.sources := src/filterbank~.c
filters.class.sources := src/filters.c
formant~.class.sources := src/formant~.c
grid.class.sources := src/grid.c
mp3amp~.class.sources := src/mp3amp~.c
pianoroll.class.sources := src/pianoroll.c
playlist.class.sources := src/playlist.c
probalizer.class.sources := src/probalizer.c
randomblock~.class.sources := src/randomblock~.c
samplebox~.class.sources := src/samplebox~.c
scratcher~.class.sources := src/scratcher~.c
scrolllist.class.sources := src/scrolllist.c
sonogram~.class.sources := src/sonogram~.c
spigot~.class.sources := src/spigot~.c
vocoder~.class.sources := src/vocoder~.c
wahwah~.class.sources := src/wahwah~.c

# classes with homebrew dependencies
mp3cast~.class.sources := src/mp3cast~.c
mp3fileout~.class.sources := src/mp3fileout~.c
mp3streamout~.class.sources := src/mp3streamout~.c
mp3write~.class.sources := src/mp3write~.c
speexin~.class.sources := src/speexin~.c
speexout~.class.sources := src/speexout~.c

voc := \
src/filters.c \
src/tables.c \
src/lpc.c
	vocoder~.class.sources := src/vocoder~.c $(voc)

# datafiles = \
$(wildcard documentation/help_files/*.pd) \
$(wildcard documentation/extra_files/*.*) \
LICENSE.txt \
README.pdf \

PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
