INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
buffer BYTE 1001 DUP(?)
tip BYTE "please input a bin-string:", 0
.code
main PROC
	mov edx, offset tip
	call WriteString
	mov ecx, sizeof buffer
	mov edx, offset buffer
	call ReadString
	mov edx, eax
	sub edx, 1
	mov esi, offset buffer
	call reverseString
	mov ecx, eax
	call parseToValue
	call WriteDec
	invoke ExitProcess, 0d
main ENDP

; calculate any digit
; params:
; esi: offset of the string
; ebx: index of the string
; returns:
; edx: value of the current digit
curDigit PROC USES ecx
	pushfd
	movzx edx, BYTE PTR [esi + ebx]
	sub edx, "0"
	mov ecx, ebx
lp:
	cmp ebx, 0
	jz end_lp
	shl edx, 1
	loop lp
end_lp:
	popfd
	ret
curDigit ENDP

; calculate total value
; params:
; esi: offset of the string
; ecx: length of the string(changed)
; returns:
; eax: total value
parseToValue PROC USES ebx
	mov eax, 0
	mov ebx, 0
lp:
	call curDigit
	add eax, edx
	inc ebx	
	loop lp
	ret
parseToValue ENDP

; calculate the half index of the array
; params:
; edx: the length of the array
; returns:
; ecx: the limit
limit PROC
	mov ecx, edx
	shr ecx, 1
	inc ecx
	ret
limit ENDP

; reverse the string
; params:
; esi: offset of the string
; edx: the length of the array
; returns:
; None
reverseString PROC USES ebx eax edi
	mov ebx, 0
	call limit
lp:
	push edx
	sub edx, ebx
	movzx eax, BYTE PTR [esi + edx]
	pop edx
	mov edi, eax
	movzx eax, BYTE PTR [esi + ebx]
	push edx
	sub edx, ebx
	mov [esi + edx], al
	pop edx
	mov eax, edi
	mov [esi + ebx], al
	inc ebx
	loop lp
	ret
reverseString ENDP
END main