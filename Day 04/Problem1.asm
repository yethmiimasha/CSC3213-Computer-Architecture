.model small
.stack 100h
.data
	msg1 db "Enter the First number : $" 
	n1 db 0
	msg2 db "Enter the Second number : $" 
	n2 db 0
	msg3 db "The addition is : $" 
	msg4 db "The Subtraction is : $" 
	msg5 db "The Multiplication is : $" 
	msg6 db "The division quotient is : $" 
	msg7 db "The division reminder is : $" 
	rem db ?
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1 ; print the msg 01
	mov ah,09h
	int 21h
	
	mov ah,01h ; read input as 3, al=48+3=51
	int 21h
	mov dl,al ; al=51 dl=51
	sub dl,48 ; dl=51-48=3
	mov n1,dl ; n1=3
	
	mov dl,0ah ; next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg2 ; print the msg 02
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h
	mov dl,al 
	sub dl,48 
	mov n2,dl 
	
	mov dl,0ah ; next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg3 ; print the msg 03
	mov ah,09h
	int 21h
	
	mov dl,n1 
	add dl,n2 
	add dl,48 
	
	mov ah,02h
	int 21h
	
	mov dl,0ah ; next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg4 ; print the msg 04
	mov ah,09h
	int 21h
	
	mov dl,n1 
	sub dl,n2 
	add dl,48 

	mov ah,02h
	int 21h
	
	mov dl,0ah ; next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg5 ; print the msg 05
	mov ah,09h
	int 21h
	
	mov al,n1 
	mul n2 
	mov dl,al
	add dl,48 

	mov ah,02h
	int 21h
	
	mov dl,0ah ; next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg6 ; print the msg 06
	mov ah,09h
	int 21h
	
	mov ah,00 ; define rem=0
	mov al,n1
	div n2
	mov rem,ah
	
	mov dl,al
	add dl,48 

	mov ah,02h
	int 21h
	
	mov dl,0ah ; next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg7 ; print the msg 07
	mov ah,09h
	int 21h
	
	mov dl,rem 
	add dl,48 

	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start	