.model small
.stack 100h
.data
	msg1 db "Enter the num01 : $" 
	n1 db 0
	msg2 db "Enter the num02 : $" 
	n2 db 0
	msg3 db "Total of num1 and num2 : $" 
	n3 db 0
	
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
	
	mov ah,01h ; read input as 5, al=48+5=53
	int 21h
	mov dl,al ; al=53 dl=53
	sub dl,48 ; dl=53-48=5
	mov n2,dl ; n2=5
	
	mov dl,0ah ; next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg3 ; print the msg 03
	mov ah,09h
	int 21h
	
	mov dl,n1 ; dl=n1 dl=3
	add dl,n2 ; dl=n1+n2 d1=3+5=8
	add dl,48 ; dl=8+48=56

	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start