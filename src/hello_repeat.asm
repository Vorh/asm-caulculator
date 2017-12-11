%include 'fuc.asm'

SECTION .data

msg db 'Divide ' ,0H

SECTION .bss
sinput: resb 255


SECTION .text
global _start



    _start:

        mov eax,90
        mov ebx,9

        div  ebx
        call iprintLF
        mov  eax, msg
        call sprint
        mov  eax,edx
        call iprintLF

        call quit


