
extern print
extern printLN
extern quit


SECTION .data

nameMsg db 'HI bitch',0

SECTION .text
global _start

     _start:
         push dword nameMsg
         call printLN

         call    quit

