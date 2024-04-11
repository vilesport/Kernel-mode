#!/bin/sh
make start
qemu-system-i386 -S -s boot.bin & gdb -nx -x realmode
