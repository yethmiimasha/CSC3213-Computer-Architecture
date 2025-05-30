;use the loop to display numbers from 1 to 5 (e.g. 1 2 3 4 5)

.model small
.stack 100
.data
	s db ' $'
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov cl,5
	mov bl,1
	
print_loop:
	mov ah,02h
	mov dl,bl
	add dl,48
	int 21h
	
	mov dx,offset s
	mov ah,09h
	int 21h
	
	inc bl
	loop print_loop
	
mov ax,4c00h
int 21h

end start