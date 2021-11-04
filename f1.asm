_TEXT segment byte public 'CODE'
DGROUP group _DATA, _BSS
assume cs:_TEXT, ds:DGROUP, SS: DGROUP

_TEXT ends
_DATA segment word public 'DATA'
_DATA ends
_TEXT segment byte public 'CODE'
PUBLIC _c2f
_c2f PROC NEAR
PUSH BP
MOV BP,SP
PUSH SI
MOV AX, WORD PTR [BP + 4]
MOV DX,9
MUL DX
MOV BX,5

CWD
IDIV BX
MOV SI,AX
ADD SI,32
MOV AX,SI
POP SI
POP BP
RET
_c2f ENDP
_TEXT ends

_BSS segment word public 'BSS'
EXTRN _tempf:WORD

_BSS ends

_DATA segment word public 'DATA'
EXTRN _tempc:WORD

_DATA ends
END