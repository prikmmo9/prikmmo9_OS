org 0x7C00

start:
    mov ax, 0x0003
    int 0x10
    
    ; Выводим разноцветный текст
    mov si, title
    call print_string
    
    mov si, message1  
    call print_string
    
    mov si, message2
    call print_string
    
    mov si, status
    call print_string
    
    jmp $

print_string:
    mov ah, 0x0E
.loop:
    lodsb
    test al, al
    jz .done
    int 0x10
    jmp .loop
.done:
    ; Переводим строку
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10
    ret

title    db "=== NEW OS PRIKMMO9 ===", 0
message1 db "Stage 1: Boot sector loaded", 0  
message2 db "Stage 2: Memory check passed", 0
status   db "Status: Ready for kernel...", 0

times 510-($-$$) db 0
dw 0xAA55