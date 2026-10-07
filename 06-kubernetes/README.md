# 06. Kubernetes

Kubernetes schedules containers across a cluster. You do not need a cluster to learn the client. This module is the `kubectl` install note consolidated from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops). It does not include manifests, a cluster installer, or application deployments.

## What is in here

`kubectl/install.sh` does two things, and it does both of them:

1. Download the `kubectl` binary that the old `storage.googleapis.com/kubernetes-release` stable channel points at, mark it executable, and move it to `/usr/local/bin`.
2. Write a yum repo for the EL7 Kubernetes packages and install `kubectl` again with `yum`.

The script needs root for the copy into `/usr/local/bin` and for yum. The Google storage URL and the EL7 repo are frozen in time. On a current distribution, install `kubectl` from the Kubernetes project's current instructions or from your distro packages, and treat this script as a historical example of automating that install.

## How to run the examples

Check what the script would change before you run it:

```bash
less kubectl/install.sh
```

If you have a cluster you are allowed to use (minikube, kind, or a cloud cluster of your own):

```bash
kubectl version --client
kubectl config get-contexts
kubectl get nodes
```

Do not point `kubectl` at a cluster you do not administer. A kubeconfig is a credential.

## Practice

1. Rewrite `kubectl/install.sh` so it installs only the client, only for your user (no `/usr/local` and no yum repo), and so it checks the binary's checksum. Use the current Kubernetes release notes for the checksum URL.
2. Explain the difference between `kubectl version --client` and a server version. What can you learn with no cluster at all?
3. Write a one-page note, in your own words, of the objects you would need for a single web container: Namespace, Deployment, Service. You do not need to apply them for this exercise.
4. List three things this script does not configure (cluster, RBAC, network policy) and why an install of `kubectl` is not a cluster.
