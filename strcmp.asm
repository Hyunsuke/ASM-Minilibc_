section .text
global strcmp

strcmp:
    mov rcx, 0

.loop:
    mov al, byte [rdi + rcx]
    mov sil, byte [rsi + rcx]
    cmp rax, 0
        je .fend
    cmp rsi, 0
        je .fend
    cmp al, sil
        jne .fend
    inc rcx
    jmp .loop
.fend:
    sub al, sil
	movsx	rax, al
    jmp .end

.end:
    ret