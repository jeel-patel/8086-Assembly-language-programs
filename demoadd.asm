;addition of two numbers using data segment
data_here segment
	d1 dw 1234h
	d2 dw 2000h
	ans dw ?
data_here ends

code_here segment
	assume cs:code_here, ds:data_here
	
start: 	mov ax,data_here
		mov ds,ax
		
		mov ax,d1
		mov bx,d2
		add ax,bx
		
		int 3h
		
code_here ends
end start