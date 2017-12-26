%include 'macro.asm'


SECTION .bss

buffer      resb 4096
bufsize     equ  $-buffer
fdsrc       resd 1
fddest      resd 1
argc        resd 1
argvp       resd 1



SECTION .data
helpmsg     db  'Usage: copy <src> <dest>', 10
helplen     equ $-helpmsg
err1msg     db  "Could'not open source file for reading",10
err1len     equ $-err1msg
err2msg     db  "Could'not open destination file for writing",10
err2len     equ $-err2msg



SECTION .text
global _start

  _start:
            pop  dword [argc]
            mov  [argvp], esp
            cmp  dword [argc], 3
            je   .args_count_ok
            syscall  4,2, helpmsg, helplen
            syscall  1,1

  .args_count_ok:

            mov  esi, [argvp]
            mov  edi, [esi+4]
            syscall 5, edi,0
            cmp  eax,0
            jge  .source_open_ok
            syscall 4,2, err1msg, err1len
            syscall 1,2

  .source_open_ok:

            mov  [fdsrc], eax
            mov  esi, [argvp]
            mov  edi, [esp+8]
       %ifdef OS_LINUX
            syscall 5,edi, 241h,0666o
       %else
            syscall 5,edi, 601h, 0666o
       %endif
            cmp eax, 0
            jge .dest_open_ok
            syscall 4,2,err2msg, err2len
            syscall 1,3

  .dest_open_ok:

            mov [fddest] ,eax

  .again:

            syscall 3,[fdsrc],buffer,bufsize
            cmp eax,0
            jle .end_of_file
            syscall 4,[fddest],buffer,eax
            jmp .again

  .end_of_file:

            syscall 6, [fdsrc]
            syscall 6, [fddest]
            syscall 1, 0



