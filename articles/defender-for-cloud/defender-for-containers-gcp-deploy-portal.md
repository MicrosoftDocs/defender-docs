---
title: Deploy specific Defender for Containers components on GCP (GKE) via portal
description: Learn how to deploy individual Microsoft Defender for Containers components on Google Kubernetes Engine clusters when you already have the plan enabled.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy specific Defender for Containers components on GCP (GKE) via portal

This article explains how to deploy specific Defender for Containers components on your GKE clusters when you already have the plan enabled but need to add or fix individual components.

## When to use this guide

Use this guide if you:
- Already have Defender for Containers enabled but some components are missing
- Want to deploy to specific clusters only
- Need to troubleshoot failed component deployments
- Want to exclude certain clusters from protection
- Need to enable Binary Authorization or other specific features

If you're setting up Defender for Containers for the first time, see [Enable all Defender for Containers components on GCP (GKE)](defender-for-containers-gcp-enable-all-portal.md).

## Prerequisites

- GCP connector already created in Defender for Cloud
- Defender for Containers plan enabled on your subscription
- Service account and permissions already configured
- Some or all GKE clusters may already be connected to Azure Arc

## Check component status

1. Navigate to **Environment settings** in Defender for Cloud.
2. Select your GCP connector.
3. Select **Containers** to view component status.
4. Review each component:
   - **K8S API access** - Cluster discovery
   - **Registry access** - GCR/Artifact Registry scanning
   - **Auto provision Defender's sensor** - Runtime protection
   - **Auto provision Azure Policy** - Compliance monitoring

## Deploy missing components

### Connect specific GKE clusters to Azure Arc

For clusters not yet connected:

1. Go to **Recommendations**.
2. Search for "GKE clusters should be connected to Azure Arc".
3. Select the recommendation.
4. Filter clusters by:
   - Project
   - Region
   - Labels
5. Select specific clusters to connect.
6. Select **Fix** and run the provided script.

### Deploy Defender sensor to specific clusters

1. Go to **Recommendations**.
2. Search for "GKE clusters should have Microsoft Defender's extension for Azure Arc installed".
3. Select clusters missing the sensor.
4. Select **Fix**.

### Enable specific GCP features

#### Binary Authorization

To enable Binary Authorization integration:

1. Navigate to your GCP connector settings.
2. Select **Containers** > **Advanced settings**.
3. Enable **Binary Authorization**.
4. Configure attestation requirements:

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

1. Ensure **Workload Identity** is enabled
2. Configure node auto-upgrade windows
3. Set resource limits appropriately

## Configure component settings

### Scanning configuration

Configure which registries to scan:

1. Navigate to **Environment settings** > GCP connector > **Containers**.
2. Select **Registry scanning settings**.
3. Configure:
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

2. Or use namespace exclusions:
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
2. Filter by location:
   - us-central1
   - europe-west1
   - asia-southeast1

### By GKE version

Deploy to clusters with specific versions:

1. Filter recommendations by GKE version
2. Prioritize older versions for security updates

## Verify component deployment

Check deployment status:

1. **Cluster discovery**: Should see all GKE clusters in inventory
2. **Registry scanning**: Check scan results in **Container registries**
3. **Runtime protection**: Verify alerts are being generated
4. **Policy compliance**: Review compliance dashboard

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

2. Verify Workload Identity:
   ```bash
   kubectl get serviceaccount -n mdc defender-sensor -o yaml
   ```

### Registry scanning not working

1. Verify registry permissions
2. Check network connectivity from scanner to registry
3. Ensure Artifact Registry API is enabled

### Clusters not appearing

1. Check K8S API access is enabled
2. Verify service account has `container.viewer` role
3. Check GCP project is correct in connector

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Enable all components](defender-for-containers-gcp-enable-all-portal.md) - For fresh installations
