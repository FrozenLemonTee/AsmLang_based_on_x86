; practice 6.11.2-1
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
arr SDWORD 1000 DUP(?)
tip1 BYTE "length = ", 0
tip2 BYTE "low limit = ", 0
tip3 BYTE "high limit = ", 0
.code
main PROC
	mov edx, offset tip2
	call WriteString
	call ReadInt
	push eax
	mov edx, offset tip3
	call WriteString
	call ReadInt
	push eax
	mov edx, offset tip1
	call WriteString
	call ReadInt
	mov ecx, eax
	pop ebx
	pop eax
	mov esi, offset arr
	mov edx, type arr
	call fill
	invoke ExitProcess, 0d
main ENDP

; fill the array
; params:
; ecx: length of the array
; esi: the offset of the array
; eax: the low limit(J)
; ebx: the high limit(K)
; edx: the type of the array
; returns:
; None
fill PROC
	call exchange
lp:
	push eax
	push ebx
	call randomJToK
	mov [esi], eax
	call Crlf
	call WriteInt
	add esi, edx
	pop ebx
	pop eax
	loop lp
fill ENDP

; make sure K is larger than J, if not, exchange then
; params:
; eax: J
; ebx: K
; returns:
; eax: J
; ebx: K
exchange PROC
	pushfd
	cmp eax, ebx
	jl end_if
	xchg eax, ebx
end_if:
	popfd
	ret
exchange ENDP

; randomly returns a number in range [J,K)
; params:
; eax: J
; ebx: K
; returns:
; eax
randomJToK PROC
	sub ebx, eax
	xchg eax, ebx
	call RandomRange
	add eax, ebx
	ret
randomJToK ENDP
END main