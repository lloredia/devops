# 01. Linux and shell scripting

Shell is the day-to-day interface for Linux administration: finding files, shaping text, checking whether a service answers, and reading what a process is doing. This module is a set of short historical scripts plus a few setup notes, not a polished framework.

## What is in here

| Path | Contents |
| --- | --- |
| `scripts/` | One-purpose bash examples: string length and slicing, `find`/`grep`, a progress spinner, HTTP title checks, file splitting, and `extract-addresses.sh` (pull IPv4 addresses and host-like tokens out of text) |
| `dotfiles/` | Example `.bashrc`, `.zshrc`, and `.vimrc`, including Docker and Git aliases |
| `notes/` | SSH key setup for Git, an `strace` network example, and SD-card resize notes for a Raspberry Pi style disk |
| `notes/disk/` | `fdisk` / `resize2fs` notes that used to live next to a personal host alias file |

`scripts/matrix.sh` and `scripts/matrix2.sh` are terminal animations by other authors (BruXy, 2011; Brett Terpstra, 2012). They are here as examples of ANSI control codes, with that attribution.

`scripts/clear_cache.sh` and `scripts/oneliner_site_test.sh` still name old internal hosts. Treat the host lists as placeholders.

## How to run the examples

Use a Linux shell, or Git Bash / WSL if you are on Windows. From this directory:

```bash
bash scripts/varlength.sh
bash scripts/varcut.sh
bash scripts/findandgrep.sh
printf '10.1.2.3 and app.example.com\n' | bash scripts/extract-addresses.sh
```

`scripts/speed_test.sh` expects a filename and posts a generated file to `localhost:8888`. Start a listener only on your own machine, for example the small server in module 03, before you run it.

The disk notes rewrite partition tables. Read them on a disposable VM or a spare SD card, and take a backup first. Do not point `fdisk` at your workstation disk.

## Practice

1. `scripts/sed..sh` has a broken shebang (`#!/ bin/bash`, with a space). Fix it and explain why the kernel could not execute the file.
2. Rewrite `scripts/oneliner_site_test.sh` so the site list comes from a file, and so a non-200 response exits non-zero. Use hosts you control.
3. `dotfiles/.bashrc` runs `git config credential.helper store`, which saves credentials in plaintext. Replace that with a helper you would actually use, and say where the secrets would live.
4. Extend `scripts/extract-addresses.sh` with a function that prints only `host:port` pairs, and add two sample input lines as a comment.
