section .text
global strchr

strchr:
	mov rax, 0
.loop:
	cmp	byte [rdi + rax], al
	    je	.found
	cmp byte [rdi + rax], 0
	    je	.not_found
	inc	rax
	jmp	.loop
.found:
	ret

.not_found:
    ret