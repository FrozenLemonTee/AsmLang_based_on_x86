; practice 4.10-2
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
arr DWORD 0h, 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h, 9h
.code
main PROC
	mov ecx, lengthof arr / 2
	mov ebx, 0
	lp:
		mov eax, arr[ebx]
		mov edx, arr[ebx + type arr]
		xchg eax, edx
		mov arr[ebx], eax
		mov arr[ebx + type arr], edx
		add ebx, type arr * 2
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main