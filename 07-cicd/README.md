# 07. CI/CD

Continuous integration builds and tests a change on every push. Continuous delivery is the path from that build to a running environment. This module has two kinds of Jenkins material: install and API notes from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops), and two historical pipelines from an internal Adobe Experience Manager build.

## What is in here

| Path | Contents |
| --- | --- |
| `install/jenkins/install.sh` | Debian Jenkins install plus an Apache reverse proxy |
| `install/jenkins/rhel-install.sh` | RHEL-style Jenkins install, firewalld, and printing the initial admin password from the local secrets file |
| `install/jenkins/startJenkins.sh` | Start or restart the Jenkins service |
| `install/jenkins/README.md` | Service commands and examples of the remote access API |
| `jenkins/Jenkinsfile.bato` | A declarative pipeline: Maven builds, Docker image export, and smoke checks against internal sites. Large parts of the file are commented out |
| `jenkins/Jenkinsfile.bsro` | A second pipeline with the same shape, aimed at a different product line |

Jenkins credential IDs in the pipelines were replaced with placeholders (`<aem-admin-credential-id>`, `<git-credential-id>`, `<bato-git-credential-id>`). A Jenkins API token that had been pasted into `install/jenkins/README.md` was replaced with `JENKINS_API_TOKEN`, and the example host was changed to `jenkins.example`. Those pipelines still name internal git hosts and site URLs. Read them as case studies. Do not point them at infrastructure you do not own, and do not put a new token back into the file.

## How to run the examples

Reading the pipeline is the useful part. Jenkins will not load these files successfully against the original git hosts.

To see the structure:

```bash
grep -n "stage(" jenkins/Jenkinsfile.bato
```

For a local Jenkins, use a VM and the install script only after you have read it. `rhel-install.sh` opens port 8080 on the host firewall. After install, Jenkins prints an initial admin password on the server; that value belongs in Jenkins, not in git. Then create an empty pipeline job whose Jenkinsfile you write yourself, with no copied credentials.

The API examples in `install/jenkins/README.md` use `curl` against `jenkins.example`. Substitute your own lab URL and a token you just created. Revoke any token that has appeared in a shell history or a chat.

## Practice

1. Draw the stages that are actually active in `jenkins/Jenkinsfile.bato` (ignore the commented blocks). Mark which ones build, which ones deploy, and which ones test.
2. Rewrite the smoke-test idea from that file as a standalone shell script that takes a URL and expects HTTP 200. Run it against a server you started in module 05.
3. Explain `withCredentials` in your own words: what Jenkins stores, what the pipeline sees, and why the credential id in git is not the same thing as the password.
4. Install Jenkins in a lab VM, create a pipeline with one stage that runs `echo hello`, and store the admin password somewhere that is not this repository.
