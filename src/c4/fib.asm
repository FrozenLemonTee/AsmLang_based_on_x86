; practice 4.10-5
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
fib DWORD 1, 1, 5 DUP(?)
cnt DWORD 5
index DWORD 2

.code
main PROC
	delta EQU type cnt
	mov ecx, cnt
	mov eax, 1
	mov ebx, 1
	lp:
		mov cnt, ecx
		mov ecx, index
		mov edx, eax
		add edx, ebx
		mov fib[ecx * delta], edx
		mov eax, ebx		
		mov ebx, edx
		inc ecx
		mov index, ecx
		mov ecx, cnt
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main