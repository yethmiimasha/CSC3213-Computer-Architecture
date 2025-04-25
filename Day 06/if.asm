;write the assembly program to check if a number is equal to 5.
;display "Hi" if equal, else "Bye"

.model small
.stack 100h
.data
m1 db "Enter the Number : $"
m2 db "Hi $"
m3 db "Bye $"
n db 0

.code
start:
mov ax,@data
mov ds,ax

mov dx,offset m1
mov ah,09h
int 21h

mov ah,01h ;3+48=51
int 21h

mov dl,al ;dl=51
sub dl,48 ;d1=51-48
mov n,dl ;m=3

mov dl,10
mov ah,02h
int 21h

cmp n,5
je msg1
jne msg2

msg1:
mov dx,offset m2
mov ah,09h
int 21h
jmp endn

msg2:
mov dx,offset m3
mov ah,09h
int 21h

endn:
mov ax,4c00h
int 21h
end start