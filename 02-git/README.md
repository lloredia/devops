# 02. Git

Version control is the baseline for every later module: playbooks, container files, and pipelines only help if you can see what changed and why. This module is a long-form walkthrough imported from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops).

## What is in here

`notes/git-guide.md` walks through creating a repository, staging, committing, branching, remotes, and push/pull. The examples use a local `myproject` folder and the prompt from the original notes.

## How to run the examples

Install Git, then work in a scratch directory so you do not commit experiments into this repository:

```bash
mkdir -p "$HOME/git-lab/myproject"
cd "$HOME/git-lab/myproject"
git init
```

Follow `notes/git-guide.md` from step 1. When the notes show a remote URL, use a repository you own.

One section shows embedding a username and password in an HTTPS remote URL, and it correctly warns that this stores the password in plaintext. Skip that pattern. Use SSH keys (see module 01) or a credential manager.

## Practice

1. In your scratch repo, make two commits, then draw the history you get from `git log --oneline --graph`.
2. Create a branch, change a file on both branches so they conflict, and resolve the conflict. Write down the commands you used.
3. Clone this teaching repository into a second directory and show that `git log --follow` still finds an old path for a file that was moved, such as `01-linux-shell/scripts/varlength.sh`.
4. Explain why `git push https://username:password@host/repo.git` is a bad habit even when the password is not committed in a file.
