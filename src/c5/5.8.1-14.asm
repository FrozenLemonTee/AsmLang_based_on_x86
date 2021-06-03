; practice 5.8.1-14
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
arr WORD 0, 3, 5, 8, 11
sum WORD 0
.code
; calculate the summary of the whole array
; params:
; esi: offest address of the array
; cx: number of the array
; returns:
; ax: summary
arraySum PROC
	mov ax, 0
	lp:
		add ax, [esi]
		add esi, type WORD
		loop lp
	ret
arraySum ENDP

main PROC
	len EQU lengthof arr
	mov ecx, len
	mov esi, offset arr
	call arraySum
	mov sum, ax
	movzx eax, sum
	call WriteDec
	invoke ExitProcess, 0d
main ENDP
END main