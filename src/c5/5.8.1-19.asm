; practice 5.8.1-19
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov edx, 0
	mov eax, 40
	push eax
	call Ex5Sub
	call WriteDec
	invoke ExitProcess, 0d
main ENDP

Ex5Sub PROC
	pop eax
	pop edx ; wrong step
	push eax
	ret
Ex5Sub ENDP
END main