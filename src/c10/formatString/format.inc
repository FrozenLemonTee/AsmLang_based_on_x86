; param @template: <(contents)~(contents)~(contents)...>
; use ~ to place the pattern string into the position ~
; param @patterns: <pattern1,pattern2,...>
; return:
; edx: the offset of the final string
mFormatString MACRO template:REQ, patterns:REQ
	local tmpT, tmpP, lp1, end_lp1, end_if1, end_if2, case2, end_if3, lp2, pt, pp, pr, result
.data
result BYTE 4096 DUP(?)
tmpT BYTE "&template", 0
tmpP BYTE "&patterns", 0
pt DWORD 0
pp DWORD 0
pr DWORD 0
.code
	push eax
	push esi
	push edi
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
	pop edi
	pop esi
	pop eax
ENDM