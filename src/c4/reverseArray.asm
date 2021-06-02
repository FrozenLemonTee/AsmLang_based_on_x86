; practice 4.10-6
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
arr DWORD 1,2,3,4,5,6,7,8,9,10
tmp DWORD ?
.code
main PROC
	len EQU lengthof arr - 1
	limit EQU len / 2 + 1
	delta EQU type arr
	mov ebx, 0
	mov ecx, limit
	lp:
		mov edx, len
		sub edx, ebx
		mov eax, arr[delta * ebx]
		mov tmp, eax
		mov eax, arr[delta * edx]
		mov arr[delta * ebx], eax
		mov eax, tmp
		mov arr[delta * edx], eax
		inc ebx
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main