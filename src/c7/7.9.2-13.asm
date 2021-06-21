; practice 7.9.2-13
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data

.code
main PROC
	mov eax, 0
	mov al, 25h
	call showDecimal8
	invoke ExitProcess, 0d
main ENDP

; convert an 8 bit unsigned binary number to ASCII number
; params:
; al: 8 bit unsigned binary number
; returns:
; None
showDecimal8 PROC
	ror ax, 4
	or ax, 30h
	call WriteChar
	rol ax, 4
	or al, 30h
	and al, 3Fh
	call WriteChar
	ret
showDecimal8 ENDP
END main