section .text
global strrchr

strrchr:
    mov rcx, 0
    test rdi, rdi
        je .not_found

.get_len:
    cmp     byte [rdi + rcx], 0
        je      .add_to_rdi
    inc     rcx
    jmp     .get_len

.add_to_rdi:
    add rdi, rcx
    test sil, sil
        je .char_is_null
    jmp .loop

.loop:

    dec rdi
    cmp byte [rdi], sil
        je .found
    cmp byte [rdi], 0
        je .not_found
    jmp .loop

.found:
    mov rax, rdi
    ret

.not_found:
    mov rax, 0
    ret

.char_is_null:
    mov rax, rdi
    ret