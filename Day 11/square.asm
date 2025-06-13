.model small
.stack 100h
.data
	msg db "The square number from 1 to 100 are: $"
	r db 0
	r1 db 0
	r2 db 0
	
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov cl,10
	mov bl,1
	
	print_loop:
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov al,bl
	mul bl
	
	cmp al,10
		jl digone
		jge digit
		
	digone:
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	jmp move
	
	digit:
	cmp al,100
	je digit3
	
	mov dl,10
	mov ah,00
	div dl
	mov r,ah
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,r
	add dl,48
	mov ah,02h
	int 21h
	jmp move
	
	digit3:
	mov dl,100
	mov ah,00 
	div dl
	mov r1,ah

	mov dl,al
	add dl,48
	mov ah,02h
	int 21h

	mov ah,00 
	mov al,r1
	mov dl,10 
	div dl
	mov r2,ah

	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,r2
	add dl,48
	mov ah,02h
	int 21h
	
	move:
	inc bl
	loop print_loop
	
	mov ax,4c00h
	int 21h
	
end