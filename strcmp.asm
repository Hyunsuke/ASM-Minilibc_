section .text
global strcmp

strcmp:
    mov rcx, 0
    mov r8, 0

.loop:
    mov al, byte [rdi + rcx]
    mov r8b, byte [rsi + rcx]
    cmp rax, 0
        je .fend
    cmp r8, 0
        je .fend
    cmp al, r8b
        jne .fend
    inc rcx
    jmp .loop
.fend:
    sub al, r8b
	movsx	rax, al
    jmp .end

.end:
    ret