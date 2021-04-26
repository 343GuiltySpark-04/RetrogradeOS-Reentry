bits 16
org 0x7c00
; Made by Victor Mout

jmp printstring
mainloop:

printchar:
        mov ah, 0x0e ; Enter teletype mode
        int 0x10
        jmp mainloop


printstring:
        mov si, version
        .loop:
          mov ah, 0x0e
          lodsb
          cmp al, 0x00
          je return
          int 0x10
          jmp .loop

readchar:
        mov ah, 01h ; Test key
        int 16h

        mov ah, 00h ; Get key
        int 16h

        jmp printchar

return:
        ret

version         db 'VictorOS 0.1 (Dev)', 0x00
times 510-($-$$) db 0 ; Repeat db 0 512 times
db 0x55, 0xaa ; End boot sector 0xaa

