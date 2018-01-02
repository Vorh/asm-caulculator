global quit

SECTION .text



quit:
        mov ebx, 0
        mov eax, 1
        int 80H
        ret