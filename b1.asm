code segment
    assume cs:code

    start:
        
        mov ah,01H
        int 21H
        mov dl,al
        mov ah,02H
        int 21H

        int 3H
    code ends
end start