format PE console
entry main

include 'win32a.inc'

section '.text' code executable
main:
        push hello
        ccall [printf]
        ccall [getchar]
        push 0
        stdcall [ExitProcess]

section '.rdata' data readable
       hello db 'Hello world!', 10, 0

section '.idata' data readable import
        library kernel32, 'kernel32.dll', \
                msvcrt,   'msvcrt.dll'
        import kernel32, ExitProcess, 'ExitProcess'
        import msvcrt, \
        printf, 'printf', \
        getchar, 'getchar'