; practice 5.8.2-1
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov eax, 10
	mov ebx, 20
	push eax
	push ebx
	pop eax
	pop ebx
	invoke ExitProcess, 0d
main ENDP
END main