section .text
global memset

memset:
	mov rcx, 0

.loop:
	cmp rcx, rdx
	    je .end
	mov byte [rdi + rcx], sil ; sil est dans le registre rsi et est sur un byte
	inc rcx
	jmp .loop

.end:
    ret