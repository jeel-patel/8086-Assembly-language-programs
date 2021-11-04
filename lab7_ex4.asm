data segment
    string db "Hello Jeel Welcome to 8086 Microprocessor$"
    dummy db 1000 dup(0)
data ends

code segment
    assume cs:code, ds:data
    
    start:
        
        mov ax,data
        mov ds,ax
        
        lea si,string
        
        mov cl,29H
        
        lp:
            cmp byte ptr[si],65H
            jz convert
        return:
            inc si
            dec cl
        jnz lp
        
        int 3h
    
    convert:
        mov byte ptr[si],6FH
    jmp return
        
        
        
    code ends
end start
        