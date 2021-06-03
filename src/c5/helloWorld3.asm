; print 'hello world!' in cmd
; pointer access address, implemented with subprocess
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
sstr BYTE "hello world!", 0
.code

; print a string in cmd
; params:
; edx: the first address of the printed string
; ebx: the length of the string
; returns:
; None
printStr PROC USES eax ecx
	mov ecx, ebx
	lp:
		mov eax, [edx]
		call WriteChar
		inc edx
		loop lp
	ret
printStr ENDP

main PROC
	lea edx, sstr
	len EQU lengthof sstr - 1
	mov ebx, len
	call printStr
	invoke ExitProcess, 0d
main ENDP

END main