; practice 7.9.2-7
INCLUDE Irvine32.inc
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword
.data
byteArray BYTE 81h, 20h, 33h
.code
main PROC
    MOV eax, 0
    MOV ebx, offset byteArray
    MOV esi, 0
    ADD eax, [ebx]
    SHL eax, 1
    MOV [ebx], eax
	invoke ExitProcess, 0d
main ENDP

demo PROC
	ret
demo ENDP
END main