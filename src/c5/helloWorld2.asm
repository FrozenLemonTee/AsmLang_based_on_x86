; print 'hello world!' in cmd
; pointer access address
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
sstr BYTE "hello world!", 0
.code

main PROC
	len EQU lengthof sstr - 1
	mov ecx, len
	lea edx, sstr
	lp:
		mov eax, [edx]
		call WriteChar
		inc edx
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main