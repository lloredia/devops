# 11. Assembly introduction

This is optional. Most DevOps work never leaves C, Go, or Python, but a little x86-64 assembly makes system calls and process crashes less mysterious. The files here are small "hello" and arithmetic experiments. Exploit development material that used to sit beside them is in `archive/assembly-experiments/` and is not part of this module.

## What is in here

`examples/` holds NASM sources:

| File | What it is |
| --- | --- |
| `hello.asm`, `hello2.asm` | `write` and `exit` via the `syscall` instruction |
| `add.asm`, `sum.asm`, `sum33.asm` | Moving values and adding |
| `www.asm`, `qqq.asm`, `bbb.asm`, `zerobuff.asm` | Data in memory, useful under a debugger |
| `run.sh` | Assemble `hello.asm`, link it, and run it |
| `README` | Notes on looking at a stack with `gdb` or radare2 |

A full copy of someone else's syscall-table webpage was not kept as a lesson. Use the kernel tree (`arch/x86/entry/syscalls/syscall_64.tbl`) or the syscall man pages when you need numbers.

## How to run the examples

On Debian or Fedora, install `nasm` and `binutils`. From this directory:

```bash
nasm -f elf64 examples/hello.asm -o /tmp/hello.o
ld -o /tmp/hello /tmp/hello.o
/tmp/hello
```

`examples/run.sh` writes `hello.o` and `hello` next to the source. Those outputs are gitignored. Prefer `/tmp` so the module directory stays source-only.

If `ld` complains about PIE, add `-no-pie` or assemble as the linker asks. The goal is a process that prints `hello world!` and exits 0.

`examples/run.sh` is not a general build tool. It only builds `hello.asm`, and it looks for that file in the current directory.

## Practice

1. Change the string in `examples/hello.asm`, update the length in `rdx`, assemble, and run. What happens if the length is too long?
2. Compare `hello.asm` and `hello2.asm`. Which one will still be correct if you edit the message, and why?
3. Under `gdb`, break at `_start` in `/tmp/hello` and inspect `rax`, `rdi`, `rsi`, and `rdx` before the `syscall`. Write down which argument is the file descriptor.
4. Pick one number from the kernel's `syscall_64.tbl` (for example `write` or `exit`) and match it to the `mov rax, ...` in `hello.asm`.
