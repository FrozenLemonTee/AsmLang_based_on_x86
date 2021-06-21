; practice 6.11.2-3
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
tip1 BYTE "please input a number: ", 0
tip2 BYTE "rank: ", 0
.code
main PROC
	mov edx, offset tip1
	call WriteString
	call ReadInt
	call rank
	mov edx, offset tip2
	call WriteString
	call WriteChar
	invoke ExitProcess, 0d
main ENDP

; return the rank of the score
; params:
; eax: the score
; returns:
; eax: the letter of the rank
rank PROC
	_A EQU 65
	_B EQU 66
    _C EQU 67
	_D EQU 68
	_F EQU 70
judge1:
	cmp eax, 59
	jna case1
	cmp eax, 69
	jna case2
	cmp eax, 79
	jna case3
	cmp eax, 89
	jna case4
	jmp case5
case1:
	mov eax, _F
	jmp end_if
case2:
	mov eax, _D
	jmp end_if
case3:
	mov eax, _C
	jmp end_if
case4:
	mov eax, _B
	jmp end_if
case5:
	mov eax, _A
end_if:
	ret
rank ENDP
END main