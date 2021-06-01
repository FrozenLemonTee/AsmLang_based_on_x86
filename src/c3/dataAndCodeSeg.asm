; practice 3.9.2-2

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
val1 DWORD 10
.data
val2 DWORD 11
.code
main PROC
	.data
	val3 DWORD 12
	.code
	mov eax, 0
	add eax, val1
	add eax, val2
	add eax, val3
	invoke ExitProcess, 0d
main ENDP
END main