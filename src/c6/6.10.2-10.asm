; practice 6.10.2-10
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
tip1 BYTE "please type a number:", 0
tip2 BYTE "N = ", 0
A SDWORD -7
B SDWORD 10
.code
main PROC
	mov edx, offset tip1
	call WriteString
	call ReadInt
while_start:
	cmp eax, 0
	jng while_end
	cmp eax, 3
	jz case2
judge1:
	cmp eax, A
	jl case1
judge2:
	cmp eax, B
	jg case1
	jmp case2
case1:
	sub eax, 2
	jmp end_if
case2:
	sub eax, 1	
end_if:
	jmp while_start
while_end:
	mov edx, offset tip2
	call WriteString
	call WriteInt
	invoke ExitProcess, 0d
main ENDP
END main