bits 64

global memset
    section .text

memset:
    xor rax, rax ; init rax = 0

_fillmem:
    cmp rdx, rax ; if rdx == rax
    jz _returnfilledmem ; leave loop
    mov byte [rdi + rax], sil ; add int (arg[2]) to mem
    inc rax ; rax++
    jmp _fillmem ; relance boucle fillmem


_returnfilledmem:
    mov rdi, rax ; pointeur mem dans return
    ret ; return mem