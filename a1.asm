data segment

    rega dw 0026H
    regb dw 6200H
data ends

code segment

    assume cs:code, ds:data

    start:

        mov ax,data
        mov ds, ax

        mov ax,rega
        sub ax,regb

        int 3H

    code ends
end start