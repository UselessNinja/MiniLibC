bits 64

global strcspn
    section .text

strcspn:
    xor rax, rax ; rax = 0
    xor rbx, rbx ; rbx = 0
    xor rcx, rcx ; counter = 0

_loop:
    mov al, [rdi + rcx]
    cmp byte al, 0x00
    jz _return
    inc rcx

_next:
    cmp al, [rsi + rbx]
    jz _decrease_rcx
    cmp byte [rsi + rbx], 0x00
    jz _loop
    inc rbx
    jmp _next

_decrease_rcx:
    dec rcx
    mov rax, rcx
    ret

_return:
    mov rax, rcx
    ret