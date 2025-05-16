lib.name = unauthorized

# Include paths
export CPPFLAGS = -I/opt/homebrew/include

# for the MINGW which has the timespec struct defined twice
#cflags = -Ishared -DHAVE_STRUCT_TIMESPEC
cflags = -Ishared -DHAVE_STRUCT_TIMESPEC -I"$(CURDIR)/src/mpglib"

# For macOS, we need to use specific flags for static linking
ifeq ($(shell uname -s), Darwin)
    # Use full path to static libraries for mp3 objects
    mp3cast~.class.ldlibs = /opt/homebrew/lib/libmp3lame.a -lpthread -lm
    mp3fileout~.class.ldlibs = /opt/homebrew/lib/libmp3lame.a -lpthread -lm
    mp3streamout~.class.ldlibs = /opt/homebrew/lib/libmp3lame.a -lpthread -lm
    mp3streamin~.class.ldlibs = /opt/homebrew/lib/libmp3lame.a -lpthread -lm
    mp3write~.class.ldlibs = /opt/homebrew/lib/libmp3lame.a -lpthread -lm
    
    # Add Speex static library for speex objects
    speexin~.class.ldlibs = /opt/homebrew/lib/libspeex.a -lpthread -lm
    speexout~.class.ldlibs = /opt/homebrew/lib/libspeex.a -lpthread -lm

    # Add specific darwin linking flags
    ldflags = -undefined dynamic_lookup
endif

# Remove this line since we're now using static linking for Speex
# LDFLAGS += -lspeex -L/opt/homebrew/lib

#######################################################################

# All your existing source definitions remain the same
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
#mp3amp~.class.sources := src/mp3amp~.c
mp3amp~.class.sources := src/mp3amp~.c src/mpglib/mpglib.c
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
mp3streamin~.class.sources := src/mp3streamin~.c
mp3streamout~.class.sources := src/mp3streamout~.c
mp3write~.class.sources := src/mp3write~.c
speexin~.class.sources := src/speexin~.c
speexout~.class.sources := src/speexout~.c

voc := \
src/filters.c \
src/tables.c \
src/lpc.c
    vocoder~.class.sources := src/vocoder~.c $(voc)

PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
