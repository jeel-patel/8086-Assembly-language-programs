data segment
	
	array dw 10 dup(0003);
	
data ends

code segment

	assume ds:data, cs:code;
	
	start:
		mov ax,data;
		mov ds, ax;
		
		mov cl,0AH;
		mov ax,0000H;
		mov si, offset array;
		
		lp:
			add ax,word ptr[SI];
			
			add SI,0002h;
			
			dec cl;
			jz finish;
			
			jmp lp;
			
		finish:
		
		int 3H;
			
		code ends;
	end start;