; practice 8.11-1
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
findLargest PROTO, address: SDWORD, len: SDWORD
.data
arr SDWORD -34h, 25h, 4h, -9h, 8h
.code
main PROC
	invoke findLargest, addr arr, lengthof arr
	call WriteHex
	invoke ExitProcess, 0d
main ENDP

findLargest PROC, address: SDWORD, len: SDWORD
	mov esi, address
	mov ecx, len
	call largestArrItem
	ret
findLargest ENDP

; find the largest item in the array
; params:
; esi: the offset of the array
; ecx: the length of the array
; returns:
; eax: the largest one
largestArrItem PROC USES ebx
	mov eax, 0
	cmp ecx, 0
	je return
lp:
	mov ebx, SDWORD PTR [esi]
	cmp ebx, eax
	jng skip
	mov eax, ebx
skip:
	add esi, type DWORD
	loop lp
return:
	ret
largestArrItem ENDP
END main