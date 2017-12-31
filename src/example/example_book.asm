%include 'fuc.asm'


SECTION .data

msg db 'Hello' , 0H


SECTION .text

global _start

        _start:

            mov     ecx, 0
         repeat:
            mov     eax, msg
            call    sprintLF
            inc     ecx
            cmp     ecx,5
            jl      repeat
            call    quit


