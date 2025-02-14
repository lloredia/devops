section .data

msg db      'w','w' ; w hex - 77, makes it easier to find in memory
len equ     $ - msg

section .text 
             
	global  _start              
			       

_start:
	push rbp
	mov rbp, rsp
	sub rsp, 0x30

	xor rdx, rdx
	mov rdx, 5
	mov rcx, 5
	
	mov [rbp-0x10], rdx
	mov [rbp-0x18], rcx

	add rdx, rcx
	mov [rbp-0x20], rdx

	mov     rax, 60	; sys_exit   
	mov	rdi, [rbp-0x20]	; retcode is the sum of numbers 
	syscall
