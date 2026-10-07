# DevOps learning notes

A hands-on collection for learning DevOps and for teaching it. The material is real notes and scripts gathered over several years, reorganized into a path you can follow from the shell up through configuration management, containers, pipelines, and platform installs.

It is aimed at people who are comfortable opening a terminal and want practice, and at an instructor who wants something concrete to assign. Lesley Oredia ([lloredia](https://github.com/lloredia)) keeps it as a working notebook for DevOps, DevSecOps, and SRE topics.

The examples are historical. Many pin old package versions, old AMIs, or hosts that no longer exist. Read a script before you run it, run it on a machine you can throw away, and expect to repair bitrot. That repair is part of the exercise.

## Prerequisites

- A Linux environment you control (a VM is enough). macOS can do the Git and Python modules; the install scripts assume Debian or RHEL-family Linux.
- Git, bash, and Python 3.
- For later modules: Docker (with Compose), Ansible, and optionally a lab AWS account or a local Kubernetes cluster such as kind or minikube.
- No paid services are required. Do not point examples at a network, cloud account, or Jenkins server you do not own.

## Learning path

Work in order if you are new. Skip ahead if you already live in that tool; each module stands on its own.

| Module | Topic | You will practice |
| --- | --- | --- |
| [01-linux-shell](01-linux-shell/README.md) | Linux and shell scripting | Text processing, process checks, SSH keys, reading `strace` |
| [02-git](02-git/README.md) | Git | Init, commit, branch, remotes, without putting passwords in URLs |
| [03-python-automation](03-python-automation/README.md) | Python automation | argparse, a local HTTP server, TestRail client, Selenium |
| [04-ansible](04-ansible/README.md) | Configuration management | Apache playbooks, inventory, an EC2 example, Ansible install |
| [05-containers](05-containers/README.md) | Containers and Compose | WordPress stack, Dockerfiles, image tags |
| [06-kubernetes](06-kubernetes/README.md) | Kubernetes client | What `kubectl` is, and what an install script should not do |
| [07-cicd](07-cicd/README.md) | CI/CD with Jenkins | Install notes, reading a declarative pipeline, credentials |
| [08-platform-services](08-platform-services/README.md) | Platform services | Apache, nginx, Tomcat, JBoss, WebLogic, WebSphere, RabbitMQ, Splunk |
| [09-cloud](09-cloud/README.md) | Cloud vocabulary | An AWS services outline, tied back to the Ansible EC2 play |
| [10-security-notes](10-security-notes/README.md) | Security reading | Certification notes, used to name defensive controls |
| [11-assembly-intro](11-assembly-intro/README.md) | Optional assembly | Hello world in x86-64 NASM and a look at `syscall` |

Module 10 is reading, not a lab. Module 11 is optional systems background.

## Studying on your own

1. Read the module README.
2. Run the commands it marks as safe (syntax checks, local scripts, `git init` in a scratch directory).
3. Do two of the practice exercises. Write the answer in a branch of your own fork, not by editing the sample to hide a real password.
4. When a script is wrong for current software, fix the smallest thing that makes it true again and note the version you used.

Keep lab secrets out of git. Passwords, cloud keys, SSH private keys, and API tokens belong in a password manager or in a file your environment loads and `.gitignore` excludes.

## Teaching with this repository

Each module README has two to four exercises. A reasonable session is one module:

- 15 minutes: read the README and skim the tree.
- 30 minutes: run one example on a VM you prepared, or walk through a pipeline or playbook on a projector if running it would touch a real account.
- The rest: one exercise, then a short review of what the student would not commit.

Suggested assignments:

- Shell and Git for a first week (`01`, `02`).
- A Python or Ansible change that removes a hard-coded secret or a hard-coded host (`03`, `04`).
- A Compose file that reads passwords from an untracked `.env` (`05`).
- A pipeline reading: which stages build, deploy, and test (`07`).
- A security reading that produces a list of controls, not a scan (`10`).

Do not assign `archive/`. That tree is retained history, including personal device notes and old security scratch, and it is not coursework.

## Repository layout

```
01-linux-shell/          shell scripts, dotfiles, SSH and strace notes
02-git/                  Git walkthrough
03-python-automation/    HTTP, CLI, TestRail, Selenium
04-ansible/              playbooks, EC2 sample, Ansible install
05-containers/           Compose, Dockerfiles, Docker notes
06-kubernetes/           kubectl install note
07-cicd/                 Jenkins install notes and historical Jenkinsfiles
08-platform-services/    web, application server, broker, and Splunk notes
09-cloud/                AWS certification outline
10-security-notes/       defensive reading of old certification notes
11-assembly-intro/       small NASM examples
archive/                 kept, not taught (see archive/README.md)
.github/workflows/       optional report-only lint
```

## Lint

`.github/workflows/lint.yml` runs ShellCheck, Ruff, yamllint, and ansible-lint against the numbered modules. The job is report-only: legacy scripts are expected to fail a modern linter, and a failure does not block the pull request. `archive/` is not linted.

## Attribution

This repository started as a fork of [inesvit88/devops](https://github.com/inesvit88/devops). Install notes and scripts from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops) (snapshot `f70d1e36f78e4feb8020b79405b83bedce9dad00`) were consolidated here; that repository is unchanged.

Material brought over from Dev-Ops was published there under GPL-3.0. The license text is in `archive/branding/Dev-Ops-GPL-3.0.txt`. The older fork did not ship a license file. This reorganization does not relicense either body of work.

## Security hygiene

Secrets that were committed in the past were removed from the current tree: database passwords in a WordPress Compose file, a Jenkins API token, Jenkins credential ids in pipelines, a TestRail username, a private key stored inside an Elasticsearch archive, and Wi-Fi handshake captures. They are still reachable in git history. Rotate anything that was ever valid, and treat history as sensitive until it is rewritten. Details are in the pull request that introduced this layout.
