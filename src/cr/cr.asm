
extern print
extern printLN
extern quit
extern sprint


SECTION .data

nameMsg db 'HI',0

SECTION .text
global _start

     _start:

         push dword nameMsg
         call printLN

         pop ecx

     nextArg:
         cmp     ecx, 0h
         jz      noMoreArgs
         pop     eax
         push    eax
         call    print
         sub     esp, 4
         dec     ecx
         jmp     nextArg

     noMoreArgs:
         call    quit

