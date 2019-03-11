bits 64

global strcmp
    section .text

strcmp:
    xor rbx, rbx ; inti rbx = 0
    xor rcx, rcx ; init rcx = 0

_cmp:
    mov byte bl, [rsi + rcx] ; mov char to rbx
    cmp byte [rdi + rcx], bl ; if rbx == av[1][rcx]
    jnz _returncmp ; leave loop
    cmp byte bl, 0x00 ; if temp == '\0'
    jz _returncmp ; leave loop
    inc rcx ; rcx++
    jmp _cmp ; relance loop

_returncmp:
    xor rdx, rdx ; rdx = 0
    mov byte dl, [rdi + rcx] ; mov av[1][rcx] to temp
    sub rbx, rdx ; rdx - rbx
    neg rbx ; -rbx otherwise result is negative (we assume rdx is inferior to rbx)
    mov rax, rbx ; copy rbx to return
    ret ; return comparaison