; practice 3.10-1

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
myVar1 DWORD 24
myVar2 DWORD 47
myVar3 DWORD 8
myVar4 DWORD 61
res DWORD 0

.code
main PROC
	mov eax, 0
	mov eax, myVar1
	mov ebx, myVar2
	mov ecx, myVar3
	mov edx, myVar4
	add eax, ebx
	sub eax, ecx
	add eax, edx
	mov res, eax
	INVOKE ExitProcess, 0d
main ENDP
END main