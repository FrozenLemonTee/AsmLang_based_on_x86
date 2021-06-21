EXTERNDEF TextColor: PROC
EXTERNDEF WriteColorChar: PROC
EXTERNDEF WriteColorStr: PROC


TextColor PROTO, front: BYTE, back: BYTE
WriteColorChar PROTO, char: BYTE, front: BYTE, back: BYTE
WriteColorStr PROTO, pStr: DWORD, front: BYTE, back: BYTE

ExitProcess PROTO, dwExitCode: DWORD