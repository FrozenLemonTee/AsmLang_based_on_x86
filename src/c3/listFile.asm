; practice 3.9.2-5

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
val QWORD 456789ABh
.code
main PROC
	add eax, 5
	add edx, 5
	INVOKE ExitProcess, 0d
main ENDP
END main