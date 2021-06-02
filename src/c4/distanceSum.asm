; practice 4.10-3
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
res DWORD ?
arr DWORD 0, 1, 3, 6, 10, 15, 21, 28, 36, 45
.code
main PROC
	len EQU lengthof arr - 1
	mov ecx, len
	mov eax, 0
	lp:
		mov ebx, ecx
		neg ebx
		add ebx, len
		mov edx, arr[ebx * type arr]
		neg edx
		add ebx, 1
		add edx, arr[ebx * type arr]
		add eax, edx
		loop lp
	mov res, eax
	invoke ExitProcess, 0d
main ENDP
END main