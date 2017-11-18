SECTION .data
msgOne     db  'Hell', 0AH
msgTwo  db  'World', 0AH


SECTION .text
global _start


_start:

    mov edx, 5
    mov ecx, msgOne
    mov ebx, 1
    mov eax, 4
    int 0x80


    mov edx, 24
    mov ecx, msgTwo
    mov ebx, 1
    mov eax, 4
    int 80h


