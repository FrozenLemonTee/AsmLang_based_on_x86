; practice 6.4.3-4
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
array SWORD 3,-6,1,10,10,30,-40,4
tip_not_found BYTE "can not find negative number!", 0
tip_found BYTE "the first negative number is: ", 0
.code
main PROC
	mov esi, offset array
	mov ecx, lengthof array
l1: 
	test WORD PTR [esi], 8000h
	; mov eax, 0 ; test
	; movsx eax, WORD PTR [esi] ; test
	pushfd	
	; call WriteInt ; test
	add esi, type array
	popfd
	loopz l1
	jz quit1
	sub esi, type array
	jnz quit2
quit2:
	mov edx, offset tip_found
	movsx eax, WORD PTR [esi]
	call WriteString
	call WriteInt
	invoke ExitProcess, 0d	
quit1:
	mov edx, offset tip_not_found
	call WriteString
	invoke ExitProcess, 0d
main ENDP
END main