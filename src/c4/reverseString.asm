; practice 4.10-7
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
source BYTE "This is the source string", 0
target BYTE sizeof source DUP("#")
tmp BYTE 0
.code
main PROC
	len EQU lengthof source - 2
	mov al, 0
	mov ebx, 0
	mov target[len + 1], al
	mov ecx, len
	lp:
		mov tmp, bl
		mov edi, len
		sub edi, ebx
		mov al, source[ebx]
		mov target[edi], al
		inc bl
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main