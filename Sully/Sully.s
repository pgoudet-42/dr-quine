section .text
	global _start
	extern dprintf
	extern snprintf
	extern system

ft_open:
	mov rax, 2
	lea rdi, [file]
	mov rsi, 66
	mov rdx, 384
	syscall
	ret

ft_close:
	mov rax, 3
	xor rdi, rdi
	mov dword edi, [rsp - 4]
	syscall
	ret

ft_exit:
	add rsp, 0x10
	add rsp, 32
	mov rax, 60
	mov rdi, 0
	syscall

ft_dprintf:
	push rbp
	mov rbp,rsp
	mov rdi, [rsp + 0x18]
	lea rsi, [fmt]
	mov rdx, 10
	lea rcx, 9
	mov r8, [rsp + 0x14]
	sub r8, 1
	lea r9, [fmt]
	push 37
	push 34
	mov rax, 0
	call dprintf
	leave
	ret

ft_snprintf_file:
	sub rsp, 0x8
	lea rdi, file
	mov rsi, 0x10
	mov rdx, file_fmt
	xor rcx, rcx
	mov dword ecx, [rsp + 0x4 + 0x10]
	call snprintf
	add rsp, 0x8
	ret

ft_snprintf_cmd:
	sub rsp, 0x8
	lea rdi, [cmd]
	mov rsi, 0x70
	lea rdx, [cmd_fmt]
	xor rcx, rcx
	mov dword ecx, [rsp + 0x4 + 0x10]
	call snprintf
	add rsp, 0x8
	ret

ft_system:
	sub rsp, 0x8
	lea rdi, [cmd]
	mov rax, 0
	call system
	add rsp, 0x8
	ret

_start:
	sub rsp, 0x10
	mov dword [rsp + 0x4], 5
	cmp dword [rsp + 0x4], 0
	jl  ft_exit
	call ft_snprintf_file
	call ft_snprintf_cmd
	; call put_dprintf
	call ft_open
	xor rdi, rdi
	mov dword [rsp + 0x8], eax
	mov	dword edi, [rsp + 0x8]
	call ft_dprintf
	call ft_close
	call ft_system
	call ft_exit

section .bss
	file: resb 0x10
	cmd: resb 0x70

section .data
	debug: db "%s%c", 0
	cmd_fmt: db "nasm -f elf64 Sully_%1$d.s && gcc Sully_%1$d.o -o Sully_%1$d -no-pie -nostartfiles && rm Sully_%1$d.o && ./Sully_%1$d", 0
	file_fmt: db "Sully_%d.s", 0
	fmt: db "section .text%1$c%2$cglobal _start%1$c%2$cextern dprintf%1$c%2$cextern snprintf%1$c%2$cextern system%1$c%1$cft_open:%1$c%2$cmov rax, 2%1$c%2$clea rdi, [file]%1$c%2$cmov rsi, 66%1$c%2$cmov rdx, 384%1$c%2$csyscall%1$c%2$cret%1$c%1$cft_close:%1$c%2$cmov rax, 3%1$c%2$cxor rdi, rdi%1$c%2$cmov dword edi, [rsp - 4]%1$c%2$csyscall%1$c%2$cret%1$c%1$cft_exit:%1$c%2$cadd rsp, 0x10%1$c%2$cadd rsp, 32%1$c%2$cmov rax, 60%1$c%2$cmov rdi, 0%1$c%2$csyscall%1$c%1$cft_dprintf:%1$c%2$cpush rbp%1$c%2$cmov rbp,rsp%1$c%2$cmov rdi, [rsp + 0x18]%1$c%2$clea rsi, [fmt]%1$c%2$cmov rdx, 10%1$c%2$clea rcx, 9%1$c%2$cmov r8, [rsp + 0x14]%1$c%2$csub r8, 1%1$c%2$clea r9, [fmt]%1$c%2$cpush 37%1$c%2$cpush 34%1$c%2$cmov rax, 0%1$c%2$ccall dprintf%1$c%2$cleave%1$c%2$cret%1$c%1$cft_snprintf_file:%1$c%2$csub rsp, 0x8%1$c%2$clea rdi, file%1$c%2$cmov rsi, 0x10%1$c%2$cmov rdx, file_fmt%1$c%2$cxor rcx, rcx%1$c%2$cmov dword ecx, [rsp + 0x4 + 0x10]%1$c%2$ccall snprintf%1$c%2$cadd rsp, 0x8%1$c%2$cret%1$c%1$cft_snprintf_cmd:%1$c%2$csub rsp, 0x8%1$c%2$clea rdi, [cmd]%1$c%2$cmov rsi, 0x70%1$c%2$clea rdx, [cmd_fmt]%1$c%2$cxor rcx, rcx%1$c%2$cmov dword ecx, [rsp + 0x4 + 0x10]%1$c%2$ccall snprintf%1$c%2$cadd rsp, 0x8%1$c%2$cret%1$c%1$cft_system:%1$c%2$csub rsp, 0x8%1$c%2$clea rdi, [cmd]%1$c%2$cmov rax, 0%1$c%2$ccall system%1$c%2$cadd rsp, 0x8%1$c%2$cret%1$c%1$c_start:%1$c%2$csub rsp, 0x10%1$c%2$cmov dword [rsp + 0x4], %3$d%1$c%2$ccmp dword [rsp + 0x4], 0%1$c%2$cjl  ft_exit%1$c%2$ccall ft_snprintf_file%1$c%2$ccall ft_snprintf_cmd%1$c%2$c; call put_dprintf%1$c%2$ccall ft_open%1$c%2$cxor rdi, rdi%1$c%2$cmov dword [rsp + 0x8], eax%1$c%2$cmov	dword edi, [rsp + 0x8]%1$c%2$ccall ft_dprintf%1$c%2$ccall ft_close%1$c%2$ccall ft_system%1$c%2$ccall ft_exit%1$c%1$csection .bss%1$c%2$cfile: resb 0x10%1$c%2$ccmd: resb 0x70%1$c%1$csection .data%1$c%2$cdebug: db %5$c%6$cs%6$cc%5$c, 0%1$c%2$ccmd_fmt: db %5$cnasm -f elf64 Sully_%6$c1$d.s && gcc Sully_%6$c1$d.o -o Sully_%6$c1$d -no-pie -nostartfiles && rm Sully_%6$c1$d.o && ./Sully_%6$c1$d%5$c, 0%1$c%2$cfile_fmt: db %5$cSully_%6$cd.s%5$c, 0%1$c%2$cfmt: db %5$c%4$s%5$c, 0", 0