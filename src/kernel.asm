;prototype kernel (bleeding edge)


; Declare constants for the multiboot header.
MBALIGN  equ  1 << 0            ; align loaded modules on page boundaries
MEMINFO  equ  1 << 1            ; provide memory map
FLAGS    equ  MBALIGN | MEMINFO ; this is the Multiboot 'flag' field
MAGIC    equ  0x1BADB002        ; 'magic number' lets bootloader find the header
CHECKSUM equ -(MAGIC + FLAGS)   ; checksum of above, to prove we are multiboot
 
; Declare a multiboot header that marks the program as a kernel. These are magic
; values that are documented in the multiboot standard. The bootloader will
; search for this signature in the first 8 KiB of the kernel file, aligned at a
; 32-bit boundary. The signature is in its own section so the header can be
; forced to be within the first 8 KiB of the kernel file.
section .multiboot
align 4
	dd MAGIC
	dd FLAGS
	dd CHECKSUM
 


[BITS 32]



 ; add to offsets
   jmp start
 
   %include "src/print.inc"
 
start:   xor ax, ax   ; make it zero
   mov ds, ax   ; DS=0
   mov ss, ax   ; stack starts at 0
   mov sp, 0x9c00   ; 200h past code start
 
   mov ax, 0xb800   ; text video memory
   mov es, ax
 
   cli      ;no interruptions
   mov bx, 0x09   ;hardware interrupt #
   shl bx, 2   ;multiply by 4
   xor ax, ax
   mov gs, ax   ;start of memory
   mov [gs:bx], word keyhandler
   mov [gs:bx+2], ds ; segment
   sti
 
   jmp $      ; loop forever
 
keyhandler:
   in al, 0x60   ; get key data
   mov bl, al   ; save it
   mov byte [port60], al
 
   in al, 0x61   ; keybrd control
   mov ah, al
   or al, 0x80   ; disable bit 7
   out 0x61, al   ; send it back
   xchg ah, al   ; get original
   out 0x61, al   ; send that back
 
   mov al, 0x20   ; End of Interrupt
   out 0x20, al   ;
 
   and bl, 0x80   ; key released
   jnz done   ; don't repeat
 
   mov ax, [port60]
   mov  word [reg16], ax
   call printreg16
 
done:
   iret
 
port60   dw 0
 

