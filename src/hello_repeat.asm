%include 'fuc.asm'

SECTION .data

msg db 'Please enter your name ' ,0H
msg1 db 'Your name: ', 0H

SECTION .bss
sinput: resb 255


SECTION .text
global _start


_start:

    mov eax, msg
    call sprint

    mov edx, 255
    mov ecx, sinput
    mov ebx, 0
    mov eax, 3
    int 80h

    mov eax, msg1
    call sprint

    mov eax, sinput
    call sprint

    call quit


