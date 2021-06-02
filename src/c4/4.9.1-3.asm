; practice 4.9.1-3

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov eax, 30020000h
	dec ax ; eax = 3002FFFh
	invoke ExitProcess, 0d
main ENDP
END main