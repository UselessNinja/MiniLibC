bits 64

global strlen
    section .text

strlen:
    xor rax, rax ; init rax = 0

_strloop:
    cmp byte [rax, rdi], 0x00 ; if (str[rax] == '\0')
    jz _returnlen ; return rax
    inc rax ; else ++rax
    jmp _strloop ; goto start of the loop

_returnlen:
    ret