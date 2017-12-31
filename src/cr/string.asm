%include 'syscall.asm'


global print
global strlen

SECTION .text


    ; Write string
    print:
        push ebp
        mov  ebp,esp
        push dword [ebp+8]
        call strlen
        add esp, 4
        syscall 4,1, [ebp+8],eax
        mov esp,ebp
        pop ebp
        ret


    ; Calculates the length
    ; return: eax
    strlen:
        push ebp
        push eax
        push esi
        mov ebp,esp
        xor eax, eax
        mov esi, [ebp+8] ; First argument
    .lp:
        cmp byte [esi],0
        jz  .quit
        inc esi
        inc eax
        jmp short .lp
    .quit:
        pop ebp
        pop eax
        pop esi
        ret





