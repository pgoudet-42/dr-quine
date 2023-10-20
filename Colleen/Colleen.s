;commentaire
section .data
    fmt: db ";commentaire%1$csection .data%1$c    fmt: db %3$c%2$s%3$c, 0%1$c%1$csection .text%1$c    extern dprintf%1$c    global _start%1$c%1$c_start:%1$c    ;2ieme commentaire%1$c    mov	rdi, 1%1$c    lea rsi, [fmt]%1$c    mov rdx, 10%1$c    lea rcx, [fmt]%1$c    mov r8, 34%1$c    mov	rax, 0%1$c    call dprintf%1$c    mov  rax, 60%1$c    xor  rdi, rdi%1$c    syscall", 0

section .text
    extern dprintf
    global _start

_start:
    ;2ieme commentaire
    mov	rdi, 1
    lea rsi, [fmt]
    mov rdx, 10
    lea rcx, [fmt]
    mov r8, 34
    mov	rax, 0
    call dprintf
    mov  rax, 60
    xor  rdi, rdi
    syscall