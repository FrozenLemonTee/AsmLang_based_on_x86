; practice 5.8.2-3
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	call demo
	invoke ExitProcess, 0d
main ENDP

demo PROC
;something wrong
	.data
	val1 DWORD ?
	val2 DWORD ?
	.code
	mov eax, 1000h
	mov edx, 2000h
	mov val1, eax
	mov val2, edx
	call WriteHex
	mov eax, 32
	call WriteChar
	mov eax, edx
	call WriteHex
	ret
demo ENDP

END main