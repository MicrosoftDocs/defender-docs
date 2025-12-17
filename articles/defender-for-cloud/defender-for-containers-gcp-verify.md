---
title: Verify Defender for Containers deployment on GCP (GKE)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your GKE clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Defender for Containers deployment on GCP (GKE)

After you enable Defender for Containers, use this article to verify all components are functioning correctly on your GKE clusters.

## Validation checklist

Complete these verification steps in order:

1. [GCP connector shows as connected](#verify-connector-status)
1. [GKE clusters connected to Arc](#verify-arc-connection)
1. [Defender sensor pods running](#verify-sensor-deployment)
1. [Alerts appearing](#view-alerts-for-gke-clusters)

> [!TIP]
> If any validation step fails, see [Common verification issues](#common-verification-issues) or [Configure advanced settings](defender-for-containers-gcp-configure.md) for troubleshooting guidance.

## Verify connector status

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your GCP connector.
1. Verify the following values:
   - Connection status shows as **Connected**.
   - Last sync time is recent (within 15 minutes).
   - Containers plan shows as **On**.

## Verify Arc connection

### Check GKE clusters in Arc

```azurecli
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query connectivityStatus
```

The output should show `Connected`.

## Verify sensor deployment

Check if the Defender sensor pods are running:

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

All pods should show a status of `Running`.

## View alerts for GKE clusters

To view security alerts specifically for your GKE clusters:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select the :::image type="icon" source="media/defender-for-containers-enable-plan-gke/add-filter.png" border="false"::: button.

1. On the **Filter** dropdown menu, select **Resource type**.

1. On the **Value** dropdown menu, select **GCP GKE Cluster**.

1. Select **Ok**.

You should now see only alerts related to your GKE clusters, making it easier to focus on GCP-specific security issues.

## Test security detection

To verify that your Defender for Containers deployment works correctly, simulate security alerts. These simulations trigger real alerts without causing harm to your clusters.

For detailed instructions on generating test alerts and simulating various threat scenarios, see [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

## Common verification issues

### Connector shows disconnected

1. Verify service account permissions in GCP.
1. Check that required APIs are enabled in GCP.

### No security alerts

If you don't see security alerts:

1. Ensure audit logging is enabled on GKE clusters.
1. Verify Defender sensor pods are running.
1. Check that runtime protection is enabled in connector settings.
1. Wait 5-10 minutes after generating test events.

### Missing vulnerability scans

For missing vulnerability scans:

1. Verify registry permissions are configured.
1. Check that you recently pushed images.
1. Ensure you enabled vulnerability scanning in Artifact Registry.
1. Wait up to four hours for initial scans.

### Clusters not appearing

If GKE clusters don't appear:

1. Verify that K8S API access is enabled in the connector.
1. Check that the service account has the `container.viewer` role.
1. Ensure clusters are in the connected GCP project.
1. Wait 15-30 minutes for discovery.

## Related content

- [Configure advanced settings](defender-for-containers-gcp-configure.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
