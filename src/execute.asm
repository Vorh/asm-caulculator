%include 'fuc.asm'

SECTION .data

command     db '/bin/ls', 0H
arg1        db '-l', 0H
arguments   dd command
            dd arg1
            dd 0H
enviroment  dd 0H

SECTION .text
global _start

    _start:

        mov     edx, enviroment
        mov     ecx, arguments
        mov     ebx, command
        mov     eax, 11
        int     80H

        call    quit
