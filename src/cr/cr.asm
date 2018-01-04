
extern print
extern printLN
extern iprint
extern quit

SECTION .data

nameMsg db 'HI bitch',0

SECTION .text
global _start

     _start:

         mov ecx,0

     nextNumber:
         inc  ecx
         mov  eax, ecx
         call iprint
         cmp  ecx,10
         jne  nextNumber


         call quit


