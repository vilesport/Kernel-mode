start:
	nasm -f bin boot.asm -o boot.bin
	qemu-system-i386 boot.bin
clean:
	rm -f boot.bin
