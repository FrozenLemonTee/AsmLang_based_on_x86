; practice 8.10.2-1
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data

.code
main PROC
	push 10h
	push 20h
	push 30h
	call addThree
	call WriteInt
	invoke ExitProcess, 0d
main ENDP

addThree PROC
	dsize EQU type DWORD
	base EQU dsize * 2
	addNum1 EQU DWORD PTR [ebp + base + dsize * 2]
	addNum2 EQU DWORD PTR [ebp + base + dsize * 1]
	addNum3 EQU DWORD PTR [ebp + base]
	push ebp
	mov ebp, esp
	mov eax, 0
	add eax, addNum1
	add eax, addNum2
	add eax, addNum3
	mov esp, ebp
	pop ebp
	ret 3 * dsize
addThree ENDP
END main