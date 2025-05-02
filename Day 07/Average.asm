;Write an Assembly program to input three marks,
;calculate the average, and
;print if the student passed (average >= 50).

.model small
.stack 100h
.data
	msg1 db "Enter the First number : $" 
	n1 db 0
	n1t db 0
	n1o db 0
	msg2 db "Enter the Second number : $" 
	n2 db 0
	n2t db 0
	n2o db 0
	msg3 db "Enter the third number : $" 
	n3 db 0
	n3t db 0
	n3o db 0
	t db 0
	msg4 db "The Total is : $"
	msg5 db "The Average is : $" 
	a db 0
	ao db 0
	msg6 db "Pass $" 
	msg7 db "Fail $" 
	rem db ?
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1 ; print the msg 01
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h ;read 1 number
	
	sub al,48 
	mov n1t,al 
	
	mov ah,01h 
	int 21h ;read 2 number
	 
	sub al,48 
	mov n1o,al
	
	mov bl,10
	mov al,n1t
	mul bl
	add al,n1o
	
	mov n1,al ;n1=56
	
	mov dl,10 ; next line
	mov ah,02h
	int 21h
	
;------------------------------------------------
	
	mov dx,offset msg2 ; print the msg 02
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h ;read 1 number
	
	sub al,48 
	mov n2t,al 
	
	mov ah,01h 
	int 21h ;read 2 number
	 
	sub al,48 
	mov n2o,al
	
	mov bl,10
	mov al,n2t
	mul bl
	add al,n2o
	
	mov n2,al
	
	mov dl,10 ; next line
	mov ah,02h
	int 21h
	
;-------------------------------------------------
	
	mov dx,offset msg3 ; print the msg 03
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h ;read 1 number
	
	sub al,48 
	mov n3t,al 
	
	mov ah,01h 
	int 21h ;read 2 number
	 
	sub al,48 
	mov n3o,al
	
	mov bl,10
	mov al,n3t
	mul bl
	add al,n3o
	
	mov n3,al
	
	mov dl,10 ; next line
	mov ah,02h
	int 21h
	
;------------------------------------
	
	;sum
	mov dl,n1 
	add dl,n2 
	add dl,n3
	mov t,dl
	
	;divide
	mov al,t
	mov ah,00 ; define rem=0
	mov bl,3
	div bl ;al=154/3
	mov a,al ;51
	
	mov dx,offset msg5 ; print the msg 05
	mov ah,09h
	int 21h
	
	;print
	mov al,a ;al=51
	mov bl,10 ;bl=10
	mov ah,00
	div bl ;al=51/10=5
	mov ao,ah
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,ao
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov al,a
	
	cmp al,50 ;al>=50
	jge pass
	
	fail:
	mov dx,offset msg7
	mov ah,09h
	int 21h
	jmp endd
	
	pass:
	mov dx,offset msg6
	mov ah,09h
	int 21h
	jmp endd
	
	endd:
	mov ax,4c00h
	int 21h
	
end 	
	