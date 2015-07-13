BIT=32
PLATFORM=l
QHOME?=~/q
QDIR=$(QHOME)/$(PLATFORM)$(BIT)/

build:
	gcc -m$(BIT) -shared -fPIC qcrypt.c -o qcrypt.so  -lssl -lcrypto -ldl

# -Wall -pedantic generates too many warning right now, we'll clean it up later

install: build
	cp qcrypt.so $(QDIR)
clean:
	rm qcrypt.so
test:
	q test.q
testloudly:
	q test.q -vt

