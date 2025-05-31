;print even numbers from 2 to 9

.model small
.stack 100h
.data
	msg db "Even Numbers from 2 to 9: $"
	newLine db 13,10, '$'
	
.code
main:
	mov ax,@data
	mov ds,ax
	
	mov cl,9 ;for , cl=9
	mov bl,1 ;bl=2
	
next_num:
	mov al,bl
	mov ah,00
	mov dl,2
	div dl
	cmp ah,0
	jnz not_even
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov al,bl
	add al,48
	mov dl,al
	mov ah,02h
	int 21h
	
	mov dx,offset newLine
	mov ah,09h
	int 21h
	
not_even:
	inc bl
	loop next_num
	
	mov ax,4c00h
	int 21h
	
end main