%include 'fuc.asm'

SECTION .data

msg db 'Hello new brave world!', 0AH,0H
msg1 db 'Repeat call function', 0AH,0H

SECTION .text
global _start


_start:

    mov eax, msg
    call sprint

    mov eax, msg1
    call sprint

    call quit
