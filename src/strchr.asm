bits 64

global strchr
    section .text

strchr:
    xor rax, rax ; init rax = 0
    mov rcx, rdi ; pointeur rdi ==> rcx

_find:
    cmp byte [rcx], 0x00 ; if rcx == '\0'
    jz _nothingfound ; leave loop
    cmp byte [rcx], sil ; if rcx == char
    jz _found ; leave loop
    inc rcx ; rcx++
    jmp _find ; relance de la boucle

_found:
    add rax, rcx ; rax = rcx
    jmp _returnpos

_nothingfound:
    cmp byte sil, 0x00 ; if char == '\0'
    jz _returnpos ; return pos
    xor rax, rax ; else rax == 0

_returnpos:
    ret ; return pointer to pos
