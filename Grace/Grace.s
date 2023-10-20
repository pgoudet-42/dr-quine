%define FMT "%4$cdefine FMT %1$c%2$s%1$c%3$c%3$c%4$cdefine FILE %1$cGrace_kids.s%1$c%3$c;comment%3$c%4$cdefine START%3$c    section .text%3$c        global _start%3$c        extern dprintf%3$c    _start:%3$c        sub rsp, 16%3$c        mov rax, 2%3$c        mov rdi, file%3$c        mov rsi, 66%3$c        mov rdx, 384%3$c        syscall%3$c        mov dword [rsp], eax%3$c        xor rdi, rdi%3$c        mov	dword edi, [rsp]%3$c        lea rsi, [fmt]%3$c        mov rdx, 34%3$c        lea rcx, [fmt]%3$c        mov r8, 10%3$c        mov r9, 37%3$c        mov rax, 0%3$c        call dprintf%3$c        mov rax, 3%3$c        xor rdi, rdi%3$c        mov dword edi, [rsp]%3$c        syscall%3$c        add rsp, 16%3$c        mov  rax, 60%3$c        xor  rdi, rdi%3$c        syscall%3$cSTART%3$c%3$csection .data%3$c    fmt: db FMT, 0%3$c    file: db FILE, 0"

%define FILE "Grace_kids.s"
;comment
%define START
    section .text
        global _start
        extern dprintf
    _start:
        sub rsp, 16
        mov rax, 2
        mov rdi, file
        mov rsi, 66
        mov rdx, 384
        syscall
        mov dword [rsp], eax
        xor rdi, rdi
        mov	dword edi, [rsp]
        lea rsi, [fmt]
        mov rdx, 34
        lea rcx, [fmt]
        mov r8, 10
        mov r9, 37
        mov rax, 0
        call dprintf
        mov rax, 3
        xor rdi, rdi
        mov dword edi, [rsp]
        syscall
        add rsp, 16
        mov  rax, 60
        xor  rdi, rdi
        syscall
START

section .data
    fmt: db FMT, 0
    file: db FILE, 0