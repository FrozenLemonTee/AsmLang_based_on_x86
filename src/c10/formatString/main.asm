INCLUDE format.inc
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
.code
main PROC
	mFormatString <hello ~,your score is ~>, <Gabio,61>
	call WriteString
	call Crlf
	mFormatString <20 * 5 = ~, 3 * 30 = ~>, <%(20 * 5),%(3 * 30)>
	call WriteString
	invoke ExitProcess, 0d
main ENDP
END main