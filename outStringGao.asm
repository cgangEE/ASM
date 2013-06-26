.model small
	.stack
	.data
		msg byte "gao"
		msglen word sizeof msg
	.code
start:
	mov ax,@data
	mov ds,ax
	
	mov cx, 5
	mov bx, 0
	g:
		inc bx
	loop g
	call printNum
	call gaoS
	
	mov ax,4c00h
	int 21h
		
	gaoS proc
		mov cx, msglen
		mov bx, offset msg
		gg:
			push cx
			call gao
			pop cx
			inc bx
			
		loop gg
		ret
	gaoS endp
	
	gao proc
		mov ah, 2
		mov dl, [bx]
		
		int 21h	
		ret
	gao endp
	
	printNum proc
		mov ah, 2
		add bl, '0'
		mov dl, bl
		int 21h
		ret
	printNum endp
	
public start
end start
