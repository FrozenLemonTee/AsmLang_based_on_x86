INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
result BYTE 4096 DUP(?)
tmpT BYTE "hello ~, your score is ~", 0
tmpP BYTE "Gabio,61", 0
pt DWORD 0
pp DWORD 0
.code
main PROC
	mov edi, 0
lp1:
	mov esi, pt
	movzx eax, BYTE PTR [esi + offset tmpT]
	cmp eax, 0
	jnz end_if1
		jz end_lp1
	end_if1:
	cmp eax, "~"
	jnz end_if2
		inc esi
		mov pt, esi
		lp2:
			mov esi, pp
			movzx eax, BYTE PTR [esi + offset tmpP]
			cmp eax, 0
			jz lp1
			cmp eax, ","
			jnz case2
				inc esi
				mov pp, esi
				jmp lp1
			case2:
				mov BYTE PTR [edi + offset result], al
				inc edi
				inc esi
				mov pp, esi
			end_if3:
			jmp lp2
	end_if2:
	mov BYTE PTR [edi + offset result], al
	inc esi
	mov pt, esi
	inc edi
	jmp lp1
end_lp1:
	mov edx, offset result
	call WriteString
	invoke ExitProcess, 0d
main ENDP

demo PROC
	ret
demo ENDP
END main