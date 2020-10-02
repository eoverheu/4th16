all:
	nasm -O0 -f bin boot.asm -o boot.bin
	nasm -O0 -f bin kernel.asm -o kernel.bin
	copy /b boot.bin + kernel.bin floppy.img
	bochs -q -f bochsrc.bxrc