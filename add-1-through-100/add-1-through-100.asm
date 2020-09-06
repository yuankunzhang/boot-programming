start:
  mov ax, 0x07c0
  mov ds, ax

  mov ax, 0xb800
  mov es, ax

  mov ax, 0
  mov cx, 100

add:
  add ax, cx
  loop add

  mov bx, number
  mov si, 10
  mov cx, 4

digit:
  xor dx, dx
  div si
  mov [bx], dl
  inc bx
  loop digit

  mov bx, number
  mov si, 3
  mov di, 0
  mov cx, 4

show:
  mov al, [bx+si]
  add al, 0x30
  mov ah, 0x04
  mov [es:di], ax
  add di, 2
  dec si
  loop show

hang:
  jmp near hang

number db 0x00, 0x00, 0x00, 0x00

  times 510-($-$$) db 0x0
  db 0x55, 0xaa
