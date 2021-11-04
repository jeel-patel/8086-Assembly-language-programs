data segment

	string db "Hello world$"

data ends

stack_seg segment stack

	dw 100 dup(0)

	top_ptr label word
stack_seg ends

code segment

	assume cs:code, ds:data, ss:stack_seg

	start:

		mov ax, seg data
		mov ds,ax

		mov ax,stack_seg
		mov ss,ax

		call print

		int 3h
		
		print proc near

			mov ah,09h
			lea dx,string
			int 21h
			ret

		print endp

		code ends
	end start

