%include 'syscall.inc'
global  putstr
extern  strlen

SECTION .text


    putstr:
        push ebp
        mov  ebp, esp
        push dword [ebp+8]
        call strlen
        add  esp,4
        syscall 4,1, [ebp+8]
        mov  esp, ebp
        pop  ebp
        ret