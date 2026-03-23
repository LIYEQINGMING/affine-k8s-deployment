# AFFiNE on Kubernetes

This directory contains Kubernetes manifests to deploy AFFiNE.

## Prerequisites

- A Kubernetes cluster with a **Default StorageClass** configured (for dynamic volume provisioning).
- `kubectl` configured.
- An Ingress Controller (e.g., Nginx) installed (optional, but recommended).

## Configuration

1.  **Edit `01-config.yaml`**:
    *   Change `DB_PASSWORD` and `POSTGRES_PASSWORD` in the `Secret` section to strong passwords.
    *   Adjust other configurations in `ConfigMap` if needed.

2.  **Storage Configuration**:
    *   The `02-storage.yaml` is configured to use the `nfs-client` StorageClass.
    *   **CRITICAL**: If your cluster uses a different storage class name (e.g., `nfs-client-re`, `managed-nfs-storage`, etc.), you MUST edit `02-storage.yaml` and update the `storageClassName` field.

3.  **Edit `06-ingress.yaml`** (Optional):
    *   By default, it is configured to accept traffic from any host (IP).
    *   If you have a domain, add `host: your.domain.com` under `rules`.

## Deployment Steps

Run the following command to apply all manifests (including namespace):

```bash
kubectl apply -f k8s/
```

Or apply them one by one:

```bash
kubectl apply -f k8s/00-namespace.yaml
kubectl apply -f k8s/01-config.yaml
kubectl apply -f k8s/02-storage.yaml
kubectl apply -f k8s/03-postgres.yaml
kubectl apply -f k8s/04-redis.yaml
kubectl apply -f k8s/05-affine.yaml
kubectl apply -f k8s/06-ingress.yaml
kubectl apply -f k8s/07-monitoring.yaml
```

## Accessing AFFiNE

You have two ways to access the service:

1.  **Via NodePort (Recommended for IP access)**:
    *   Use `http://<Any-Node-IP>:30010`
    *   This port is fixed to `30010` in `05-affine.yaml`.

2.  **Via Ingress**:
    *   Use `http://<Ingress-Controller-IP>/`
    *   Since no host is specified in `06-ingress.yaml`, it will match any IP accessing the Ingress Controller.

## Data Persistence & Disaster Recovery

### Preventing Data Loss on Namespace Deletion
By default, deleting a namespace or a PersistentVolumeClaim (PVC) might result in the underlying PersistentVolume (PV) and its data being deleted, depending on your StorageClass `reclaimPolicy` (which is often set to `Delete`).

To prevent accidental data loss:
1.  We have added `helm.sh/resource-policy: keep` annotations to the PVCs in `02-storage.yaml`. This helps if you ever migrate to Helm.
2.  **Crucial Step**: Ensure your StorageClass `nfs-client-re` (or whichever you use) has `reclaimPolicy: Retain`. You can check this by running:
    ```bash
    kubectl get sc nfs-client-re
    ```
    If it says `Delete`, you should patch your PVs to retain data:
    ```bash
    kubectl patch pv <your-pv-name> -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
    ```

### Recovering Data
If your namespace or PostgreSQL pod is deleted but the PV was retained:
1. Re-apply the `02-storage.yaml`. The new PVCs will be created.
2. If the new PVCs create new empty PVs instead of binding to the old ones, you will need to manually map the old PVs to the new PVCs or copy the data from the old NFS path to the new NFS path created by the provisioner.

## Namespace

All resources are deployed in the `affine` namespace. You can verify this by running:

```bash
kubectl get pods -n affine
```

## Verification

Check the status of the pods:

```bash
kubectl get pods -n affine
```

Check the logs of the Affine server:

```bash
kubectl logs -l app=affine,component=server -n affine
```
