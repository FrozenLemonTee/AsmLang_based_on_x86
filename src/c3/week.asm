; practice 3.10-2 -3

.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

MON EQU 1
TUE EQU 2
WED EQU 3
THU EQU 4
FRI EQU 5
SAT EQU 6
SUN EQU 7

.data
week DWORD 1 DUP(MON, TUE, WED, THU, FRI, SAT, SUN)

.code
main PROC
	INVOKE ExitProcess, 0d
main ENDP
END main