    mov ax, 0x07c0
    mov ds, ax

    mov si, msg
    call print

hang:
    jmp hang

msg:
    db 'Hello World', 13, 10, 0

%include "../lib/print.asm"

    times 510-($-$$) db 0
    db 0x55, 0xaa
