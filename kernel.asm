	bits 16
	org 0x500

entry_point:
	mov al, '#'
	mov ah, 0x0e
	int 0x10

	cli
	hlt