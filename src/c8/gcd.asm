; practice 8.11-7
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096

ExitProcess PROTO, dwExitCode: dword
gcd PROTO, dividend: DWORD, divsior: DWORD
printChar PROTO, char: BYTE
printDec PROTO, num: DWORD
printGcdArr PROTO, ofst1: DWORD, ofst2: DWORD, len: DWORD 

.data
arr1 DWORD 20, 15, 21, 70, 49
arr2 DWORD 8, 10, 3, 90, 50
.code
main PROC
	invoke printGcdArr, addr arr1, addr arr2, lengthof arr1
	invoke ExitProcess, 0d
main ENDP

printChar PROC USES eax, char: BYTE
	movzx eax, char
	call WriteChar
	ret
printChar ENDP

printDec PROC USES eax, num: DWORD
	mov eax, num
	call WriteDec
	ret
printDec ENDP

; print gcd between two arrays
; params:
; esi: offset of array1
; edi: offset of array2
; ecx: length of one array
; returns:
; None
_printGcdArr PROC USES eax
lp:
	invoke printChar, "g"
	invoke printChar, "c"
	invoke printChar, "d"
	invoke printChar, "("
	invoke printDec, [esi]
	invoke printChar, ","
	invoke printDec, [edi]
	invoke printChar, ")"
	invoke printChar, " "
	invoke printChar, "="
	invoke printChar, " "
	invoke gcd, [esi], [edi]
	invoke printDec, eax
	call Crlf
	add esi, type DWORD
	add edi, type DWORD
	loop lp
	ret
_printGcdArr ENDP

printGcdArr PROC USES esi edi ecx, ofst1: DWORD, ofst2: DWORD, len: DWORD
	mov esi, ofst1
	mov edi, ofst2
	mov ecx, len
	call _printGcdArr
	ret
printGcdArr ENDP

; find the Greatest Common Divsior(gcd)
; params:
; eax: dividend
; ebx: divsior
; returns:
; eax: gcd
_gcd PROC
	mov edx, 0
	cmp ebx, 0
	jz return
	div ebx
	xchg eax, ebx
	mov ebx, edx
	call _gcd
return:
	ret
_gcd ENDP

gcd PROC, dividend: DWORD, divsior: DWORD
	mov eax, dividend
	mov ebx, divsior
	call _gcd
	ret
gcd ENDP
END main