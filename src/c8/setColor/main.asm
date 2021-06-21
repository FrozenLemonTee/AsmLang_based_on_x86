INCLUDE Irvine32.inc
INCLUDE setColor.inc

.386
.model flat, stdcall

.stack 4096

.code
main PROC
	push BLUE
	push RED
	call TextColor
	mov eax, 20
	call WriteInt
	call Crlf
	invoke WriteColorChar, "M", GREEN, RED
	call Crlf
	.data
	sstr BYTE "hello world!", 0
	.code
	invoke WriteColorStr, offset sstr, YELLOW, CYAN
	invoke ExitProcess, 0d
main ENDP
END main