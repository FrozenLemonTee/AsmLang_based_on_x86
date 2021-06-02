; practice 4.9.1-5

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov eax, 0
	mov al, 1
	add al, 3 ; PF = 0
	invoke ExitProcess, 0d
main ENDP
END main