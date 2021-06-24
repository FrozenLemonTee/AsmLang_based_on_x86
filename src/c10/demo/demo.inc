demo MACRO txt1:REQ, txt2:REQ
	local cur
	.data
	sstr BYTE "&txt1", 0
	cur BYTE "&txt2", 0
	.code
	mov eax, offset cur
	mov edx, offset sstr
ENDM