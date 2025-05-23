;Given a mark from 0-100, display a grade:
;90-100 A
;75-89 B
;60-74 C
;50-59 D 
;Below 50 Fail

.model small
.stack 100
.data
	msg db "The result is : $"
	msg1 db "A $"
	msg2 db "B $"
	msg3 db "C $"
	msg4 db "D $"
	msg5 db "Fail $"
	mark db 95
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov al,mark
	cmp al,90
	jge mg1
	
	cmp al,75
	jge mg2
	
	cmp al,60
	jge mg3
	
	cmp al,50
	jge mg4
	jl mg5
	
	mg1:
	mov dx,offset msg1
	mov ah,09h
	int 21h
	jmp endn
	
	mg2:
	mov dx,offset msg2
	mov ah,09h
	int 21h
	jmp endn
	
	mg3:
	mov dx,offset msg3
	mov ah,09h
	int 21h
	jmp endn
	
	mg4:
	mov dx,offset msg4
	mov ah,09h
	int 21h
	jmp endn
	
	mg5:
	mov dx,offset msg5
	mov ah,09h
	int 21h

endn:		
mov ax,4c00h
int 21h

end