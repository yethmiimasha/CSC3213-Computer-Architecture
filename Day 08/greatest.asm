;Given three numbers,determine which one is the greatest and display the message.

.model small
.stack 100h
.data
	msg1 db "Enter the First number : $" 
	n1 db 0
	msg2 db "Enter the Second number : $" 
	n2 db 0
	msg3 db "Enter the third number : $" 
	n3 db 0
	msg4 db "The greatest number is : $"
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1 ; print the msg 01
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h ;read 1 number
	
	mov dl,al 
	sub dl,48 
	mov n1,dl 

	mov dl,10
	mov ah,02h
	int 21h

;--------------------------------------------------

	mov dx,offset msg2 ; print the msg 02
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h ;read 2 number
	
	mov dl,al 
	sub dl,48 
	mov n2,dl 

	mov dl,10
	mov ah,02h
	int 21h
	
;--------------------------------------------------

	mov dx,offset msg3 ; print the msg 03
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h ;read 3 number
	
	mov dl,al 
	sub dl,48 
	mov n3,dl 

	mov dl,10
	mov ah,02h
	int 21h
	
;---------------------------------

	mov al,n1
	cmp al,n2
	jge l1
	jle l2
	
	l1:
	mov bl,n3
	cmp al,bl
	jge ms1
	jl ms3
	
	l2:
	mov bl,n3
	cmp al,bl
	jge ms2
	jle ms3
	
	ms1:
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov dl,n1
	add dl,48
	mov ah,02h
	int 21h
	jmp endn
	
	ms2:
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov dl,n2
	add dl,48
	mov ah,02h
	int 21h
	jmp endn
	
	ms3:
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov dl,n3
	add dl,48
	mov ah,02h
	int 21h
	jmp endn
	
endn:	
mov ax,4c00h
int 21h
	
end 