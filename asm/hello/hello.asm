;hello.asm
section .data
    msg    db      "hello, people",0
section .bss
section .text
    global main
main:
    mov    rax, 1       ; 1 = write
    mov    rdi, 1     ; 1 = to stdout
    mov    rsi, msg
    syscall             ; display the string
    mov    rax, 60      ; 60 = exit
    mov     rdi, 0      ; 0 = success exit code
    syscall             ; quit