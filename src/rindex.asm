bits 64

global rindex
    section .text

rindex:
    xor rax, rax ; init rax = 0
    xor rcx, rcx ; init counter = 0
    mov rdx, -1337 ; init pos = -1337 (safe case if we don't find the char)

_loop:
    cmp byte sil, [rdi + rcx] ; compare sil and str(counter)
    jz _save ; save position

_next:
    cmp byte [rdi + rcx], 0x00 ; verify if not endofline
    jz _return ; return
    inc rcx ; rcx++
    jmp _loop ; goto start of loop

_save:
    mov rdx, rcx ; save pos into rdx
    jmp _next

_notfound:
    ret ; return null

_return:
    cmp rdx, -1337 ; verify if we have found the char
    jz _notfound ; return rax = (null)
    mov rax, rdi ; save rdi => return/rax
    add rax, rdx ; add pos to pointer string
    ret ; return pointer to char