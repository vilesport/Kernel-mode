jmp main

clrscr:
    mov ah, 0x07
    mov al, 0
    mov cx, 0
    mov dx, 184fh
    mov bh, 7
    int 0x10

    mov ah, 0x2
    xor bh, bh
    xor dx, dx
    int 0x10
    ret

main:
    call clrscr
    lea di, [menu + 0x7c00]
    call print
    lea di, [buffer + 0x7c00]
    call read
    xor ax, ax
    mov [di + 101], ax
    lea di, [cal + 0x7c00]
    call print
    lea di, [buffer + 0x7c00]
    call print
    lea di, [cal + 0x7c00 + 28]
    call print
    call end_line
    lea di, [cal + 0x7c00 + 39]
    call print
    call read_char
    jmp main

put_char:
    mov ah, 0x0e
    mov al, bl
    int 0x10
    ret 

print:
    mov bl, [di]
    cmp bl, 0
    je end_func
    call put_char
    add di, 1
    jmp print

read_char:
    xor ax, ax
    int 0x16
    ret

read:
    call read_char
    mov bl, al
    cmp bl, 0x0d
    je end_line
    cmp bl, 0x20
    jl read
    cmp bl, 0x7e
    jg read
    call put_char
    lea cx, [buffer + 0x7c00 + 100]
    cmp di, cx
    jge read
    call write_char
    add di, 1
    jmp read

end_line:
    mov bl, 0
    call write_char
    mov bl, 13
    call put_char
    mov bl, 10
    call put_char
    ret

end_func:
    ret

write_char:
    mov [di], bl
    ret

menu:
    db 'Magician can calculate your age', 13, 10
    db 'Tell me your age (undeleteable): ', 0

cal:
    db 'Here is my result: you are ', 0
    db ' years old', 0
    db 'Press any key to continue...', 0

buffer:
    times 105 db 0

times 510 - ($ - $$) db 0
db 0x55, 0xaa