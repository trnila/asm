global bubbleSort

bubbleSort:
	mov r11, 0

loop:
	mov rsi, 0

loop2:
	mov r9b, [rdx + rsi]
	mov r10b, [rdx + rsi + 1]

	cmp r9b, r10b
	jg swap

swap_continue:
	inc rsi

	cmp rsi, 9
	jl loop2

	inc r11
	cmp r11, 10
	jle loop

	ret

swap:
	mov [rdx + rsi], r10b
	mov [rdx + rsi + 1], r9b
	jmp swap_continue
