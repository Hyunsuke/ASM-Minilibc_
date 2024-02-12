section .text
    global strpbrk

strpbrk:
    ; rdi = first_string, rsi = second_string
	cmp rdi, 0
        je .not_found
	cmp rsi, 0
	    je .not_found

.main_loop:
    ; al = character first string. On regarde si c'est nul puis on search dans l'autre string
    mov al, byte [rdi]
    cmp al, 0
        je .not_found
    mov rcx, 0
    jmp .sub_loop

.sub_loop:
    cmp byte [rsi + rcx], 0
        je .inc_rdi_loop
    cmp byte [rsi + rcx], al
        jne .inc_rcx_loop
    jmp .found

.inc_rdi_loop:
    inc rdi
    jmp .main_loop

.inc_rcx_loop:
    inc rcx
    jmp .sub_loop

.found:
	mov rax, rdi
	ret

.not_found:
    mov rax, 0
    ret