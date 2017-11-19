SECTION .data
msg     db  'Hello, brave new world', 0AH


SECTION .text
global _start


_start:
    mov     eax, msg
    call    strlen
                        ; ebx,ecx,edx argument for system call
    mov     edx, eax
    mov     ecx, msg
    mov     ebx, 1
    mov     eax, 4      ; System call
    int     0x80

    mov     ebx, 0
    mov     eax, 1
    int     0x80

strlen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret
