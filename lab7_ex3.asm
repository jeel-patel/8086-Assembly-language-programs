data segment 

    string db 100,102 dup(0)

data ends

code segment

    assume cs:code,ds:data

    start:

        mov ax,data
        mov ds,ax

        lea si,string
        mov dx,si

        mov ah,0AH
        int 21H
        
        inc si
        
        mov cl,byte ptr[si]
        
        inc si
        lp:
            mov dl,byte ptr[si]
            add dl,20H
            
            mov byte ptr[si], dl
            
            inc si
            dec cl
        jnz lp
        
        int 3h
        
    code ends
end start