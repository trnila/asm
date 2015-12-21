section .text
global _start ;must be declared for linker (ld)

p:
;	mov rax, 97
;	mov [buffer], rax

;	mov [buffer + 1], rax

	mov r8, 987

	; divide by 100
	mov edx, 0 ; high 32bit of dividend
	mov rax, r8 ; low 32bit of dividend
	mov ecx, 100 ; copy divisor
	div ecx ; divide, result is stored in eax

	; store digin in buffer
	mov r9, rax
	add r9, '0'
	mov [buffer], r9

	; substract
	mul ecx ; vynasobit 100
	sub r8, rax

	; NEXT DIGIT
	mov edx, 0
	mov rax, r8 ; copy low 32bit of number
	mov ecx, 10 ; copy divisor - 10
	div ecx ; divide, result is stored in eax

	; store digin in buffer
	mov r9, rax
	add r9, '0'
	mov [buffer + 1], r9

	; substract
	mul ecx ; vynasobit 10
	sub r8, rax

	; add last digit to buffer
	add r8, '0'
	mov [buffer + 2], r8



	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, buffer
	mov rdx, 3
	syscall
	ret


_start:

	call p


	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, $msg
	mov rdx, $len
	syscall


	mov rax, 60       ;system call number (sys_exit)
	mov rdi, 0
	syscall

section .bss
	buffer: resb 20

section .data
	l db '0123456789'

	msg db 'Hello, world!', 0xa     ;the string
	len equ $ - msg                 ;length of the string