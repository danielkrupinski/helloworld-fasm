format PE console
entry main

include 'win32ax.inc'

section '.text' code executable

main:
    cinvoke printf, <'Hello world!', 10, 0>
    cinvoke getchar
    invoke ExitProcess, 0

section '.idata' data readable import

library kernel32, 'kernel32.dll', \
        msvcrt, 'msvcrt.dll'

import kernel32, \
       ExitProcess, 'ExitProcess'

import msvcrt, \
       printf, 'printf', \
       getchar, 'getchar'
