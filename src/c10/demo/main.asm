INCLUDE Irvine32.inc
INCLUDE demo.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data

.code
main PROC
	demo <,kkk>, <kkk,>
	call WriteString
	invoke ExitProcess, 0d
main ENDP

END main