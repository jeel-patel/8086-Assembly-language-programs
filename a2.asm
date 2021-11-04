data segment
	
	array1 db 11111111B, 11010010B, 10011100B, 11001010B, 10110011B
	array2 dw 10 dup(0000H)
	
data ends

code segment

	assume cs:code, ds:data
	
	start:
		
		mov ax,data
		mov ds, ax
		
		mov SI, offset array1
		mov DI, offset array2
		dec SI

		mov bx,0006H
		mov cx,0005H
		
		lp:
			mov ax,0000H
			mov dx,0000H
			
			mov al,byte [SI]
			inc si
			
			mul bx
			
			mov DS:[di], dx
			inc di
			inc di
			mov DS:[di], ax
			inc di
			inc di
			
			dec cx
		jnz lp
			
			int 3H
			
	code ends
end start