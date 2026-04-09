# gcc -c syscall.S
# ld -o syscall syscall.o
# strace ./syscall
# https://github.com/torvalds/linux/blob/master/arch/x86/entry/syscalls/syscall_64.tbl

.data

msg:
    .ascii "Hello, world!\n"
    len = . - msg

.text
    .global _start

_start:
    # write(1, msg, len)
    movq  $1, %rax	# syscall number
    movq  $1, %rdi	# file descriptor
    movq  $msg, %rsi
    movq  $len, %rdx
    syscall

    # exit(42)
    movq  $60, %rax	# syscall number
    movq  $42, %rdi     # status code
    syscall

