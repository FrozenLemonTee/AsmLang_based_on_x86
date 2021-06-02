; practice 4.9.2-5

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov al, 1h
	add al, 0FEh ; set zero-flag to zero first
	add al, 1h
	invoke ExitProcess, 0d
main ENDP
END main