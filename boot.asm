	bits 16
	org 0x7c00

entry_point:
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7c00

	mov [bootdrive], dl

	call disk_reset
	mov al, 1
	mov bx, 0x0500
	call disk_read

	jmp 0x0:0x0500

disk_reset:
	mov dl, [bootdrive]
	xor ax, ax
	int 0x13
	jc disk_reset
	ret

disk_read:
	mov dl, [bootdrive]
	xor dh, dh
	mov cx, 2
	mov ah, 0x02
	int 0x13
	jc disk_read
	ret

bootdrive db 0

	times 510-($-$$) db 0
	dw 0xaa55