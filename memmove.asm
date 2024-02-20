section .text
global memmove

memmove:
    mov rcx, 0
    cmp rdi, rsi
        jle .left_to_right
    jmp .right_to_left

.left_to_right:
    cmp rdx, 0
        je .end
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx
    dec rdx
    jmp .left_to_right

.right_to_left:
    cmp rdx, 0
        je .end
    mov r8b, byte [rsi + rdx - 1]
    mov byte [rdi + rdx - 1], r8b
    dec rdx
    jmp .right_to_left

.end:
    mov rax, rdi
    ret