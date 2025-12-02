---
title: Remove Defender for Containers from Azure (AKS)
description: Learn how to disable and remove Microsoft Defender for Containers from your AKS clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Remove Defender for Containers from Azure (AKS)

This article explains how to disable and remove Defender for Containers from your AKS environment.

When you enable Defender for Containers capabilities that use automatic provisioning, or use recommendations to manually deploy container capabilities on specific resources, you install Defender components and extensions in your environment. To help you keep track of these components, the following sections provide tables that show the Defender for Clouds feature and its installed Defender for Container components, extensions, and roles.

If you decide to stop using those capabilities, you might also want to remove these components from your environment. This article helps you understand the actions you can take to remove them.

The components and roles fall under two removal-type categories:

- **Safe to remove** - Resources and settings exclusively used by Defender for Containers. You can safely remove these resources if you're no longer using the associated capability.
- **Shared component** - Resources that might be used by non-Defender for Cloud solutions or by other Defender for Cloud solutions in the target cloud environment. If you disable a shared resource, the other solutions might be negatively affected. Before removing these resources, review if other solutions in that cloud environment need the resource.

> [!IMPORTANT]
> Disabling Defender for Containers removes security protection from your AKS clusters. Make sure you have alternative security measures in place before you proceed.

## Azure scenarios for resources created automatically after enabling Defender for Containers on the subscription

| Offering | Resource |Manual offboarding | Removal information |
|---|---|---|---|
| Workload runtime threat protection | Defender sensor (per cluster inside project) + Arc for Kubernetes | [Defender sensor removal](#remove-the-defender-sensor) | Safe to remove |
| Kubernetes data plane hardening | Azure Policy for Kubernetes | [Delete Arc-enabled resources](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources) | Safe to remove |

## Disable Defender for Containers plan

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select the subscription that contains your AKS clusters.
1. In the Defender plans page, toggle **Containers** to **Off**.
1. Select **Save**.

## Remove Defender components from clusters

### Remove the Defender sensor

To remove the Defender sensor from an AKS cluster:

```azurecli
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --disable-defender
```

### Disable Azure Policy add-on

```azurecli
az aks disable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

## Verify removal

### Check component removal

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No pods should be returned after successful removal.

### Verify plan status

```azurecli
az security pricing show --name 'Containers'
```

The output should show `pricingTier` as `Free`.

## Post-removal considerations

### Security monitoring gaps

When you remove Defender for Containers, your security posture changes significantly:

- Runtime threat detection stops immediately
- Container image vulnerability scanning in ACR stops
- Security recommendations no longer update
- Compliance reporting for standards like CIS Kubernetes Benchmark stops

### Alternative security solutions

To maintain protection for your AKS clusters, consider implementing alternative security measures such as Azure Policy for basic controls, Azure Monitor for observability, or third-party container security platforms.

## Re-enable Defender for Containers

To re-enable Defender for Containers:

1. Follow the deployment guide: [Enable all Defender for Containers components on Azure (AKS)](defender-for-containers-azure-enable-portal.md)
1. All security features are restored.

## Related content

- [Learn more about AKS security](/azure/aks/concepts-security)
- [View the Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)
- [Re-deploy Defender for Containers](defender-for-containers-azure-enable-portal.md)
