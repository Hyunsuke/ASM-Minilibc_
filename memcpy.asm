section .text
global memcpy

memcpy:
	mov rcx, 0

.loop:
    cmp rcx, rdx
        je .end
    mov sil, byte [rsi + rcx] ; J'aurais pu utiliser dil à la place de sil aussi
    mov byte [rdi + rcx], sil
	inc rcx
	jmp .loop

.end:
    ret