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

# 🛡️ データの永続性と災害復旧

### データ損失の防止
デフォルトでは、名前空間または PersistentVolumeClaim (PVC) を削除すると、基盤となる PersistentVolume (PV) とそのデータも削除される可能性があります。これを防ぐには：
1. このリポジトリの PVC には `"helm.sh/resource-policy": keep` アノテーションが設定されています。
2. **重要な手順**: StorageClass の `reclaimPolicy` が `Retain` に設定されていることを確認してください。
    ```bash
    kubectl patch sc <your-storage-class> -p '{"reclaimPolicy":"Retain"}'
    ```
    既存の PV の場合：
    ```bash
    kubectl patch pv <your-pv-name> -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
    ```

### データの復旧
名前空間または PostgreSQL ポッドが削除されたが、PV が保持されている場合：
1. `k8s/02-storage.yaml` を再適用します。新しい PVC と空の PV が作成されます。
2. 古い PV のディレクトリから新しい PV のディレクトリへ、手動でデータをコピー/上書きします。
3. ポッドを再起動してデータを読み込みます。

<br>

# 💌 AFFiNEについて
AFFiNEアプリケーション自体の詳細については、公式リポジトリにアクセスしてください：

- 公式サイト: [https://affine.pro](https://affine.pro)
- GitHubリポジトリ: [toeverything/AFFiNE](https://github.com/toeverything/AFFiNE)
- 公式ドキュメント: [https://docs.affine.pro](https://docs.affine.pro)

<br>

🙏 このような素晴らしいワークスペースツールを作成してくれたAFFiNEチームに感謝します！このデプロイメントリポジトリは、Kubernetesユーザーが自身のインスタンスをより簡単に導入およびホストできるようにすることを目的としています。🎉
