# Makefile to generate program
#

CC:=gcc
INCLUDES:=$(shell pkg-config --cflags libavformat libavcodec libavfilter libswresample libswscale libavutil)

CFLAGS:=-Wall -ggdb
LDFLAGS:=$(shell pkg-config --libs libavformat libavcodec libavfilter libswresample libswscale libavutil) -lm
EXE:=mux.out

#
# This is here to prevent Make from deleting secondary files.
#
.SECONDARY:

#
# $< is the first dependency in the denpendcy list
# $@ is the target name
#
all: dirs $(addprefix bin/, $(EXE)) tags

dirs:
	mkdir -p obj
	mkdir -p bin

tags:*.c
	ctags *.c

bin/%.out:obj/%.o
	$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@

obj/%.o:%.c
	$(CC) $(CFLAGS) $< $(INCLUDES) -c -o $@

clean:
	rm -f obj/*
	rm -f bin/*
	rm -f tags
