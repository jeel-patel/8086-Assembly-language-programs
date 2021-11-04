data segment

    number dw 0026H
    count dw 0000H
data ends

stk segment stack

    dw 100 dup(0)

    stack_top label word
stk ends

procedure_segment segment 
    assume cs:procedure_segment, ds:data, ss:stk

    find_ans proc far

        mov cx,0010H
        mov dx,0000H

        lp:
            ror bx,1
            jc increment
            
            original: 
                dec cx
        
        jnz lp

        mov bx,dx
        mov count,bx

    ret
    find_ans endp

    increment:
        inc dx
        jmp original

procedure_segment ends

code segment

    assume cs:code, ss:stk, ds:data

    start:

        mov ax,data
        mov ds,ax

        mov ax,stk
        mov ss,ax

        mov sp,stack_top

        mov bx,number

        call find_ans

        int 3h

        int 3h
    code ends
end start

