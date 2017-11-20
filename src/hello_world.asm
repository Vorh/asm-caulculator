%include        'functions.asm'

SECTION .data
msg1     db  'Hello, brave new world', 0h
msg2     db  'This is how we recycle in NASM', 0h


SECTION .text
global _start


_start:
    pop     ecx

nextArg:
    cmp     ecx,0h
    jz      noMoreArg
    pop     eax
    call    sprintLF
    dec     ecx
    jmp     nextArg

noMoreArg:
    call    quit
