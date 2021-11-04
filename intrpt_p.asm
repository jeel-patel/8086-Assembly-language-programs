data segment word public
    extrn string : byte
    extrn flags : byte
data ends

public procedure

my_segment segment word public
 procedure proc far
        
        assume cs:my_segment, ds:data

        lea dx,string
        mov ah,09H

        int 21H
        
        mov byte ptr[di],01H

        iret
    procedure endp
my_segment ends
end