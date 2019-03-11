bits 64

global strncmp
    section .text

strncmp:
    xor rax, rax ; inti rax = 0
    xor rbx, rbx ; inti rbx = 0
    xor rcx, rcx ; inti counter = 0

_ncmp:
    cmp rdx, rcx ; verify if equal
    jz _equal ; return 0
    mov byte al, [rdi + rcx] ; al = str1[counter]
    mov byte bl, [rsi + rdx] ; bl = str2[counter]
    cmp al, bl ; cmp al : bl
    jnz _return ; if al =/= bl return diff
    cmp byte al, 0x00 ; verify if al =/= 0
    jz _return ; return if al =/= 0
    inc rcx ; ++counter
    jmp _ncmp ; goto start of the loop

_equal:
    xor rax, rax ; rax = 0
    ret ; return rax

_return:
    sub rax, rbx ; diff rax, rbx
    ret ; return diff
