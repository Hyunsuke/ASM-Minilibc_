SECTION .text
    global memmove
    ;; void *memmove(void *dest, const void *src, size_t n);

memmove:
    xor rcx, rcx

    cmp rdi, rsi
    jle forward ; if dest <= src, forward copy

    add rcx, rdx ; add n to rcx
    dec rcx
    jmp backward

forward:
    cmp rdx, 0 ; if n == 0, return dest
    je end

    mov r8b, [rsi + rcx] ; move byte from src to r8b
    mov [rdi + rcx], r8b ; move byte from r8b to dest
    inc rcx
    dec rdx
    jmp forward

backward:
    cmp rdx, 0 ; if n == 0, return dest
    je end

    mov r8b, [rsi + rdx - 1]
    mov [rdi + rdx - 1], r8b
    dec rdx
    jmp backward

end:
    mov rax, rdi
    ret