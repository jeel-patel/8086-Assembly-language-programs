code segment 
    assume cs:code

    start:

        mov ah,01H
        int 21H
        
        add al,20H

        mov ah,02H
        mov dl,al
        int 21H

        int 3h
    code ends
end start