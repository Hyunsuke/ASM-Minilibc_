section .text
global strrchr

strrchr:
    mov rax, 0

.loop:
    dec rax
    cmp byte [rdi + rax], al
        je .found
    cmp byte [rdi + rax], 0
        je .not_found
    jmp .loop

.found:
    ret

.not_found:
    ret