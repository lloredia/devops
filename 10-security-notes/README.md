# 10. Security notes

DevOps work includes knowing how systems fail when identity, patches, and network exposure are wrong. This module is reading material: personal certification study notes. It is not a hacking lab, and it does not include exploits to run.

## What is in here

| Path | Contents |
| --- | --- |
| `study-notes/CEH.wiki` | Short quiz-style notes (ports, logging, password storage concepts, a few tool names) |
| `study-notes/OSCP.wiki` | Longer notes, largely about how network scanners classify ports, plus hashing terminology |
| `study-notes/netstuff.wiki` | Fragmentary network notes in the same style |

The notes name offensive techniques because that is what those certifications discuss. Read them to build a defender's vocabulary. Do not turn the commands in those files into a scan of a network, a hash-cracking job, or anything aimed at a system you do not own and do not have written permission to test.

Scripts and traces that were actual attack tooling (an availability script, shellshock, reverse-shell notes, privilege notes, an XSS trace) were left in `archive/security-scratch/` so they were not deleted, and they are not exercises. A captured home directory and Wi-Fi handshake captures were removed; see the top-level README.

## How to use the notes

Read one file with a current reference beside it: the scanner's own documentation, or your distro's security guide. When a note and the current documentation disagree, trust the current documentation and write down the difference.

There is nothing to execute in this module.

## Practice

1. From `study-notes/CEH.wiki`, pick five terms (for example default ports, rainbow tables, wrappers). For each, write the defensive control you would actually operate: patching, password hashing choices, least privilege, logging, or network policy.
2. Read the port-scan section of `study-notes/OSCP.wiki` and explain, without listing flags, what a firewall administrator would see and which two controls reduce that exposure.
3. Review `05-containers/wordpress/docker-compose-wp.yml` as if you were handing it to a teammate. List everything that would be unacceptable on a shared network (published admin ports, passwords in the file, no TLS).
4. Write a personal rule of three lines: what you will never commit (keys, passwords, tokens), where lab secrets live instead, and how you will check before `git add`.
