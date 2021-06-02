; practice 4.9.2-8

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
arr DWORD 3h,7h,2h,8h,0FF30h,1h
.code
main PROC
	mov ecx, lengthof arr
	mov eax, 0
	mov ebx, 0
	lp:
		add eax, arr[ebx]
		add ebx, type arr
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main