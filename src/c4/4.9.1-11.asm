; practice 4.9.1-11

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
dVal DWORD ?
.code
main PROC
	mov dVal, 12345678h
	mov ax, WORD PTR dVal + 2
	add ax, 3
	mov WORD PTR dVal, ax
	mov eax, dVal
	invoke ExitProcess, 0d
main ENDP
END main