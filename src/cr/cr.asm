
extern print
extern quit
extern sprint

SECTION .text
global _start

     _start:
         pop     ecx

     nextArg:
         cmp     ecx, 0h
         jz      noMoreArgs
         pop     eax
         call    sprint
         dec     ecx
         jmp     nextArg

     noMoreArgs:
         call    quit

