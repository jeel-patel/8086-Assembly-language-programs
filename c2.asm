code segment
    assume cs:code

    start:

        mov ah,01h
        int 21h

        mov cl,al

        int 21h

        mul cl

        int 3h

    code ends
end start