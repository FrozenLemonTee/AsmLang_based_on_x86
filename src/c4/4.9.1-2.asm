; practice 4.9.1-2

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data


.code
main PROC
	mov eax, 1002FFFFh
	inc ax ; eax = 10020000h
	invoke ExitProcess, 0d
main ENDP
END main