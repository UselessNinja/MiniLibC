bits 64

global strstr
    section .text

strstr:
    xor rax, rax ; rax = 0
    xor rbx, rbx ; counter2 = 0
    xor rcx, rcx ; counter = 0

_loop:
    mov al, [rdi+rcx] ; al = src[counter]
    cmp byte al, 0x00 ; al == 0
    jz _notfound ; goto notfound
    inc rcx ; ++counter

_next:
    cmp al, [rsi + rbx] ; al == accept[rcx]
    jz _found ; goto found
    cmp byte [rsi + rbx], 0x00 ; accept == 0
    jz _loop ; goto start loop
    inc rbx ; ++counter2
    jmp _next ; goto next

_found:
    dec rcx ; --rcx
    mov rax, rdi ; mov rdi
    add rax, rcx ; add counter to rax
    ret ; ret pointer to s in accecpt

_notfound:
    xor rax, rax ; rax = 0
    ret ; return null