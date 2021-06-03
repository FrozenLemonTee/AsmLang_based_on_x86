; practice 5.8.2-4
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
arr DWORD ?, 50, 60, 70, 80, 90, 100

.code
main PROC
	len EQU lengthof arr - 1
	parr EQU offset arr
	each EQU type DWORD
	mov edx, parr
	add edx, each
	mov ecx, len
	call left
	mov ecx, len
	call printArray
	invoke ExitProcess, 0d
main ENDP

; move all items in the array one position to the left
; params:
; edx: the first address of the array
; ecx: the number of the items in the array
; returns:
; edx: the first address of the array after moving
left PROC USES esi edi eax
	each EQU type DWORD
	sub edx, each
	mov edi, edx
	mov esi, edx
	add esi, each
	lp1:
		mov eax, [esi]
		mov [edi], eax
		add esi, each
		add edi, each
		loop lp1 
	ret
left ENDP

; print all items in the array
; params:
; edx: the first address of the array
; ecx: the number of the items in the array
; returns:
; None
printArray PROC USES eax
	spaceKey EQU 32
	each EQU type DWORD
	lp2:
		mov eax, [edx]
		add edx, each
		call WriteDec
		mov eax, spaceKey
		call WriteChar
		loop lp2
	ret
printArray ENDP
END main