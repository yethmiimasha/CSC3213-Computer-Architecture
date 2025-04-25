;write the essembly program to input a single digit number and check if it is even or odd

.model small
.stack 100h
.data
m1 db "Enter the Number : $"
m2 db "even $"
m3 db "odd $"
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

mov ah,00
mov bl,2
mov al,n
div bl ;n/2=3/2

cmp ah,0
je evenn
jne oddd

evenn:
mov dx,offset m2
mov ah,09h
int 21h
jmp endn

oddd:
mov dx,offset m3
mov ah,09h
int 21h

endn:
mov ax,4c00h
int 21h
end start