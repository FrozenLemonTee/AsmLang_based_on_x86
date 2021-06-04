; practice 5.8.2-5
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
arr DWORD ?, 50, 60, 70, 80, 90, 100

.code
main PROC
	call subp
	invoke ExitProcess, 0d
main ENDP

subp PROC USES eax
	flag1:
		mov eax, offset flag1 - 1
		call WriteHex
	ret
subp ENDP
END main