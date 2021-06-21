; practice 6.11.2-2
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
arr SDWORD -7,6,4,8,12,1,-11
.code
main PROC
	mov esi, 0
	mov edi, 5
	mov edx, offset arr
	mov ecx, lengthof arr
	mov ebx, type arr
	call partSum
	call WriteInt
	invoke ExitProcess, 0d
main ENDP

; return part summary of the array
; params:
; esi: start index
; edi: end index
; edx: the offset of the array
; ecx: the length of the array
; ebx: the type of the array
; returns:
; eax: the part summary
partSum PROC
	pushfd
	mov eax, 0
lp:
	cmp esi, edi
	jg end_loop
	add eax, [edx]
	add edx, ebx
	inc esi
	loop lp
end_loop:
	popfd
	ret
partSum ENDP
END main