; practice 4.10-8
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
arr DWORD 10h,20h,30h,40h,50h
.code
main PROC
	len EQU lengthof arr - 1
	each EQU type arr
	mov ecx, len
	mov esi, 0
	mov edi, esi
	mov eax, arr[0]
	lp:
		inc edi
		mov edx, arr[edi * each]
		mov arr[edi * each], eax
		mov esi, edi
		mov eax, edx
		loop lp
	mov	arr[0], eax
	invoke ExitProcess, 0d
main ENDP
END main