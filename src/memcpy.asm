bits 64

global memcpy
    section .text

memcpy:
    xor rax, rax ; init rax = 0

_cpymem:
    cmp rdx, rax ; verify if counter != 0
    jz _returncopiedmem ; leave loop
    mov byte cl, [rsi] ; mov char to copy to temp
    mov byte [rdi], cl ; mov temp to destination
    dec rdx ; decrease counter
    inc rsi ; advance in source
    inc rdi ; advance in destination
    jmp _cpymem ; relance boucle cpymem

_returncopiedmem:
    mov rdi, rax ; pointeur memcopied dans return
    ret ; return memcopied