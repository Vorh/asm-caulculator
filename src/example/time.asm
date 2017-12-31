%include 'fuc.asm'


SECTION .data
msg     db      'Second since Jan 01 1970', 0H


SECTION .text
global _start

        _start:
            mov   eax, msg
            call  sprint

            mov   eax,13
            int   80H

            call  iprintLF
            call  quit
