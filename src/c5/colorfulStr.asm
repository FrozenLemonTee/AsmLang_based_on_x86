; practice 5.9-1
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
len DWORD ?
sstr BYTE 1000 DUP(?)
.code
main PROC
	slen EQU 26
	mov ecx, slen
	call randomUpperStr
	mov ecx, slen
	call colourfulStr
	invoke ExitProcess, 0d
main ENDP

; print a string, each letter has random color
; params:
; edx: the first address of the string
; ecx: length of the required string
; returns:
; None
colourfulStr PROC
	limit EQU 16
	lp2:
		mov eax, limit
		call RandomRange
		call SetTextColor
		mov eax, [edx]
		call WriteChar
		inc edx
		loop lp2
	ret
colourfulStr ENDP

; generates a random string of the specified length
; params:
; ecx: length of the required string
; returns:
; edx: the first address of the string

randomUpperStr PROC USES esi eax
	mov len, ecx
	mov edx, offset sstr
	mov esi, edx
	lp1:
		call randomUpperAlpha
		mov [esi], eax
		inc esi
		loop lp1
	ret
randomUpperStr ENDP

; randomly generates a uppercase letter
; params:
; None
; returns:
; eax: ASCII of the letter
randomUpperAlpha PROC
	mov eax, 26
	call RandomRange
	add eax, 65
	ret
randomUpperAlpha ENDP
END main