; practice 9.10-3
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
str_remove PROTO, ofst: DWORD, start: DWORD, num: DWORD, len: DWORD
.data
sstr BYTE "abcxxxxdefghijklmop", 0
.code
main PROC
	invoke str_remove, addr sstr, 3, 4, lengthof sstr
	call WriteString
	invoke ExitProcess, 0d
main ENDP

str_remove PROC, ofst: DWORD, start: DWORD, num: DWORD, len: DWORD
	mov esi, ofst
	mov ebx, start
	mov edi, num
	mov ecx, len
	call _str_remove
	ret
str_remove ENDP

; remove some chars from the string
; params:
; esi: the offset of the string
; ebx: the start index of the chars to be removed
; edi: the number of the chars to be removed
; ecx: the length of the string
; returns:
; edx: the offset of the new string
_str_remove PROC
	mov edx, esi
	sub ecx, ebx
	sub ecx, edi
	add esi, ebx
	add edi, ebx
	add edi, edx
	cld
	xchg esi, edi
lp:
	lodsb
	stosb
	loop lp
end_lp:
	ret
_str_remove ENDP
END main