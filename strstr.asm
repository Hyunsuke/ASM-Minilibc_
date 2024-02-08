section .text
global strstr

strstr:
	mov rcx, 0
	MOV	AL, BYTE [RDI]
	CMP	AL, 0x00
	    JE	.both_string_null

.finding_loop:
	mov	r9, 0
    mov al, byte [rdi + rcx]
    mov r8b, byte [rsi + r9]
    cmp al, 0
        je ret_zero
    cmp r8b, 0
        je ret_rdi
    mov r10, rcx
    inc rcx
    cmp al, r8b
        je .loop
	JMP	.finding_loop

.loop:
    mov al, byte [rdi + r10]
    mov r8b, byte [rsi + r9]
    cmp al, 0
        je .fend
    cmp r8b, 0
        je .ret_value
    inc r9
    inc r10
    cmp al, r8b
        jne .finding_loop
    jmp .loop

.both_string_null:
    mov r8b, byte [rsi]
    cmp r8b, 0
        je ret_rdi
    jmp .finding_loop

.fend:
    cmp byte [rsi + r9], 0
        jne ret_zero
    sub rcx, 1
    add rdi, RCX
    mov rax, rdi
    jmp end

.ret_value:
    sub rcx, 1
    add rdi, rcx
    mov rax, rdi
    jmp end

ret_zero:
    mov rax, 0
    ret

ret_rdi:
    mov rax, rdi
    ret

end:
    ret