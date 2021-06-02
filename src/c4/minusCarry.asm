; practice 4.9.2-6

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov al, 07h
	sub al, 08h
	invoke ExitProcess, 0d
main ENDP
END main