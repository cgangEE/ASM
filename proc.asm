.model small
.686
.stack
.data
PUBLIC printNum
.code
array byte 40 DUP(?)

printNum PROC
	mov eax, [esp+4]
	lea edi, array
	whileloop: 
		cmp eax, 0
		jz endloop
		mov edx, 0

		mov ebx, 10
		div ebx

		mov [edi], dl
		inc edi

		jmp whileloop;
	endloop:
	
	mov ecx, edi
	sub ecx, offset array
	
	forloop:
		dec edi
		mov ah, 2
		mov dl, [edi]
		add dl, '0'
		int 21h
	loop forloop
	
	ret
printNum ENDP

end