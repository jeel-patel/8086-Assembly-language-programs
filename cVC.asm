data segment
    str_buf dw 100,102 dup(0);
data ends

code segment
    assume cs:code, ds:data

    start:

        mov ax,seg str_buf;
        mov ds, ax;
        
        mov ax,offset str_buf;

        mov dx,ax;
        mov ah,0AH;

        INT 21h;

        mov si,dx;

        inc si;

        mov bx,0000H;

        mov cl,byte ptr ds:[si];
        mov ch,00H

        lp:
            
            cmp byte ptr ds:[si],61H
                jz incvovel
            cmp byte ptr ds:[si], 65H
                jz incvovel
            cmp byte ptr ds:[si], 69H
                jz incvovel
            cmp byte ptr ds:[si], 6FH
                jz incvovel
            cmp byte ptr ds:[si], 75H
                jz incvovel

        return:

            inc si;
            dec cx
        jnz lp


        int 3h

    incvovel:
        inc bh
    jmp return

    code ends
end start