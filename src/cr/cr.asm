
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
         call    print
         sub     esp, 4
         dec     ecx
         jmp     nextArg

     noMoreArgs:
         call    quit

