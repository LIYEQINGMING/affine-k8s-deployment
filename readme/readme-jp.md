<div align="center">
  <img src="https://github.com/toeverything/AFFiNE/raw/master/.github/assets/affine-logo-white.svg" alt="AFFiNE Logo" width="200" />
</div>

<p align="center">
  <a href="/README.md">English</a>
  | 
  <a href="/readme/readme-jp.md">日本語</a>
  | 
  <a href="/readme/readme-zh-cn.md">简体中文</a>
  | 
  <a href="/readme/readme-zh-tw.md">繁體中文</a>
</p>

<b>このリポジトリは、AFFiNE（オープンソースのオールインワンワークスペース）をセルフホストするための完全なKubernetesマニフェストとオフラインデプロイスクリプトを提供します。標準のオンラインデプロイとエアギャップ（オフライン）環境の両方をサポートしています。</b>

<br>

✨ KubernetesでのAFFiNEのセルフホストデプロイを簡素化します

<br>

# 💌 なぜこのデプロイメントガイドを作成したのか
AFFiNEは優れたDocker Composeガイドを提供していますが、本番環境のKubernetesクラスター、特に外部インターネットアクセスのないエアギャップ（イントラネット）環境へのデプロイには多大な労力が必要です。このリポジトリは、オフラインのイメージ管理をサポートする本番環境対応のKubernetesセットアップを提供することで、そのギャップを埋めることを目的としています。

<br>

# ✨ クイックスタート

<a href="../k8s/README.md">オンラインデプロイガイド</a> | <a href="../offline/README.md">オフラインデプロイガイド</a>

<br>

# 🔥 特徴
<table>
  <tr>
    <th>
      フルスタックデプロイ
    </th>
    <th>
      オフラインサポート
    </th>
  </tr>
  <tr>
    <td width="50%">
      AFFiNEサーバー、PostgreSQL（pgvector対応）、Redis、Prometheusモニタリングがすぐに使用可能。
    </td>
    <td width="50%">
      イメージのダウンロード、パッケージ化、プライベートレジストリ（Harbor）へのアップロードを自動化するPowerShellスクリプトを提供。
    </td>
  </tr>
  <tr>
    <th>
      本番環境対応
    </th>
    <th>
      モニタリングの統合
    </th>
  </tr>
  <tr>
    <td width="50%">
      PersistentVolumeClaims (PVC)、動的なStorageClassの適応、ノードアフィニティで構成されています。
    </td>
    <td width="50%">
      メトリクス収集とシステムの可観測性のためのPrometheusマニフェストが組み込まれています。
    </td>
  </tr>
</table>

<br>

# 💌 AFFiNEについて
AFFiNEアプリケーション自体の詳細については、公式リポジトリにアクセスしてください：

- 公式サイト: [https://affine.pro](https://affine.pro)
- GitHubリポジトリ: [toeverything/AFFiNE](https://github.com/toeverything/AFFiNE)
- 公式ドキュメント: [https://docs.affine.pro](https://docs.affine.pro)

<br>

🙏 このような素晴らしいワークスペースツールを作成してくれたAFFiNEチームに感謝します！このデプロイメントリポジトリは、Kubernetesユーザーが自身のインスタンスをより簡単に導入およびホストできるようにすることを目的としています。🎉
