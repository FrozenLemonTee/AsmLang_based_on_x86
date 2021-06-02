; practice 4.9.2-2

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov ax, 1h
	mov bx, 2h
	mov cx, 3h
	mov dx, 4h
	xchg ax, bx
	xchg bx, cx
	xchg cx, dx
	invoke ExitProcess, 0d
main ENDP
END main