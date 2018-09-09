format PE64 console
entry main

include 'win64a.inc'

section '.text' code executable
main:
    lea rcx, [hello]
    cinvoke printf
    cinvoke getchar
    xor rcx, rcx
    invoke ExitProcess

section '.rdata' data readable
    hello db 'Hello world!', 10, 0

section '.idata' data readable import
    library kernel32, 'kernel32.dll', \
            msvcrt, 'msvcrt.dll'

    import kernel32, ExitProcess, 'ExitProcess'
    import msvcrt, \
        printf, 'printf', \
        getchar, 'getchar'
