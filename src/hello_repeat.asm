%include 'fuc.asm'

SECTION .data

msg db 'Divide ' ,0H

SECTION .bss
sinput: resb 255


SECTION .text
global _start



    _start:

        pop  ecx
        mov  edx, 0

    nextArg:

        cmp  ecx, 0H
        jz   noMoreArg
        pop  eax
        call atoi
        add  edx, eax
        dec  ecx
        jmp  nextArg

    noMoreArg:

        mov  eax, edx
        call iprintLF
        call quit


