# 04. Configuration management with Ansible

Ansible describes the state you want on a machine and then applies it over SSH, or locally. This module has two layers: short playbooks from the original repository, and install notes brought in from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops).

## What is in here

| Path | Contents |
| --- | --- |
| `playbooks/site.yml` | Install Apache on localhost and render `index.j2` when the OS family is Debian or Red Hat |
| `playbooks/site2.yml` | The same play, plus a process check that starts Apache if it is not running |
| `playbooks/site_test.yml` | Run `docker images` on a host group named `bsro` and debug the output |
| `playbooks/index.j2` | Jinja template for the Apache welcome page |
| `aws-ec2/` | Older playbooks that launch an EC2 instance, install Docker, and install httpd. Inventory, `ansible.cfg`, and shell wrappers live beside them |
| `install/ansible_install.sh` | Clone a chosen Ansible git tag and install it on Debian-style hosts |
| `install/jboss.yml` | A short play that installs OpenJDK 8 and unpacks JBoss 7.1 |

The EC2 playbooks pin an old AMI in `us-east-2`, open SSH to a single address, and open port 80 to the world. Read them before you run them. AWS keys are expected in the environment (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are empty exports in `aws-ec2/README.md`). Do not paste real keys into the file.

Unstructured notes from that EC2 work, including hostnames and a redacted password, are in `archive/ops-notes/`, not in this module.

## How to run the examples

Install Ansible on a disposable Linux VM. A localhost syntax check does not change the machine:

```bash
ansible-playbook playbooks/site.yml --syntax-check
ansible-playbook playbooks/site2.yml --syntax-check
```

Applying `site.yml` installs Apache and writes `/var/www/html/index.html`. Only do that on a lab VM.

The `aws-ec2` playbooks call the legacy `ec2` and `ec2_group` modules and will try to create real infrastructure if your AWS credentials are set. Prefer `--syntax-check` until you have an account and a region you mean to use. The shell wrappers pass `--private-key ~/.ssh/dev2.pem`; point that at a lab key you generated, not a key copied from chat or email.

`install/ansible_install.sh` needs a version tag and a hosts file:

```bash
bash install/ansible_install.sh v2.9.27 ./aws-ec2/hosts
```

Review it first. It installs packages with `apt-get` and copies a hosts file to `/etc/ansible/hosts`.

## Practice

1. Add a `handlers` section to `playbooks/site2.yml` so Apache restarts when the template changes, and replace the `shell` process check with the `service` module.
2. Make the Apache package name and the config path variables for Debian and Red Hat, and syntax-check the play on both families (two VMs, or `--syntax-check` plus a comment on what you could not boot).
3. In `aws-ec2/ec2-rer.yml`, replace the hard-coded AMI and the SSH CIDR with variables, and explain why `cidr_ip: 0.0.0.0/0` on port 80 is a decision you must make on purpose.
4. Dry-run `install/jboss.yml` with `ansible-playbook --check` against localhost only after you confirm the JBoss zip URL still exists. If it does not, update the URL and write down what broke.
