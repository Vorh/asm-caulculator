global _start

extern putstr
extern getstr
extern quit

SECTION .data

nmq db 'Hi, what is your name?',10,0
pmy db 'Pleased to meet you, dear ',0
ext db '!',10,0

SECTION .bss
buf resb 512
buflen equ $-buf

SECTION .text

    _start:
        push dword nmq
        call putstr

        call quit
