# Deploy a Kubernetes cluster in GCP backed by Flux

Welcome to a highly opinionated template for deploying a single or more ([gke](https://cloud.google.com/kubernetes-engine)) Kubernetes clusters with [Terraform](https://opentf.org/) and using [Flux](https://toolkit.fluxcd.io) to manage its state.

## 👋 Introduction

The goal of this project is to make it easy for people interested in learning Kubernetes to deploy a basic cluster at GCP and become familiar with the GitOps tool Flux.

This template implements Flux in a way that promotes legibility and ease of use for those who are new (or relatively new) to the technology and GitOps in general. It assumes a typical gke setup: namely, a single "gke prod" cluster running mostly third-party apps.

## ✨ Features

## 📝 Pre-start checklist

Before we get started everything below must be taken into consideration, you must...

- [ ] bring a **positive attitude** and be ready to learn and fail a lot. _The more you fail, the more you can learn from._

## 💻 GKE Cluster ...

TODO


## 🚀 Getting Started

Once you have installed Debian on your nodes, there are 6 stages to getting a Flux-managed cluster up and runnning.

### 🎉 Stage 1: Create a Git repository

1. Create a new **public** repository by clicking the big green "Use this template" button at the top of this page.

2. Clone **your new repo** to you local workstation and `cd` into it.

📍 _**All commands** during the setup process are run on your **local workstation** within your repository directory_

### 🌱 Stage 2: Set up your local environment

📍 _Let's get the required workstation tools installed and configured._

1. Install the most recent version of [task](https://taskfile.dev/)

    📍 _See the task [installation docs](https://taskfile.dev/installation/) for other platforms_

  TODO

2. Install the most recent version of [direnv](https://direnv.net/)

    📍 _See the direnv [installation docs](https://direnv.net/docs/installation.html) for other platforms_

    📍 _After installing `direnv` be sure to [hook it into your shell](https://direnv.net/docs/hook.html) and after that is done run `direnv allow` while in your repos directory._

  TODO

3. Setup a Python virual env and install Ansible by running the following task command.

    📍 _This commands requires Python 3.8+ to be installed_

    ```sh
    # Platform agnostic
    task deps
    ```

4. Install the required tools: [age](https://github.com/FiloSottile/age), [flux](https://toolkit.fluxcd.io/), [cloudflared](https://github.com/cloudflare/cloudflared), [kubectl](https://kubernetes.io/docs/tasks/tools/), [sops](https://github.com/getsops/sops)

TODO

### 🔧 Stage 3: Do bootstrap configuration

TODO

### ⚡ Stage 4: Prepare your gke configuration

TODO

### ⛵ Stage 5: Use Terraform to install gke

TODO

### 🔹 Stage 6: Install Flux in your cluster

📍 _Here we will be installing [flux](https://fluxcd.io/flux/) after some quick bootstrap steps._

TODO

### 🎤 Verification Steps


## 📣 Post installation


#### 🪝 Github Webhook

TODO

3. Navigate to the settings of your repository on Github, under "Settings/Webhooks" press the "Add webhook" button. Fill in the webhook url and your `bootstrap_flux_github_webhook_token` secret and save.

### 🤖 Renovate

[Renovate](https://www.mend.io/renovate) is a tool that automates dependency management. It is designed to scan your repository around the clock and open PRs for out-of-date dependencies it finds. Common dependencies it can discover are Helm charts, container images, GitHub Actions, Ansible roles... even Flux itself! Merging a PR will cause Flux to apply the update to your cluster.

To enable Renovate, click the 'Configure' button over at their [Github app page](https://github.com/apps/renovate) and select your repository. Renovate creates a "Dependency Dashboard" as an issue in your repository, giving an overview of the status of all updates. The dashboard has interactive checkboxes that let you do things like advance scheduling or reattempt update PRs you closed without merging.

The base Renovate configuration in your repository can be viewed at [.github/renovate.json5](https://github.com/onedr0p/flux-cluster-template/blob/main/.github/renovate.json5). By default it is scheduled to be active with PRs every weekend, but you can [change the schedule to anything you want](https://docs.renovatebot.com/presets-schedule), or remove it if you want Renovate to open PRs right away. It is also configured to [automerge some updates](https://github.com/onedr0p/flux-cluster-template/blob/main/.github/renovate/autoMerge.json5).

## 🐛 Debugging

Below is a general guide on trying to debug an issue with an resource or application. For example, if a workload/resource is not showing up or a pod has started but in a `CrashLoopBackOff` or `Pending` state.

TODO

Resolving problems that you have could take some tweaking of your YAML manifests in order to get things working, other times it could be a external factor like permissions on NFS. If you are unable to figure out your problem see the help section below.

## 👉 Help

- Make a post in this repository's Github [Discussions](https://github.com/onedr0p/flux-cluster-template/discussions).
- Start a thread in the `support` or `flux-cluster-template` channel in the [k8s@home](https://discord.gg/k8s-at-home) Discord server.

## ❔ What's next

The cluster is your oyster (or something like that). Below are some optional considerations you might want to review.

#### Ship it

To browse or get ideas on applications people are running, community member [@whazor](https://github.com/whazor) created [this website](https://nanne.dev/k8s-at-home-search/) as a creative way to search Flux HelmReleases across Github.

#### Storage

TODO

#### Authenticate Flux over SSH

TODO

10. Optionally set your repository to Private in your repository settings.

</details>

## 🤝 Thanks

Big shout out to all the contributors, sponsors and everyone else who has helped on this project.
