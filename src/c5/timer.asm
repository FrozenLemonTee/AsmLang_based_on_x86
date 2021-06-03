; a timer: print an increased number in cmd per sec
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
second DWORD 0
.code
tips BYTE "current seconds: ", 0
main PROC
	delayTime EQU 1000
	enterKey EQU 13
	mov ecx, 1
	mov edx, OFFSET tips
	lp:
		call WriteString
		mov eax, second
		call WriteDec
		inc eax
		mov second, eax
		mov eax, enterKey
		call WriteChar
		mov eax, delayTime
		call Delay
		inc ecx
		loop lp
	invoke ExitProcess, 0d
main ENDP
END main