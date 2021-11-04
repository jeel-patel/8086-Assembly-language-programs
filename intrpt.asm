;I have used bl register for divisor

data segment word public

    divident dw 00ABH,0CDEH,0111111111111111B, 1111111111111111B
    string db "error",10,"$"
    flag db 4 dup(0)

data ends

public string
public flag

stk segment stack

    dw 100 dup(0)

    stack_top label word
    
stk ends

div_interrupt_handler segment word public

    extrn procedure:far

div_interrupt_handler ends


code segment

    assume cs:code, ds:data, ss:stk

    start:

        mov ax,data
        mov ds,ax

        mov ax,stk
        mov ss,ax

        mov ax,0000H
        mov es,ax

        mov word ptr es:0000,offset procedure
        mov word ptr es:0002, seg procedure

        lea sp,stack_top

        lea si,divident
        lea di,flag

        mov cx,0004H
        mov bl,44H ; my divisor

        lp:
            mov ax,[si]

            div bl

            inc si
            inc si
            inc di

            dec cx
        jnz lp

        int 3h

    code ends
end start