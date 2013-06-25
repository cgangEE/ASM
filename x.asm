.model small
	.stack
	.data
	
	.code
start:
	mov ax,@data
	mov ds,ax
	
	call gao
	
	mov ax,4c00h
	int 21h
		

	gao proc
		mov ah, 2
		mov dl, 'c'
		int 21h	
		ret
	gao endp
	public start
	end start
