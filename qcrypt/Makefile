BIT=32
PLATFORM=l

build:
	gcc -m$(BIT) -shared -fPIC qcrypt.c -o qcrypt.so  -lssl -lcrypto -ldl

# -Wall -pedantic generates too many warning right now, we'll clean it up later

install: build
	cp qcrypt.so ~/q/$(PLATFORM)$(BIT)/

clean:
	rm qcrypt.so

test: install
	q test.q
testloudly: install
	q test.q -vt

