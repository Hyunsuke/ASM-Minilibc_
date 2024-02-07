section .text
global strrchr

strrchr:
    mov rax, 0

.loop:
    cmp byte [rdi], sil
        je .found
    cmp byte [rdi], 0
        je .not_found
    dec rdi
    jmp .loop

.found:
    mov rax, rdi
    ret

.not_found:
    ret