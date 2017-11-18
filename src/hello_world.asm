SECTION .data
msgOne     db  'Hello, brave new world', 0AH


SECTION .text
global _start


_start:

    mov ebx, msgOne
    mov eax, ebx

nextchar:
    cmp byte[eax],0
    jz  finished
    inc eax
    jmp nextchar
finished:
    sub eax, ebx


    mov edx, eax
    mov ecx, msgOne
    mov ebx, 1
    mov eax, 4
    int 80h

    mov ebx, 0
    mov eax, 1
    int 0x80


