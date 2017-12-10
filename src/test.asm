%include 'fuc.asm'

SECTION .data

msg db 'test1' , 0H
msg2 db 'test2' , 0H


SECTION .text
global _start

    _start:
          mov   eax,msg

          push  eax

          call sprintLF

          pop eax
          call sprintLF

          call quit
