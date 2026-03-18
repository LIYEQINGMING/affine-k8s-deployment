<p align="center">
  <a href="/README.md">English</a>
  | 
  <a href="/readme/readme-jp.md">日本語</a>
  | 
  <a href="/readme/readme-zh-cn.md">简体中文</a>
  | 
  <a href="/readme/readme-zh-tw.md">繁體中文</a>
</p>

<b>This repository provides a complete set of Kubernetes manifests and offline deployment scripts for self-hosting AFFiNE (an open-source, all-in-one workspace). It supports both standard online deployment and air-gapped (offline) environments.</b>

<br />

✨ Simplify your self-hosted AFFiNE deployment on Kubernetes

<br />

# 💌 Why we created this deployment guide

While AFFiNE provides an excellent Docker Compose guide, deploying it to a production Kubernetes cluster, especially in an air-gapped (offline) environment, requires significant effort. This repository bridges that gap by providing a production-ready Kubernetes setup with offline image management support.

<br />

# ✨ Quick Start

<a href="k8s/README.md">Online Deployment Guide</a> | <a href="offline/README.md">Offline Deployment Guide</a>

<br />

# 🔥 Features

<table>
  <tr>
    <th>
      Full Stack Deployment
    </th>
    <th>
      Offline Support
    </th>
  </tr>
  <tr>
    <td width="50%">
      Includes AFFiNE Server, PostgreSQL (with pgvector), Redis, and Prometheus monitoring out of the box.
    </td>
    <td width="50%">
      Automated PowerShell scripts to download, package, and upload images to a private registry (Harbor).
    </td>
  </tr>
  <tr>
    <th>
      Production Ready
    </th>
    <th>
      Monitoring Integrated
    </th>
  </tr>
  <tr>
    <td width="50%">
      Configured with PersistentVolumeClaims (PVC), specific StorageClass configurations, and node affinity.
    </td>
    <td width="50%">
      Integrated Prometheus manifests for metrics collection and system observability.
    </td>
  </tr>
</table>

<br />

# 💌 About AFFiNE

To learn more about the AFFiNE application itself, please visit the official repositories:

- Official Website: <https://affine.pro>
- GitHub Repository: [toeverything/AFFiNE](https://github.com/toeverything/AFFiNE)
- Official Documentation: <https://docs.affine.pro>

<br />

🙏 Thanks to the AFFiNE team for creating such a wonderful workspace tool! This deployment repository aims to make it easier for Kubernetes users to adopt and host their own instances. 🎉
