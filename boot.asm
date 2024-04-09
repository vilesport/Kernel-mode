jmp Main

Clrscr:
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

Main:
    call Clrscr
    lea di, [menu + 0x7c00]
    call Print
    lea di, [buffer + 0x7c00]
    call Read
    xor ax, ax
    mov [di + 101], ax
    lea di, [cal + 0x7c00]
    call Print
    lea di, [buffer + 0x7c00]
    call Print
    lea di, [cal + 0x7c00 + 28]
    call Print
    call End_line
    lea di, [cal + 0x7c00 + 39]
    call Print
    call Read_char
    jmp Main

Put_char:
    mov ah, 0x0e
    mov al, bl
    int 0x10
    ret 

Print:
    mov bl, [di]
    cmp bl, 0
    je End_func
    call Put_char
    add di, 1
    jmp Print

Read_char:
    xor ax, ax
    int 0x16
    ret

Read:
    call Read_char
    mov bl, al
    cmp bl, 0x0d
    je End_line
    cmp bl, 0x20
    jl Read
    cmp bl, 0x7e
    jg Read
    call Put_char
    lea cx, [buffer + 0x7c00 + 100]
    cmp di, cx
    jge Read
    call Write_char
    add di, 1
    jmp Read

Write_char:
    mov [di], bl
    ret

End_line:
    mov bl, 0
    call Write_char
    mov bl, 13
    call Put_char
    mov bl, 10
    call Put_char
    ret

End_func:
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