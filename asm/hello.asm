;hello.asm
section .data
    ; mesaj    db      "hello, people",0
section .bss
section .text
    global main
main:
    mov    rax, 101       ; 1 = write
    mov    rdi, 1       ; 1 = to stdout
    syscall             ; display the string
    mov    rax, 60      ; 60 = exit
    mov     rdi, 0      ; 0 = success exit code
    syscall             ; quit