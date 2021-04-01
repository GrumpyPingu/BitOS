
PROGRAM_SPACE equ 0x7e00
ReadDisk:
	
	mov ah, 0x02
	mov bx, PROGRAM_SPACE
	mov al, 2
	mov dl, [BOOT_DISK]
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13

	jc DiskReadFail

	ret

BOOT_DISK:
	db 0

DiskReadErrorStr:
	db 'Disk Read Failed: Error 0x13 (BOOT_DISK)',0

DiskReadFail:
	mov bx, DiskReadErrorStr
	call PrintString

	jmp $