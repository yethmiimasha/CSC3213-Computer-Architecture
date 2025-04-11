.model small
.stack 100h

.data
msg db "Enter the Number : $"
h db 0 ;1
t db 0 ;2
o db 0 ;3
h1 db 0 ;100
dig db 0 ;123
rh db 0
rt db 0

.code
start:
mov ax,@data
mov ds,ax

;print the msg
mov dx,offset msg
mov ah,09h
int 21h

;read first number
mov ah,01h
int 21h

mov dl,al
sub dl,48
mov h,dl

;read second number
mov ah,01h
int 21h

mov dl,al
sub dl,48
mov t,dl

;read third number
mov ah,01h
int 21h

mov dl,al
sub dl,48
mov o,dl

;---------------------------------------------------------
;bl=100
mov bl,100
mov al,h
mul bl
mov h1,al ;h1=100

;bl=10
mov bl,10
mov al,t
mul bl
mov dl,al

add dl,h1
add dl,o
mov dig,dl

;printing the new line
mov dl,10
mov ah,02h
int 21h

;clearing ah to use for reminder 1
;dig=123/100=1 r=23
mov ah,00 ;ah=0
mov al,dig ;al=123
mov bl,100 ;bl=100
div bl ;al=al/bl=123/100=1
;moving reminder to read
mov rh,ah ;rh=23

;print first reminder
mov dl,al
add dl,48
mov ah,02h
int 21h

;clearing ah to use for reminder 2
mov ah,00 ;ah=0
mov al,rh ;al=23
mov bl,10 ;bl=10
div bl ;al=al/bl=23/10=2
;moving reminder to read
mov rt,ah

;print secong reminder
mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,rt
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h
	
end start