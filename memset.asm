section .text
global memset

memset:
	mov rcx, 0
	cmp rdx, 1
		jl .end

.loop:
	cmp rcx, rdx
	    je .end
	mov byte [rdi + rcx], sil ; sil est dans le registre rsi et est sur un byte
	inc rcx
	jmp .loop

.end:
    ret