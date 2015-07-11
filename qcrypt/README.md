# qcrypt

This is a copy of the AquaQ Analytics repo contrib folder for qcrypt, a small interface to the openssl library. Instructions for building the interface were rather spread out so I decided to compile them here and include a Makefile in order to make it easier to use. I've included k.h and c.o which were created by Kx Systems for interfacing with q from C.

## Installation

Just for reference, on Debian Jessie I needed to `sudo apt-get install` these libraries for compilation to succeed:

 - libssl-dev:i386 
 - libc6-dev:i386 (standard c library for 32-bit)
 - libc6-dev-x32 (for cross-compiling)

## Usage

Functions from the library can then be included in q with in the following way:

    qrand:`qcrypt 2: (`qrand;1)

For some reason, this fails when performed within the `~/q` folder, still trying to figure out why.

NOTICE: I do not claim to have created any of this code! I just made the Makefile and brought this all together.
