; practice 8.11-8
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
countMatches PROTO, ofst1: SDWORD, ofst2: SDWORD, len1: SDWORD, len2: SDWORD
.data
arr1 SDWORD 1, 2, 6, -3, 9, 8, 2, 0
arr2 SDWORD 1, -2, 4, 0, 0, 8, 2, 0, 1
.code
main PROC
	invoke countMatches, offset arr1, offset arr2, lengthof arr1, lengthof arr2
	call WriteDec
	invoke ExitProcess, 0d
main ENDP

; count matches item
; params:
; esi: array 1 offset
; edi: array 2 offset
; ecx: min length in 2 arrays
; returns:
; eax: the number of the same items
cntMatches PROC
	mov eax, 0
lp:
	repnz cmpsd
	inc eax
	jcxz end_lp
	jmp lp
end_lp:
	ret
cntMatches ENDP

countMatches PROC USES edx, ofst1: SDWORD, ofst2: SDWORD, len1: SDWORD, len2: SDWORD
	mov ecx, len1
	mov edx, len2
	cmp ecx, edx
	jl end_if
	xchg ecx, edx
end_if:
	mov esi, ofst1
	mov edi, ofst2
	call cntMatches
	ret
countMatches ENDP
END main