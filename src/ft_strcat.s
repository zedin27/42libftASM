[bits 64]

extern _ft_strlen							; use this future reference
global	_ft_strcat

section .text

; char *ft_strcat(char *s1, const char *s2)
_ft_strcat:
	mov		rbx, rdi
	mov		rcx, rsi

	.loop1:
		cmp		byte [rbx], 0		; if my rbx value is NULL
		je		.loop2				; jump to the second loop
		inc		rbx					; otherwise increase the rbx ptr
		jmp		.loop1				; repeat

	.loop2:
		cmp		byte [rcx], 0		; if rcx[rsi] NULL, then exit
		je		.exit
		mov		al, byte [rcx]		; add logic of the rcx byte offset
		mov		byte [rbx], al		; use that add logical value into rbx byte
		inc		rcx					; rcx++
		inc		rbx					; rbx++
		jmp		.loop2				; repeat to loop2

	.exit:
		mov		rax, rdi
		ret
