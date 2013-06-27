.model small
.686
.stack
.data
EXTERN printNum: far16
.code
start:
	mov eax, 'A'
	
	push eax
	call printNum
	add esp, 4
	
	mov eax, 4c00h
	int 21h
public start
end start