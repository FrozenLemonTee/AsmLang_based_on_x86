; practice 4.5.6-9

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.code
main PROC
	mov eax, 0
	mov ecx, 10
L1:
	mov eax, 3
	mov ecx, 5
L2:
	add eax, 5
	loop l2
	loop l1
	invoke ExitProcess, 0d
main ENDP
END main