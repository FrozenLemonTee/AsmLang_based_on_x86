; practice 8.10.2-11
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
multArr PROTO, address: DWORD, len: DWORD, usize: DWORD
.data
arr DWORD 14h, 21h, 36h, 40h, 9h, 10h, 12h, 20h, 26h, 4h
.code
main PROC
	invoke multArr, offset arr, lengthof arr, type arr
	call WriteHex64
	invoke ExitProcess, 0d
main ENDP

; mult the each item in the array
; params:
; esi: the first address of the array
; ecx: the number of the items in the array
; ebx: the size of one item in the array
; returns:
; edx:eax : the result
multArray64 PROC USES edi
	local tmp: DWORD
	cmp ecx, 0
	jz err
	mov eax, [esi]
	cmp eax, 0
	jz err
	sub ecx, 1
	mov edx, 0
	mov edi, ebx
lp:
	push eax
	mov eax, [esi + edi]
	cmp eax, 0
	jz err
	pop eax
	imul edx, DWORD PTR [esi + edi]
	push edx
	mul DWORD PTR [esi + edi]
	pop tmp
	add edx, tmp
	add edi, ebx
	loop lp
	jmp normal
err:
	mov eax, 0
normal:
	ret
multArray64 ENDP

multArr PROC USES esi ecx ebx, address: DWORD, len: DWORD, usize: DWORD
	mov esi, address
	mov ecx, len
	mov ebx, usize
	call multArray64
	ret
multArr ENDP

; show the 64 bits number
; params:
; edx: high 32 bits
; eax: low 32 bits
; returns:
; None
writeHex64 PROC
	push eax
	mov eax, "0"
	call WriteChar
	mov eax, "x"
	call WriteChar
	mov eax, edx
	call WriteHex
	pop eax
	call WriteHex
	ret
writeHex64 ENDP
END main