.model small
.686
.stack
.data
EXTERN printNum: far
.code
start:
	call printNum 
	mov eax, 4c00h
	int 21h
public start
end start