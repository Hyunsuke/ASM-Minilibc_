section .text
global memmove

memmove:
    mov rcx, 0
    cmp rdi, rsi
        jle .left_to_right
    jmp .right_to_left

.left_to_right:
    cmp rcx, rdx
        je .end
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp .left_to_right

.right_to_left:
    cmp rdx, 0
        je .end
    dec rdx
    mov r8b, byte [rsi + rdx]
    mov byte [rdi + rdx], r8b
    jmp .right_to_left

.end:
    mov rax, rdi
    ret