; practice 7.2.5-4
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
time_s BYTE "110010010011010", 0
time_v WORD 16 DUP(?)
bMinutes BYTE ?
.code
main PROC
	mov esi, offset time_s
	call parseValue
	and edx, 0000011111100000b
	shr edx, 5
	mov time_v, dx
	invoke ExitProcess, 0d
main ENDP

; string --> int
; params:
; esi: offset of the string
; returns:
; edx: value
parseValue PROC USES ebx ecx eax
	mov ecx, 14
	mov ebx, 1
	mov edx, 0
lp:
	cmp ecx, 0
	jz end_loop
	movzx eax, BYTE PTR [esi + ecx]
	sub eax, "0"
	cmp eax, 0
	jz end_if
	add edx, ebx
end_if:
	shl ebx, 1
	loop lp
end_loop:
	ret
parseValue ENDP
END main