# 离线部署指南

此目录包含用于在隔离（离线）环境中部署 AFFiNE 的脚本。

## 工作流程

1.  **在可连接互联网的机器上**：
    *   运行 `01-download-images.ps1` 拉取所有必需的 Docker 镜像，并将它们保存为 `.tar` 文件到 `saved-images` 目录中。
    *   将整个 `offline` 文件夹（包含 `saved-images`）复制到你的内网机器上。

2.  **在内网机器上（需可访问 Harbor）**：
    *   编辑 `02-upload-images.ps1`：更新 `$TargetRegistry` 变量为你的 Harbor 项目 URL（例如 `harbor.internal.com/myproject`）。
    *   运行 `02-upload-images.ps1` 加载镜像并推送到你的私有仓库。

3.  **生成 Kubernetes 清单**：
    *   编辑 `03-generate-k8s-yaml.ps1`：更新 `$TargetRegistry` 以匹配步骤 2 中使用的地址。
    *   运行 `03-generate-k8s-yaml.ps1` 在 `../k8s-offline` 中生成一套新的 YAML 文件。

4.  **部署**：
    *   进入 `../k8s-offline` 并按照标准部署步骤操作：
        ```bash
        kubectl apply -f .
        ```
