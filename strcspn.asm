section .text
    global strcspn

strcspn:
    ; rdi = first_string, rsi = second_string
    mov rcx, 0
    cmp rdi, 0
        je .end

.main_loop:
    ; al = character first string. On regarde si c'est nul puis on search dans l'autre string
    mov al, byte [rdi + rcx]
    cmp al, 0
        je .end
    mov r9, 0
    jmp .sub_loop

.sub_loop:
    cmp byte [rsi + r9], 0
        je .inc_rcx_loop
    cmp byte [rsi + r9], al
        jne .inc_r9_loop
    jmp .end

.inc_rcx_loop:
    inc rcx
    jmp .main_loop

.inc_r9_loop:
    inc r9
    jmp .sub_loop

.end:
    mov rax, rcx
    ret
