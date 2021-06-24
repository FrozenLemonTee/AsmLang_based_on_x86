; practice 9.10-4
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
kmp PROTO, strs: DWORD, strp: DWORD, len_s: DWORD, len_p: DWORD
nextArrInit PROTO, strp: DWORD, len_p: DWORD
.data
src BYTE "ababaabaabac", 0
tar BYTE "abaabac", 0
.code
main PROC
	invoke kmp, offset src, offset tar, lengthof src, lengthof tar ; todo
	call WriteInt
	invoke ExitProcess, 0d
main ENDP

; todo

; find the match position in the source string to match the pattern string
; params:
; strs: offset of the source string
; strp: offset of the pattern string
; len_s: length of the source string
; len_p: length of the pattern string
; returns:
; eax: the match position(if the position do not exist, returns -1)
kmp PROC USES esi edi ebx ecx edx, strs: DWORD, strp: DWORD, len_s: DWORD, len_p: DWORD
	invoke nextArrInit, strp, len_p
	mov esi, strs
	mov edi, strp
	mov eax, 0 ; match_p = 0
	mov ebx, 0 ; pattern_p = 0
lp:
	mov ecx, eax
	add ecx, ebx
	cmp ecx, len_s
	jnb end_lp ; while(match_p + pattern_p < len_s)
case1:
	mov cl, BYTE PTR [esi + eax + ebx]
	mov ch, BYTE PTR [edi + ebx]
	cmp ch, cl
	jnz case2 ; if(strs[match_p + pattern_p] == strp[pattern_p])
	inc ebx ; pattern_p += 1
	jmp end_if1
case2:
	inc eax
	cmp ebx, 0
	jz end_if1 ; elif(pattern_p != 0)
	mov ecx, ebx
	sub ecx, 1
	add eax, [edx + ecx * type DWORD] ; match_p += next[pattern_p - 1]
	mov ebx, 0
end_if1:
	cmp ebx, len_p
	jnz end_if2
	mov ecx, ebx
	sub ecx, 1
	mov ebx, [edx + ecx * type DWORD] ; pattern_p = next[pattern_p - 1]	
end_if2:
	jmp lp
end_lp:
	cmp ebx, len_p
	jz return
	mov eax, -1
return:
	ret
kmp ENDP

; init the next-array
; params:
; strp: offset of the pattern string
; len_p: length of the pattern string
; returns:
; edx: the offset of the next-array
nextArrInit PROC USES esi edi eax ebx ecx, strp: DWORD, len_p: DWORD
	.data
	next DWORD 1024 DUP(?)
	.code
	mov eax, 0 ; pre = 0
	mov esi, offset next
	mov edi, esi
	mov DWORD PTR [edi], 0
	add edi, type DWORD ; next.append(0)
	mov ebx, 1 ; cur = 1
lp:
	mov edx, len_p
	cmp ebx, edx ; while(cur < len(p))
	jnb end_lp
	mov esi, strp
	movzx ecx, BYTE PTR [esi + eax]
	movzx edx, BYTE PTR [esi + ebx]
case1:
	cmp ecx, edx ; if(p[cur] == p[pre])
	jnz case2
	inc eax ; pre += 1
	inc ebx ; cur += 1
	mov DWORD PTR [edi], eax
	add edi, type DWORD ; next.append(pre)
	jmp end_if
case2:
	cmp eax, 0 ; else if(pre != 0)
	jz case3

	mov ecx, eax
	sub ecx, 1
	mov esi, offset next
	mov eax, DWORD PTR [esi + ecx * type DWORD] ; pre = next[pre - 1]
	jmp end_if	
case3:
	mov DWORD PTR [edi], 0
	add edi, type DWORD ; next.append(0)
	inc ebx ; cur += 1
end_if:
	jmp lp
end_lp:
	mov edx, offset next
	ret
nextArrInit ENDP
END main