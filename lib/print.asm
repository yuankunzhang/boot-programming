; print a sequence of characters
; si: starting address

print:
    cld
    xor bx, bx

print_char:
    lodsb
    or al, al
    jz done
    mov ah, 0x0e
    mov bh, 0
    int 0x10
    inc bx
    jmp print_char

done:
    mov ax, bx
    ret
