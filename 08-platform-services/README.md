# 08. Platform services

After you can configure a host and ship a container, operations work is often "install and run this server." The notes in this module were consolidated from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops). They cover web servers, Java application servers, a message broker, and Splunk, mostly as shell installers and checklists for older RHEL and Debian releases.

## What is in here

| Path | Contents |
| --- | --- |
| `apache/` | Where RHEL serves web files, and `rhel_install.sh` |
| `nginx/` | `install.sh` writes an nginx yum repo, starts the service, and opens HTTP(S) in firewalld |
| `tomcat/` | A long Tomcat 9 note: users, manager app, JMX, a sample datasource |
| `jboss/` | EAP 7.2 install notes, a systemd unit, `eap_install-v.1.sh`, and the Ansible play lives in module 04 |
| `weblogic/` | WebLogic install and patching notes, a swap-space script, Java 8, and a MySQL 5.7 install used as a sample datasource |
| `websphere/` | WebSphere install and patching notes |
| `rabbitmq/` | RabbitMQ 3.2.2 on an old Enterprise Linux 6 layout, plus a short README (default `guest`/`guest`) |
| `splunk/` | Download and start Splunk 8.0.1 from the vendor URL in `install.sh` |

These scripts assume root and change the host: packages, firewall, users, and listening ports. Several pin releases that are past support (RabbitMQ 3.2, CentOS-era yum repos, Java 8). Read a script completely before you run it, and run it only in a disposable VM.

`tomcat/README.md` uses the lab passwords `admin`/`admin` and `welcome1`, and it says so. `weblogic/mysql/install.sh` sets a MySQL password to the word `password`. Those are not secrets from a production system, and they must not be left on a reachable host. RabbitMQ's `guest` user is documented as the product default; disable or replace it if the management port is not bound to localhost.

## How to run the examples

Pick one service and one VM. Example, only after reading the script:

```bash
less nginx/install.sh
```

There is no shared "up" command for this module. A reasonable lab sequence is: Apache or nginx first (you can see a page), then Tomcat (you can see a manager), and only then an application server if you have a licensed installer. WebLogic and WebSphere notes expect vendor binaries that are not in this repository.

Splunk's install script downloads a large tarball from Splunk. Check the license terms and the URL before you run it.

## Practice

1. Run nginx or Apache in a VM and serve a page that shows the hostname. Record the unit commands you used to start and stop it (`systemctl` or `service`).
2. In `tomcat/README.md`, find every sample password. Rewrite the user snippet so the password is read from a file with mode `0600`, and say who should own that file.
3. Compare `jboss/jboss.service` with a systemd unit you would write today. What is missing (user, restart policy, logs)?
4. `rabbitmq/install.sh` targets Enterprise Linux 6 and RabbitMQ 3.2.2. Write a short note on what you would change to install a current RabbitMQ on a current distro, without pasting a new unreviewed script over the old one until you have tried it in a VM.
