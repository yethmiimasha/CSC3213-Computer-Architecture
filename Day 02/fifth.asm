.model small
.stack 100h

.data
m1 db "Number 01:$"
num1 db 2

m2 db "Number 02:$"
num2 db 3

m3 db "Addition of  num1 and num2:$"

.code 
start:

mov ax,@data
mov ds,ax

mov dx,offset m1
mov ah,09h
int 21h

mov dl,num1
add dl,48
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset m2
mov ah,09h
int 21h

mov dl,num2
add dl,48
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset m3
mov ah,09h
int 21h


mov dl,num1
add dl,num2
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start
