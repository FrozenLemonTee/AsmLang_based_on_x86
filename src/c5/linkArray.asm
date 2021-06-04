; practice 5.9-2
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
index DWORD 0
chars BYTE 'HACEBDFG'
links DWORD 1,4,5,6,2,3,7,0 
target_before BYTE 1000 DUP(?)
target_after BYTE 1000 DUP(?) ; todo
.code
main PROC
	len EQU lengthof chars
	lea esi, chars
	lea edi, target_before
	lea ebx, links
	mov ecx, len
	call copyArray
	lea edx, target_before
	call WriteString
	invoke ExitProcess, 0d
main ENDP

; copy the array in linked order
; params:
; esi: the first address of the source array
; edi: the first address of the target array
; ebx: the first address of the index array
; ecx: the length of the source array
; returns:
; None
copyArray PROC USES edx eax
	lp:
		mov eax, index
		mov edx, type DWORD
		mul edx
		mov edx, eax
		add edx, ebx
		mov eax, [edx]
		mov edx, esi
		add edx, eax
		mov al, [edx]
		mov edx, edi
		add edx, index
		mov [edx], al
		mov edx, index
		inc edx
		mov index, edx
		loop lp
	ret
copyArray ENDP

END main