section .text
global memmove

memmove:
    push rbp
    mov rbp, rsp
    mov rcx, 0
    mov r8, 0
    sub rsp, rdx
    cmp rdx, 0
        je .ret_rdi
    cmp rdi, rsi
        jle .loop

.loop:
    mov r8, qword [rsi + rcx]
    mov byte [rsp + rcx], r8b
    inc rcx
    cmp rcx, rdx
        jne .loop
    mov rsi, rsp
    jmp .memcpy
    jmp .result

.memcpy:
	mov rcx, 0
    mov rax, rdi

.memloop:
    cmp rcx, rdx
        je .result
    mov r8b, byte [rsi + rcx]
    mov byte [rax + rcx], r8b
    inc rcx
    jmp .memloop

.ret_rdi:
    mov rax, rdi

.result:
    mov rsp, rbp
    pop rbp
    jmp .end

.end:
    ret