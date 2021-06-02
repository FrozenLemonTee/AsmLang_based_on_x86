; practice 4.9.1-1

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
one WORD 8002h
two WORD 4321h

.code
main PROC
	mov edx, 21348041h
	movsx edx, one ; edx = FFFF8002h
	movsx edx, two ; edx = 00004321h
	invoke ExitProcess, 0d
main ENDP
END main