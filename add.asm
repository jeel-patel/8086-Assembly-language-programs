code1 segment
	assume cs:code1

start:
	mov ax,1234H
	mov bx,3425H

	add ax, bx

	int 3H

code1 ends
end start