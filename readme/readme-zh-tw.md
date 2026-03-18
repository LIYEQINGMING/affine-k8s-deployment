<p align="center">
  <a href="/README.md">English</a>
  | 
  <a href="/readme/readme-jp.md">日本語</a>
  | 
  <a href="/readme/readme-zh-cn.md">简体中文</a>
  | 
  <a href="/readme/readme-zh-tw.md">繁體中文</a>
</p>

<b>本專案提供了一套完整的 Kubernetes 資源清單和離線部署腳本，用於自託管部署 AFFiNE（一款開源的一體化工作空間）。支援標準的在線部署以及隔離網路（離線）環境部署。</b>

<br>

✨ 讓 AFFiNE 的 Kubernetes 部署變得簡單、標準化

<br>

# 💌 我們為什麼打造這套部署方案
雖然 AFFiNE 官方提供了優秀的 Docker Compose 部署指南，但在生產級 Kubernetes 叢集中部署，尤其是在無外網訪問的隔離（內網）環境中，往往需要耗費大量精力。本專案旨在填補這一空白，提供一套生產就緒的 K8s 部署架構，並完美支援離線鏡像管理。

<br>

# ✨ 快速開始

<a href="../k8s/README.md">在線部署指南</a> | <a href="../offline/README.md">內網離線部署指南</a>

<br>

# 🔥 特性
<table>
  <tr>
    <th>
      全端完整部署
    </th>
    <th>
      內網離線支援
    </th>
  </tr>
  <tr>
    <td width="50%">
      開箱即用的 AFFiNE Server、PostgreSQL (整合 pgvector)、Redis 以及 Prometheus 監控。
    </td>
    <td width="50%">
      提供自動化 PowerShell 腳本，一鍵實現外網鏡像下載、打包及內網私有倉庫（Harbor）上傳。
    </td>
  </tr>
  <tr>
    <th>
      生產級就緒
    </th>
    <th>
      可觀測性整合
    </th>
  </tr>
  <tr>
    <td width="50%">
      完善的持久化卷聲明 (PVC)、動態 StorageClass 適配以及節點親和性（Node Affinity）配置。
    </td>
    <td width="50%">
      內建 Prometheus 監控清單，方便接入現有監控體系，即時掌握系統狀態。
    </td>
  </tr>
</table>

<br>

# 💌 關於 AFFiNE
了解更多關於 AFFiNE 應用程式本身的資訊，請訪問官方管道：

- 官方網站: [https://affine.pro](https://affine.pro)
- GitHub 倉庫: [toeverything/AFFiNE](https://github.com/toeverything/AFFiNE)
- 官方文件: [https://docs.affine.pro](https://docs.affine.pro)

<br>

🙏 衷心感謝 AFFiNE 團隊創造了如此出色的工作空間工具！本部署倉庫致力於讓 Kubernetes 用戶能更輕鬆地擁有和管理屬於自己的 AFFiNE 實例。🎉
