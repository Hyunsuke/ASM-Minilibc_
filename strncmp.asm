section .text
global strncmp

strncmp:
    mov rcx, 0
    mov r8, 0

.loop:
    mov al, byte [rdi + rcx]
    mov r8b, byte [rsi + rcx]
    cmp rcx, rdx
        je .zero
    cmp al, 0
        je .result
    cmp r8b, 0
        je .result
    cmp al, r8b
        jne .result
    inc rcx
    jmp .loop

.result:
    sub al, r8b
	movsx	rax, al
    jmp .end

.end:
    ret

.zero:
    mov rax, 0
    ret