%include 'syscall.inc'


global print
global strlen
global sprint


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
        ret




        slen:

            push ebx,
            mov  ebx,eax

        nextchar:

            cmp  byte [eax], 0
            jz   finished
            inc  eax
            jmp  nextchar

        finished:

            sub eax,ebx
            pop ebx
            ret


        sprint:

            push edx
            push ecx
            push ebx
            push eax
            call slen

            mov edx, eax
            pop eax

            mov ecx, eax
            mov ebx, 1
            mov eax, 4
            int 80H

            pop ebx
            pop ecx
            pop edx
            ret





