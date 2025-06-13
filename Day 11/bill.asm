.model small
.stack 100h
.data
	msg1 db "Enter the units: $"
	msg2 db "Total bill balance: $"
	a db 0
	b db 0
	d db 0
	d1 db 0
	d2 db 0
	r db 0
	r1 db 0
	r2 db 0
	
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h

	call readInt
	
	cmp al,30
	jl nextUnit1
	jge nextUnit2
	
	proc readInt
	mov ah,01h
	int 21h
	sub al,48
	mov a,al
		read:
			mov ah,01h
			int 21h
			cmp al,0dh
			je exit
			
			sub al,48
			mov b,al
			
			mov al,a
			mov bl,10
			mul bl
			add al,b
			
			mov a,al
			jmp read
			
			exit:
			mov al,a
	ret
	endp
	
	nextunit1:
		mov d1,al
		mov al,20
		mov bl,2
		mul bl
		mov d2,al
		
		mov al,10
		mov bl,4
		mul bl
		add al,d2
		add al,d1
		
		call print
		jmp endd
	
	nextunit2:
		mov d,al
		mov dl,d
		sub dl,30
		mov bl,10
		mov al,dl
		mul bl
		mov d1,al
		mov al,20
		mov bl,2
		mul bl
		mov d2,al
		
		mov al,10
		mov bl,4
		mul bl
		add al,d2
		add al,d1
		
		call print
		jmp endd
	
	endd:
		mov ax,4c00h
		int 21h
		
	proc print
		mov dx,offset msg2
		mov ah,09h
		int 21h
		
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
		
	ret
	endp	

end