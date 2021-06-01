; practice 4.5.6-10

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
loop_cnt DWORD ?

.code
main PROC
	mov eax, 0
	mov ecx, 10
L1:
	add eax, 3
	mov loop_cnt, ecx
	mov ecx, 5
L2:
	add eax, 5
	loop l2
	mov ecx, loop_cnt
	loop l1
	invoke ExitProcess, 0d
main ENDP
END main