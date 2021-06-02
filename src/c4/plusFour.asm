; practice 4.9.2-7

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
val1 DWORD 03h
val2 DWORD 0Ch
val3 DWORD 029h
.code
main PROC
	mov eax, 0
	sub eax, val2
	add eax, 7h
	sub eax, val3
	add eax, val1
	invoke ExitProcess, 0d
main ENDP
END main