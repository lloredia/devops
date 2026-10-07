# 05. Containers and Docker Compose

Containers package a process with its userspace so a lab matches the machine you deploy to. This module has Compose examples for WordPress, a few Dockerfiles, and command notes imported from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops).

## What is in here

| Path | Contents |
| --- | --- |
| `wordpress/docker-compose-wp.yml` | WordPress and MySQL. Passwords are the literal `examplepass` |
| `wordpress/docker-compose-wp-mariadb-phpmyadmin.yml` | WordPress, MariaDB, and phpMyAdmin. Passwords are the literal `wordpress` |
| `wordpress/u4p/` and `wordpress/ansible-bundle/` | Start/stop helpers and another Compose file whose sample passwords are `wordpress33` / `wordpress777` and `wordpress1` / `wordpress2` |
| `dockerfiles/` | Alpine with a JRE, and a CentOS 7 image that installs Ansible |
| `install/docker/` | RHEL install script, Kali install notes, and a MongoDB Dockerfile walkthrough from Dev-Ops |
| `notes/image-tags.readme` | A short note on not relying on the `latest` tag |

These Compose files publish port 80 and phpMyAdmin. Run them on a laptop or a private lab network. The passwords above are examples so the files parse; they are not secret, and they are not acceptable on any host another person can reach.

A production-shaped copy of the WordPress stack used to contain real database passwords. Those values were removed. The redacted file is under `archive/wordpress-prod/` and is not an exercise.

## How to run the examples

Install Docker and the Compose plugin. From this directory, on a machine you can afford to clutter:

```bash
docker compose -f wordpress/docker-compose-wp.yml up -d
docker compose -f wordpress/docker-compose-wp.yml ps
docker compose -f wordpress/docker-compose-wp.yml down -v
```

`down -v` deletes the database volume. That is what you want in a lab.

The CentOS 7 and Alpine 3.7 Dockerfiles use archives that may no longer build. Try them, and if the base image or package name has moved, fix the Dockerfile and keep the change small:

```bash
docker build -f dockerfiles/Dockerfile.alpine -t lab-jre:local dockerfiles
```

Read `install/docker/README.md` before following the MongoDB Dockerfile. Several instructions (`MAINTAINER`, an old Ubuntu MongoDB repo, `docker run -name`) are out of date on current Docker. The useful part is the sequence: `FROM`, `RUN`, `EXPOSE`, build, run.

## Practice

1. Move the `examplepass` values in `wordpress/docker-compose-wp.yml` into a `.env` file, reference them as `${MYSQL_PASSWORD}`, and confirm `.env` is ignored by Git.
2. Add a healthcheck to the database service and make WordPress wait for it. Explain why `depends_on` alone does not mean the database is ready.
3. Rebuild `dockerfiles/Dockerfile.ansible-docker-base-centos7` on a current base image of your choice. Note which packages you had to rename.
4. In `install/docker/README.md` the image is tagged only in your head as "latest" behavior. Tag a build `lab-mongodb:1.0` and show the difference between running that tag and running `latest`.
