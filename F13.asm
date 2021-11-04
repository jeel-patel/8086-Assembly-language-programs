;a TSR program
;the ALT-K key combination is activated.
;A hot key is composed of a key scan code and a code found in memory location 0000:0417.
;The keyboard generates type9 interrupt whenever a key is typed. This when intercepted with TSR handler, it reads the keyboard code directly from I/O port 60H, which returns the keyboard scan code.


	.MODEL TINY
	.386
	.CODE
	.STARTUP
	JMP	INSTALL		;install  VEC9
                                                
HFLAG	DB	0		;Hot-key detected
ADD9	DD	?		;old vector 9 address

KEY	DB	25H		;scan code for K
HMASK	DB	8		;alternate key mask
MKEY	DB	8		;alternate key
SCRN	DB	300 DUP (?)	;screen buffer
MES1	DB	'TSR IS ACTIVE'

        
VEC9	PROC	FAR		;keyboard intercept
        
	STI				;enable interrupts
	PUSH	AX		;save AX
	IN	AL,60H		;get scan code
	CMP	AL,CS:KEY	;test for K
	JNE	VEC91		;no hot-key
	MOV	AX,0		;address segment 0000
	PUSH	DS		;save DS
	MOV	DS,AX
	MOV	AL,DS:[417H]	;get shift/alternate data
	POP	DS
	AND	AL,CS:HMASK	;isolate alternate key
	CMP	AL,CS:MKEY	;test for alternate key
	JE	VEC93		;if hot-key found
VEC91:
	
	POP	AX
	JMP	CS:ADD9		;do normal interrupt
VEC93:				;if hot-key pressed
	CLI				;interrupts off	
	IN	AL,61H		;clear keyboard and
	OR	AL,80H		;throw away hot key
	OUT	61H,AL
	AND	AL,7FH
	OUT	61H,AL
	MOV	AL,20H		;reset keyboard interrupt
	OUT	20H,AL
	STI			;enable interrupts
	MOV	CS:HFLAG,1	;indicate hot-key pressed
        push cx
       
        push di
        push si
        push ds
        push es
        cld
        mov ax,cs
        mov es,ax
        mov ax,0b800h
        mov ds,ax
        mov cx,160
        mov di,offset scrn
        mov si,0
        rep movsb
        push ds
        push es
        pop ds
        pop es
        mov di,80
        mov si,offset mes1
        mov ah,0fh
        mov cx,13
vec95: lodsb
       stosw
       loop vec95
       pop es
       pop ds
       pop si
       pop di
      
       pop cx
       POP     AX
	IRET
        
VEC9	ENDP
                                                
                                                
INSTALL:			;install VEC9
                                                
	MOV	AX,CS		;load DS
	MOV	DS,AX
                                                
	
	MOV	AX,3509H	;get current vector 9
	INT	21H		;and save it
	MOV	WORD PTR ADD9,BX
	MOV	WORD PTR ADD9+2,ES
                                                
	
                                                
	MOV	AX,2509H
	MOV	DX,OFFSET VEC9	;address interrupt procedure
	INT	21H		;install vector 9
                                                
	MOV	DX,OFFSET INSTALL	;find paragraphs
	SHR	DX,4
	INC	DX
        
	MOV	AX,3100H	;set as a TSR
	INT	21H
	END