data segment public
    ; divident dw 1234H, 0034H
    ; divisor dw 3456H
    extrn divident:word
    extrn divisor:word
    extrn quotient:word
    extrn remainder:word
data ends

stack_seg segment stack

    dw 100 dup(0)
    top_ptr label word

stack_seg ends

public divide

procedure segment public
    divide proc far

    assume ds:data, cs:procedure, ss:stack_seg

    ; start:

        mov ax,seg data
        mov ds,ax

        mov ax,seg stack_seg
        mov ss, ax

        lea si,divident
        lea di,divisor
        
        mov ax,word ptr[si]
        inc si
        inc si

        ; mov dx,word ptr[si]
        mov dx,0000h

        mov cx,ds:word ptr[di]

        div cx

        lea di,quotient
        mov word ptr[di], ax
        inc di
        inc di

        mov ax,word ptr[si]

        div cx

        mov word ptr[di], ax
        mov remainder, dx

        ; int 3h
        ; nop
        ; nop
        ret
    divide endp
procedure ends
end



;

 