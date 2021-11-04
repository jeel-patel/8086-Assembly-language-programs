data segment

    dt1 dw 0026H
    ans dw ?

data ends

stk segment stack

    dw 100 dup(0)

    stack_top label word
stk ends

procedure_segment segment

    assume cs:procedure_segment, ds:data

    find_ans proc far

        mov ax,sp
        mov bp,ax

        mov bx,word ptr[bp+0004H]

        mov cx,0000h

        mov ax,bx
        and ax,000FH
        add cx,ax

        mov ax,bx
        and ax,00F0H
        ror ax,4h
        mov dx,000Ah
        mul dx
        add cx,ax

        mov ax,bx
        and ax,0F00H
        ror ax,08H
        mov dx,0064h
        mul dx
        add cx,ax

        mov ax,bx
        and ax,1111000000000000B
        ror ax,0Ch
        mov dx,03E8H
        mul dx
        add cx,ax

        mov word ptr[bp+0004H], cx

        ret
    find_ans endp

procedure_segment ends


code segment

    assume cs:code, ss:stk, ds:data

    start:

        mov ax,seg data
        mov ds,ax

        mov ax,seg stk
        mov ss,ax

        lea sp,stack_top

        mov ax,dt1

        push ax

        call find_ans

        mov ax,sp
        mov bp,ax

        mov ax,word ptr[bp]
        mov ans,ax

        int 3h

    code ends
end start
