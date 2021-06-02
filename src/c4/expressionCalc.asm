; practice 4.9.2-9

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
val2 WORD 04h
val4 WORD 07h
.code
main PROC
	mov bx, 02h
	add bx, val2
	mov ax, bx
	sub ax, val4
	invoke ExitProcess, 0d
main ENDP
END main