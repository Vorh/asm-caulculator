%include 'fuc.asm'

SECTION .bss

array  resd 1000


SECTION .text
global _start

    _start:
        mov     ecx,1000
        mov     esi, array
        mov     eax,0
    lp:
        add     eax,[esi]
        add     esi,4
        loop    lp

        call    sprintLF
        call    quit



