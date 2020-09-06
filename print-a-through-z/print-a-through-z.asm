start:
  mov ax, 0x07c0
  mov ds, ax

  mov ax, 0xb800
  mov es, ax

  mov si, 'a'
  mov di, 0
  mov cx, 26

print:
  mov ax, si
  mov ah, 0x04      ; foreground color: red
  mov [es:di], ax
  add di, 2

  mov ax, 20
  mov [es:di], ax
  add di, 2

  inc si
  loop print

hang:
  jmp near hang

  times 510-($-$$) db 0x0
  db 0x55, 0xaa
