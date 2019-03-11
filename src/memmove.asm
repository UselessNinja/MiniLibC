bits 64

global memmove
    section .text

memmove: ; void *memmove(void *dest, const void *src, size_t n); RDI, RSI, RDX
    mov rax, rdi ; init rax = rdi
    cmp rdi, rsi ; comp rdi : rsi
    jz _returnmem ; rdi = rsi => ret rax
    jnae _fastptrincmov ; rdi < rsi => fast pointer-incrementing move
    mov rcx, rsi ; rcx = rsi
    add rcx, rdx ; rcx + rdx (number of bytes to copy)
    cmp rdi, rcx ; cmp rdi : rcx
    jnb _fastptrincmov ; no over lapping regions (rdi >= rsi + rdx)
    std ; set flag so copying is right to left
    add rsi, rdx ; pointer rsi right
    add rdi, rdx ; pointer rdi right
    rep movsb ; byte-byte move
    cld ; clear flag
    jmp _returnmem ; return rax

_fastptrincmov:
    mov rcx, rdx ; rcx = rdx
    rep movsb ; byte-byte move
    jmp _returnmem ; return rax

_returnmem:
    ret ; return copied mem