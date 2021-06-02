; practice 4.9.2-4

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
tmp BYTE 0FFh

.code
main PROC
	mov al, 080h
	add tmp, al
	invoke ExitProcess, 0d
main ENDP
END main