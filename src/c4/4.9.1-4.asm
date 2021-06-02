; practice 4.9.1-4

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov eax, 1002FFFFh
	neg ax ; eax = 10020001h
	invoke ExitProcess, 0d
main ENDP
END main