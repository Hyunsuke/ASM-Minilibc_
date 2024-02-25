section .text
global memcpy

memcpy:
	mov rcx, 0
    mov rax, rdi
    cmp rdx, 1
		jl .end

.loop:
    cmp rcx, rdx
        je .end
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
	inc rcx
	jmp .loop

.end:
    ret