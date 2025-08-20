---
title: Deploy specific Defender for Containers components on GCP (GKE) via portal
description: Learn how to deploy individual Microsoft Defender for Containers components on Google Kubernetes Engine clusters when you already have the plan enabled.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy specific Defender for Containers components on GCP (GKE) via portal

This article explains how to deploy specific Defender for Containers components on your GKE clusters when you already enabled the plan but need to add or fix individual components.

## When to use this guide

Use this guide if you:

- Already enabled Defender for Containers but some components are missing
- Want to deploy to specific clusters only
- Need to troubleshoot failed component deployments
- Want to exclude certain clusters from protection
- Need to enable Binary Authorization or other specific features

If you're setting up Defender for Containers for the first time, see [Enable all Defender for Containers components on GCP (GKE)](defender-for-containers-gcp-enable-all-portal.md).

## Prerequisites

- GCP connector already created in Defender for Cloud
- Defender for Containers plan enabled on your subscription
- Service account and permissions already configured
- Some or all GKE clusters already connected to Azure Arc

## Check component status

1. Go to **Environment settings** in Defender for Cloud.
1. Select your GCP connector.
1. Select **Containers** to view component status.
1. Review each component:
   - **K8S API access** - Cluster discovery
   - **Registry access** - GCR/Artifact Registry scanning
   - **Auto provision Defender's sensor** - Runtime protection
   - **Auto provision Azure Policy** - Compliance monitoring

## Deploy missing components

### Connect specific GKE clusters to Azure Arc

For clusters that you didn't connect yet:

1. Go to **Recommendations**.
1. Search for "GKE clusters should be connected to Azure Arc".
1. Select the recommendation.
1. Filter clusters by:
   - Project
   - Region
   - Labels
1. Select specific clusters to connect.
1. Select **Fix** and run the provided script.

### Deploy the Defender sensor

The Defender sensor provides runtime protection for your GKE clusters:

#### Deploy to specific GKE clusters

1. Go to **Recommendations**.
1. Search for "GKE clusters should have Microsoft Defender's extension for Azure Arc installed".
1. Select clusters missing the sensor.
1. Select **Fix**.
1. Configure deployment options:
   - Log Analytics workspace
   - Resource limits
   - Monitoring scope
1. Apply the deployment.

#### Deploy via Arc portal

1. Navigate to your Arc-connected GKE cluster.
1. Select **Extensions** > **+ Add**.
1. Select **Microsoft Defender for Containers**.
1. Configure:
   - Enable runtime protection
   - Set resource allocation
   - Configure exclusions
1. Select **Create**.

#### Verify sensor deployment

```bash
# Check pods
kubectl get pods -n kube-system -l app=microsoft-defender

# View DaemonSet
kubectl get daemonset -n kube-system microsoft-defender-sensor

# Check extension status
az k8s-extension show \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name CLUSTER_NAME \
  --resource-group RESOURCE_GROUP
```

### Enable specific GCP features

#### Binary Authorization

To enable the Binary Authorization integration:

1. Go to your GCP connector settings.
1. Select **Containers** > **Advanced settings**.
1. Turn on **Binary Authorization**.
1. Set up attestation requirements.

```yaml
attestationAuthorityNote:
  noteReference: projects/PROJECT_ID/notes/defender-note
  publicKeys:
    - id: defender-key
      pkixPublicKey:
        publicKeyPem: |
          -----BEGIN PUBLIC KEY-----
          ...
          -----END PUBLIC KEY-----
```

#### GKE Autopilot support

For Autopilot clusters:

1. Enable **Workload Identity**.
1. Set node auto-upgrade windows.
1. Set resource limits.

## Configure component settings

### Scanning configuration

Set up the registries to scan:

1. Go to **Environment settings** > GCP connector > **Containers**.
1. Select **Registry scanning settings**.
1. Set up the following options:
   - Include patterns: `gcr.io/PROJECT_ID/prod-*`
   - Exclude patterns: `gcr.io/PROJECT_ID/test-*`
   - Scan frequency: Daily/Weekly/Continuous

### Exclude clusters from protection

To exclude specific clusters:

1. Add label to GKE cluster:

   ```bash
   gcloud container clusters update CLUSTER_NAME \
     --update-labels=defender-exclude=true
   ```

1. Or use namespace exclusions:

   ```yaml
   apiVersion: v1
   kind: Namespace
   metadata:
     name: development
     labels:
       microsoft-defender-exclude: "true"
   ```

## Deploy by cluster properties

### By region

Deploy only to specific regions:

1. In the Arc connection recommendation
1. Filter by location:
   - us-central1
   - europe-west1
   - asia-southeast1

### By GKE version

Deploy to clusters with specific versions:

1. Filter recommendations by GKE version
1. Prioritize older versions for security updates

## Verify component deployment

Check deployment status:

1. **Cluster discovery**: Sees all GKE clusters in inventory
1. **Registry scanning**: Check scan results in **Container registries**
1. **Runtime protection**: Verify alerts are generated
1. **Policy compliance**: Review compliance dashboard

### Verify via CLI

```bash
# Check Arc connection
kubectl get nodes -o wide

# Verify Defender sensor
kubectl get pods -n mdc -l app=microsoft-defender

# Check extension status
az k8s-extension show \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name CLUSTER_NAME \
  --resource-group RESOURCE_GROUP
```

## Troubleshooting

### Component shows unhealthy

1. Check GCP permissions:

   ```bash
   gcloud projects get-iam-policy PROJECT_ID \
     --flatten="bindings[].members" \
     --filter="bindings.members:serviceAccount:microsoft-defender*"
   ```

1. Verify Workload Identity:

   ```bash
   kubectl get serviceaccount -n mdc defender-sensor -o yaml
   ```

### Registry scanning not working

1. Verify registry permissions
1. Check network connectivity from scanner to registry
1. Ensure Artifact Registry API is enabled

### Clusters not appearing

1. Check K8S API access is enabled
1. Verify service account has `container.viewer` role
1. Check GCP project is correct in connector

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Enable all components](defender-for-containers-gcp-enable-all-portal.md) - For fresh installations
- [Deploy sensor using Helm as an alternative](deploy-helm.md)
