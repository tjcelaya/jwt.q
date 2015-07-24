BIT=32
PLATFORM=l
QHOME?=~/q
CC_FLAGS=-shared -fPIC

ifeq ($(OS),Windows_NT)
    PLATFORM=w
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        PLATFORM=l
    endif
    ifeq ($(UNAME_S),Darwin)
        PLATFORM=m
				CC_FLAGS=-bundle -undefined dynamic_lookup
    endif
endif

QDIR=$(QHOME)/$(PLATFORM)$(BIT)/

build:
	gcc -m$(BIT) $(CC_FLAGS) qcrypt.c -o qcrypt.so  -lssl -lcrypto -ldl

# -Wall -pedantic generates too many warning right now, we'll clean it up later

install: build
	cp qcrypt.so $(QDIR)
clean:
	rm qcrypt.so
test:
	q test.q
testloudly:
	q test.q -vt

