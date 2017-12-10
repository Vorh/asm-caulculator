%include 'fuc.asm'

SECTION .data

msg db 'Please enter your name ' ,0H
msg1 db 'Your name: ', 0H

SECTION .bss
sinput: resb 255


SECTION .text
global _start


    _start:

        mov     ecx, 0

    nextNumber:

        inc     ecx

        mov     eax, ecx
        add     eax, 48
        push    eax
        mov     eax, esp
        call    sprintLF

        pop     eax
        cmp     ecx,10
        jne     nextNumber

        call    quit


