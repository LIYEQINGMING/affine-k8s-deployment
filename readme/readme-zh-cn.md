<p align="center">
  <a href="/README.md">English</a>
  | 
  <a href="/readme/readme-jp.md">日本語</a>
  | 
  <a href="/readme/readme-zh-cn.md">简体中文</a>
  | 
  <a href="/readme/readme-zh-tw.md">繁體中文</a>
</p>

<b>本项目提供了一套完整的 Kubernetes 资源清单和离线部署脚本，用于自托管部署 AFFiNE（一款开源的一体化工作空间）。支持标准的在线部署以及隔离网络（离线）环境部署。</b>

<br>

✨ 让 AFFiNE 的 Kubernetes 部署变得简单、标准化

<br>

# 💌 我们为什么打造这套部署方案
虽然 AFFiNE 官方提供了优秀的 Docker Compose 部署指南，但在生产级 Kubernetes 集群中部署，尤其是在无外网访问的隔离（内网）环境中，往往需要耗费大量精力。本项目旨在填补这一空白，提供一套生产就绪的 K8s 部署架构，并完美支持离线镜像管理。

<br>

# ✨ 快速开始

<a href="../k8s/README.md">在线部署指南</a> | <a href="../offline/README.md">内网离线部署指南</a>

<br>

# 🔥 特性
<table>
  <tr>
    <th>
      全栈完整部署
    </th>
    <th>
      内网离线支持
    </th>
  </tr>
  <tr>
    <td width="50%">
      开箱即用的 AFFiNE Server、PostgreSQL (集成 pgvector)、Redis 以及 Prometheus 监控。
    </td>
    <td width="50%">
      提供自动化 PowerShell 脚本，一键实现外网镜像下载、打包及内网私有仓库（Harbor）上传。
    </td>
  </tr>
  <tr>
    <th>
      生产级就绪
    </th>
    <th>
      可观测性集成
    </th>
  </tr>
  <tr>
    <td width="50%">
      完善的持久化卷声明 (PVC)、动态 StorageClass 适配以及节点亲和性（Node Affinity）配置。
    </td>
    <td width="50%">
      内置 Prometheus 监控清单，方便接入现有监控体系，实时掌握系统状态。
    </td>
  </tr>
</table>

<br>

# 💌 关于 AFFiNE
了解更多关于 AFFiNE 应用程序本身的信息，请访问官方渠道：

- 官方网站: [https://affine.pro](https://affine.pro)
- GitHub 仓库: [toeverything/AFFiNE](https://github.com/toeverything/AFFiNE)
- 官方文档: [https://docs.affine.pro](https://docs.affine.pro)

<br>

🙏 衷心感谢 AFFiNE 团队创造了如此出色的工作空间工具！本部署仓库致力于让 Kubernetes 用户能更轻松地拥有和管理属于自己的 AFFiNE 实例。🎉
