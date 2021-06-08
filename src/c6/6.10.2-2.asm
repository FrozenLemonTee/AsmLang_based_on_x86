; practice 6.10.2-2
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
num DWORD 36
tip1 BYTE " is odd number", 0
tip2 BYTE " is even number", 0
.code
main PROC
	mov eax, num
	call isOdd
	push eax
	mov eax, num
	call WriteDec
	pop eax
	cmp eax, 0
	ja case1
	jmp case2
case1:
	mov edx, offset tip1
	jmp end_if
case2:
	mov edx, offset tip2
end_if:
	call WriteString
	invoke ExitProcess, 0d
main ENDP

; Judge the number whether it is odd or not
; params:
; eax: the number
; returns:
; eax: boolean type:
; 1: true(odd) 0: false(even)
isOdd PROC
	and eax, 1h
	ret
isOdd ENDP
END main