; practice 4.10-4
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
src WORD 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
tar DWORD 10 DUP(?)
.code
main PROC
	len EQU lengthof src
	d_src EQU type src
	t_src EQU type tar
	mov ecx, len
	mov ebx, 0
	lp:
		movzx eax, src[ebx * d_src]
		mov tar[ebx * t_src], eax
		inc ebx
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main