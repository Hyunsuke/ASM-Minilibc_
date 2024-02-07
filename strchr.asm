section .text
global strchr

strchr:
	mov rax, 0
.loop:
	cmp	byte [rdi], sil
	    je	.found
	cmp byte [rdi], 0
	    je	.not_found
	inc	rdi
	jmp	.loop

.found:
	mov	rax, rdi
	ret

.not_found:
    ret