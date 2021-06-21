; practice 6.11.2-9
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
buffer BYTE 1001 DUP(?)
low_limit DWORD 5, 2, 4, 1, 3
high_limit DWORD 9, 5, 8, 4, 6
tip1 BYTE "Valid", 0
tip2 BYTE "Invalid", 0
tip_ipt BYTE "please input your PIN number:", 0
.code
main PROC
	mov edx, offset tip_ipt
	call WriteString
	mov edx, offset buffer
	mov ecx, lengthof buffer
	call ReadString
	mov esi, offset buffer
	call verifyPIN
	cmp eax, TRUE
	jnz false_case
	mov edx, offset tip1
	jmp end_if
false_case:
	mov edx, offset tip2
end_if:
	call WriteString
	invoke ExitProcess, 0d
main ENDP

; verify the PIN number
; params:
; eax: the length of the PIN number (5 is valid)
; esi: the offset of the buffer
; returns:
; eax: is PIN number valid? 0(false): invalid 1(true): valid
verifyPIN PROC USES edi
	cmp eax, 5
	jnz false_case
	mov ecx, 5
	mov edi, 0
lp:
	call verifyLimit
	cmp edx, TRUE
	jnz false_case
	inc edi
	loop lp
	mov eax, TRUE
	jmp end_if
false_case:
	mov eax, FALSE
end_if:
	ret
verifyPIN ENDP

; get the limit value of any digit
; params:
; ebx: is high_limit? 0(false):low_limit 1(true):high_limit
; edi: index of the digit
; returns:
; eax: the value of the limit
getLimit PROC USES esi
	cmp ebx, TRUE
	jz case2
	mov esi, offset low_limit
	jmp end_if
case2:
	mov esi, offset high_limit
end_if:
	mov eax, [esi + edi * type DWORD]
	ret
getLimit ENDP

; verify the digit of the PIN number
; params:
; esi: the offset of the buffer
; edi: index of the digit
; eax: the value of the limit
; returns:
; edx: is valid digit? 0(false): invalid 1(true): valid
verifyLimit PROC USES ebx
	mov ebx, FALSE
	call getLimit
	call getDigit
	cmp eax, edx
	ja false_case
	mov ebx, TRUE
	call getLimit
	cmp edx, eax
	ja false_case
	mov edx, TRUE
	jmp end_if
false_case:
	mov edx, FALSE
end_if:
	ret
verifyLimit ENDP

; get a PIN number digit
; params:
; esi: the offset of the buffer
; edi: index of the digit
; returns:
; edx: the value
getDigit PROC
	movzx edx, BYTE PTR [esi + edi]
	sub edx, "0"
	ret
getDigit ENDP
END main