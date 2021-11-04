code segment
    assume cs:code

    start:

        mov ah,01H
        mov al,00H
        int 21H

        mov ah,02H
        mov dl,al
        int 21H

        int 3h
    code ends
end start