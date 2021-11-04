data segment public

    number dw 1234H
    ans dw 0000h

data ends

code segment

    assume cs:code, ds:data

    start:  

        mov ax,data
        mov ds,ax

        lea bp,number

        and ds:word ptr[bp],0001H

        nop
        nop
        mov ax,1234H
        mov ds,ax
        nop

        int 3h

    code ends
end start