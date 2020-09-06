start:
    ; The CPU starts in real mode. Code gets loaded at 0000:7c00.
    ; Use %ds to store this starting address.
    mov ax, 0x07c0
    mov ds, ax

    ; Video memory starts at b800:0000.
    ; Use %es to store this starting address.
    mov ax, 0xb800
    mov es, ax

    mov si, msg
    mov di, 0
    mov cx, padding-msg

    ; Show the text in red foreground color.
    mov ah, 0x04

show:
    mov al, [ds:si]
    mov [es:di], ax
    inc si
    add di, 2
    loop show

hang:
    ; Gimme an infinite loop.
    jmp hang

msg db 'Hello, World', 0x21

padding:
    ; Fill up 510 bytes with zeros.
    times 510-($-$$) db 0x0
    ; Boot signature.
    db 0x55, 0xaa
