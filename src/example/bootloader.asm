    BITS 16

    start:
        mov ax, 07C0h   ;Set up 4k stack space after this bootloader
        add ax, 288     ;(4096 + 512) / 16 bytes per paragraph
        mov ss, ax
        mov sp, 4096

        mov ax, 07C0H   ;Set data segment to where we're loaded
        mov ds, ax


        mov si, test_string
        call print_string

        jmp $           ;Jump here -infinity loop!

        text_string db 'This is my cool new OS!', 0

    print_string:
        mov ah, 0Eh

    .repeat:
        lodsb           ;Get character from string
        cmp al, 0
        je .done
        int 10h
        jmp .repeat

    .done:
        ret

        times 510-($-$$) db 0 ; Pad remainder of boot sector with 0s
        dw 0xAA55		      ; The standard PC boot signature

