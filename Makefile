CC=gcc
RM=rm -f

CFLAGS=-c -Wall -pthread
#LDFLAGS=-lpthread -Wl,-V
#CPPFLAGS=-DDEBUG_GPS -DDEBUG_CFG -DTIMERSERIAL
#LIBS=-L/usr/lib
#INC=-I/usr/include

LDFLAGS=-Wl,-V
CPPFLAGS=
LIBS=
INC=

DESTDIR=
BINDIR=/usr/bin

SOURCES=hellogit.c hellogitprint.c 
OBJECTS=$(SOURCES:.c=.o)

EXECUTABLE=hellogit

.PHONY: all clean install

.cpp.o:
	$(CC) $(CFLAGS) $(LDFLAGS) $(CPPFLAGS) $(INC) $< -o $@

all:	$(SOURCES) $(EXECUTABLE)

$(EXECUTABLE):	$(OBJECTS)
	$(CC) $(LDFLAGS) $(LIBS) $(CPPFLAGS) $^ -o $@

clean:
	$(RM) $(EXECUTABLE) *.o

install:	$(EXECUTABLE)
	mkdir -p $(DESTDIR)/$(BINDIR)
	install -m 0755 $< $(DESTDIR)/$(BINDIR)




