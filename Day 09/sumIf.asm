;Use a loop to display sum of numbers from 1 to 5

.model small
.stack 100
.data
	sum db 0
	r db 0
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov cl,5
	
print_loop: ;cl=5 , cl=4 , cl=3, cl=2, cl=1
	mov dl,sum ;dl=sum=0
	add dl,cl ;dl=dl+cl=0+5
	mov sum,dl ;sum=dl=5
	
	loop print_loop ;sum=15
	
	mov al,sum
	mov ah,00
	mov bl,10
	div bl
	mov r,ah
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,r
	add dl,48
	mov ah,02h
	int 21h
	
mov ax,4c00h
int 21h

end start