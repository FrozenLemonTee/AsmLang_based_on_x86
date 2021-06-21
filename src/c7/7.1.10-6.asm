; practice 7.1.10-6
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
tip_ipt BYTE "please input a number: ", 0
tip_pf BYTE "PF = ", 0
.code
main PROC
	mov edx, offset tip_ipt
	call WriteString
	call ReadInt
	mov ecx, 32
	mov edx, 0
lp:
	shr eax, 1
	jnc end_if
	cmp edx, 0
	jz is_even
is_odd:
	mov edx, 0
	or edx, 0
	jmp end_if
is_even:
	mov edx, 1
	or edx, 1
end_if:
	loop lp
	push edx
	mov edx, offset tip_pf
	call WriteString
	pop edx
	xor edx, 1
	mov eax, edx
	call WriteDec
	invoke ExitProcess, 0d
main ENDP
END main