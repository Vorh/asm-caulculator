%include 'fuc.asm'

SECTION .data

msg db 'Please enter your name ' ,0H
msg1 db 'Your name: ', 0H

SECTION .bss
sinput: resb 255


SECTION .text
global _start


    _start:

        mov eax,90
        mov ebx,9

        add eax,ebx

        call iprintLF

        call quit


