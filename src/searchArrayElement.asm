SECTION .bss

set512 resd 16

SECTION .text

global _start

        _start:

            xor  eax,eax
            mov  ecx,15
            mov  esi,set512
        lp: mov  [esi+4*ecx],eax
            loop lp

         ; внести в множество элемент номер которого находится в ebx

           mov  cl,bl
           and  cl, 11111b
           mov  eax,1
           shl  eax,cl
           mov  edx,ebx
           shr  edx,5
           or   [set512+4*edx],eax