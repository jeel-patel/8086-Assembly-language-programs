data segment
	a dw 1001H
    b dw 1003H
	ans dw 0000H
data ends

code segment
	assume cs:code, ds:data
	
		start:
			mov ax,data
			mov ds, ax
			 
			mov ax,byte ptr a[0]
			add ax,b
			mov ans, ax
			
			int 3H
			
		code ends
		
	end start