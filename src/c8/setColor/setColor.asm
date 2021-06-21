INCLUDE Irvine32.inc
.386
.model flat, stdcall

DEFAULT EQU WHITE, BLACK
.code
TextColor PROC USES eax, front: BYTE, back: BYTE
	movzx eax, back
	shl eax, 4
	add al, front
	call setTextColor
	ret
TextColor ENDP

WriteColorChar PROC USES eax, char: BYTE, front: BYTE, back: BYTE
	invoke TextColor, front, back
	movzx eax, char
	call WriteChar
	invoke TextColor, DEFAULT
	ret
WriteColorChar ENDP

WriteColorStr PROC USES edx, pStr: DWORD, front: BYTE, back: BYTE
	invoke TextColor, front, back
	mov edx, pStr
	call WriteString
	invoke TextColor, DEFAULT
	ret
WriteColorStr ENDP
END