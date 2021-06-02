; practice 4.9.2-1

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
three DWORD 12345678h
tmp WORD ?
.code
main PROC
	mov ax, WORD PTR (three + 2)
	mov tmp, ax
	mov ax, WORD PTR three
	mov WORD PTR (three + 2), ax
	mov ax, tmp
	mov WORD PTR three, ax
	invoke ExitProcess, 0d
main ENDP
END main