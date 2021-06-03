; practice 5.8.2-2
.386
.model flat, stdcall

.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	call func1
	invoke ExitProcess, 0d
main ENDP

func1 PROC
	call func2
	call func3
	call func4
	ret
func1 ENDP

func2 PROC
	ret
func2 ENDP
func3 PROC
	ret
func3 ENDP
func4 PROC
	ret
func4 ENDP
END main