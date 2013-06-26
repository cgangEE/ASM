.model small
.686
.stack
.data
PUBLIC printNum
.code
printNum PROC
	mov ah, 2
	mov dl, 'c'
	int 21h
	ret
printNum ENDP

end 