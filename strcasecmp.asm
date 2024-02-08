section .text
    global strcasecmp

strcasecmp:
    mov rcx, 0

.loop:
    mov al, byte [rdi + rcx]
    mov r8b, byte [rsi + rcx]
    cmp     al, 'A'
        jl      .is_s2_also_upper
    cmp     al, 'Z'
        jg      .is_s2_also_upper
    add     al, 32

.is_s2_also_upper:
    cmp     r8b, 'A'
    jl      .compare
    cmp     r8b, 'Z'
    jg      .compare
    add     r8b, 32

.compare:
    cmp     al, r8b          ; Compare characters (case insensitive)
        jne     .done             ; If not equal, strings are different
    cmp    al, 0          ; Check for null terminator
        je      .done             ; If both strings ended, they are equal
    inc     rcx               ; Move to next character
    jmp     .loop             ; Continue loop

.done:
    sub     al, r8b
    movsx   rax, al
    ret

