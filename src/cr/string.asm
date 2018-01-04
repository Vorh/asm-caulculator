%include 'syscall.inc'


global print
global iprint
global printLN
global strlen


SECTION .data

new_line db 0AH,0h

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

    ; Write string with symbol new_line
    printLN:
        push ebp
        mov  ebp,esp

        push dword [ebp+8] ; first argument
        call print

        push dword new_line
        call print

        mov  esp,ebp
        pop  ebp
        ret


    ; Calculates the length
    ; return: eax
    strlen:
        push ebp
        mov  ebp,esp
        push esi
        xor  eax,eax
        mov  esi, [ebp+8] ; First argument
    .lp:
        cmp  byte [esi],0
        jz   .quit
        inc  esi
        inc  eax
        jmp  short .lp
    .quit:
        pop  esi
        pop  ebp
        ret


    ; Print integer
    iprint:
        push eax
        push ecx
        push edx
        push esi
        mov  ecx,0

    .divideLoop:

        inc  ecx
        xor  edx, edx
        mov  esi, 10
        idiv esi
        add  edx, 48
        push edx
        cmp  eax, 0
        jnz  .divideLoop

    .printLoop:

        dec  ecx
        mov  eax, esp
        push eax
        call printLN
        pop  eax
        cmp  ecx, 0
        jnz  .printLoop

        pop  esi
        pop  edx
        pop  ecx
        pop  eax
        ret




