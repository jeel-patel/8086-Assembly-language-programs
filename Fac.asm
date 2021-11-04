data segment

    number db 08H

data ends

code segment

    assume cs:code, ds:data

    start:

        mov ax,seg data
        mov ds,ax

        mov bx,offset number
        mov cl,byte ptr[bx]
        mov ch,00H

        mov ax,0001H
        mov dx,0000H
        call findFactorial

        int 3h


        findFactorial proc near

            cmp cx,0001H

            jz return

            push cx
            dec cx
            call findFactorial
            pop cx
            mul cx 

            return:
                ret
        findFactorial endp

    code ends
end start