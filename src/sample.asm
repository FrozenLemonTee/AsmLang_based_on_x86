; practice x.x.x-x
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data

.code
main PROC

	invoke ExitProcess, 0d
main ENDP

demo PROC
	ret
demo ENDP
END main