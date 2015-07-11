BIT=32
PLATFORM=l

build:
	gcc -m$(BIT) -shared -fPIC qcrypt.c -o qcrypt.so  -lssl -lcrypto -ldl

install:
	cp qcrypt.so ~/q/$(PLATFORM)$(BIT)/

clean:
	rm qcrypt.so
