; practice 5.8.1-18
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov eax, 40
	push offset here
	jmp Ex4Sub
	here:
		mov eax, 30
	call WriteDec
	invoke ExitProcess, 0d
main ENDP

Ex4Sub PROC
	ret
Ex4Sub ENDP
END main