
extern print
extern printLN
extern quit


SECTION .data

nameMsg db 'HI bitch',0
arguments resb 20

SECTION .text
global _start

     _start:
         pop ecx
     nextArg:
         cmp     ecx, 0h
         jz      noMoreArgs
         pop     eax
         mov     arguments, eax
         dec     ecx
         jmp     nextArg

     noMoreArgs:

         push dword nameMsg
         call printLN

         call    quit

