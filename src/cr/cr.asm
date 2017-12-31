
extern print

SECTION .text
global _start

     _start:
         pop     ecx

     nextArg:
         cmp     ecx, 0h
         jz      noMoreArgs
         pop     eax
         push    eax
         ;call    print
         dec     ecx
         jmp     nextArg

     noMoreArgs:
         call    quit

    quit:

        mov ebx, 0
        mov eax, 1
        int 80H
        ret