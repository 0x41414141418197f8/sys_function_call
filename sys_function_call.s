BITS 64

global _hello

section .rodata

    boucle db "boucle", 10, 0
    boucle_len equ $-boucle

    write db "j use un sys write", 10, 0
    write_len equ $-write

section .text

_hello:
    call _start
    jmp _exit
    
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, boucle
    mov rdx, boucle_len
    syscall
    cmp rax, 0x1
    je _print

_print:
    mov rax, 0x1
    mov rdi, 1
    mov rsi, write
    mov rdx, write_len
    syscall 
    jmp _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
