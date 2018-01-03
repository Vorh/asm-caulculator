
extern print
extern printLN
extern quit


SECTION .data

nameMsg db 'HI bitch',0

SECTION .text
global _start

     _start:
         mov  ecx, [esp]
         mov  esi ,esp
         add  esi, 4

     .again:
         push dword [esi]
         call printLN
         add  esi,4

         loop .again

         call quit


