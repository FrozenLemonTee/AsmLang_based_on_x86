; practice 8.10.2-10
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
dumpMemory PROTO, address: DWORD, len: DWORD, usize: DWORD
.data
arr DWORD 10h, 20h, 30h, 50h, 40h, 90h, 80h, 70h, 0A0h, 0C0h
.code
main PROC
	invoke dumpMemory, offset arr, lengthof arr, type arr
	invoke ExitProcess, 0d
main ENDP

dumpMemory PROC USES esi ecx ebx, address: DWORD, len: DWORD, usize: DWORD
	mov esi, address
	mov ecx, len
	mov ebx, usize
	call DumpMem
	ret
dumpMemory ENDP
END main