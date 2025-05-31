;read a number without printing it

.model small
.stack 100h
.data
	msg db "Enter a Number : $"
	a db ?
	b db ?
	
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	call readInt
	
	mov ax,4c00h
	int 21h
	
	proc readInt 
		mov ah,01h ;input,1
		int 21h ;al=48+1=49
		sub al,48 ;al=al-48=1
		mov a,al ;a=1
			read:
				mov ah,01h ;next input,2
				int 21h ;2+48=50
				cmp al,0dh ;enter key
				je exit
				
				sub al,48 ;al=al-48=2
				mov b,al ;b=2
				
				mov al,a ;al=1
				mov bl,10 ;bl=10
				mul bl ;al=al*bl=1*10
				add al,b ;al+b=10+2=12
				
				mov a,al ;a=12
				jmp read ;again read, enter number 3, finaly number = 123 , again.....
				
			exit:
				mov al,a
				
	ret 
	endp
	
end 