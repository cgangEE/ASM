.model small
.686
.stack
.data
.code
array byte 40 DUP(?)
printString proc
	mov ax, [esp+4]
	push ax
	call printChar
	add esp, 2
	
	mov ax, '-'
	push ax
	call printChar
	add esp, 2
	
	mov ax, [esp+2]
	push ax
	call printChar
	add esp, 2
	
	mov ax, 0ah
	push ax
	call printChar
	add esp, 2
	
	ret
printString endp

move proc
	mov bx, [esp+8]
	cmp dx, 1
	jnz elses
		mov ax, [esp+ 6]
		mov bx, [esp+ 4]
		push ax
		push bx
		call printString
		add esp, 4
		ret
	elses:		
		mov ax, [esp+6]
		mov bx, [esp+4]
		mov cx, [esp+2]
		mov dx, [esp+8]
		dec dx
		push dx
		push ax
		push cx
		push bx
		call move
		add esp, 8
		
		mov ax, [esp+6]
		mov bx, [esp+4]
		push ax
		push bx
		call printString
		add esp, 4

		mov ax, [esp+6]
		mov bx, [esp+4]
		mov cx, [esp+2]
		mov dx, [esp+8]
		dec dx
		push dx
		push cx
		push bx
		push ax
		call move
		add esp, 8
		ret
move endp

printChar proc near16
	mov edx, [esp+2]
	
	mov ah, 2
	int 21h
	ret
printChar endp

start:
	mov ax, 3
	push ax
	mov ax, 'A'
	push ax
	mov ax, 'B'
	push ax
	mov ax, 'C'
	push ax
	call move
	add esp, 8
	
	mov eax, 4c00h
	int 21h
public start
end start
