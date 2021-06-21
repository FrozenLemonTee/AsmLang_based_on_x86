INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
tip1 BYTE "A = ", 0
tip2 BYTE "B = ", 0
tip3 BYTE "A * B = ", 0
.code
main PROC
	mov edx, offset tip1
	call WriteString
	call ReadInt
	mov edx, offset tip2
	call WriteString
	push eax
	call ReadInt
	mov ebx, eax
	pop eax
	call sum
	mov edx, offset tip3
	call WriteString
	mov eax, edi
	call WriteDec	
	invoke ExitProcess, 0d
main ENDP

; shift a number by serveral bits
; params:
; edx: number of shift bits
; ebx: shifted number
; retruns: 
; esi: shifted number
multi PROC USES ecx
	mov ecx, edx
	mov esi, ebx
lp:
	cmp edx, 0
	jz lp_end
	shl esi, 1
	loop lp
lp_end:
	ret
multi ENDP

; add summary
; params:
; eax: A
; ebx: B
; returns:
; edi: A * B
sum PROC USES ecx edx
	mov ecx, 32
	mov edx, 0
	mov edi, 0
lp:
	shr eax, 1
	jnc end_if
	call multi
	add edi, esi
end_if:
	inc edx
	loop lp
	ret
sum ENDP
END main