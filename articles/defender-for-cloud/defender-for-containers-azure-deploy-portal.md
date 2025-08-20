---
title: Deploy specific Defender for Containers components on Azure (AKS) via portal
description: Learn how to deploy individual Microsoft Defender for Containers components on Azure Kubernetes Service clusters when you already have the plan enabled.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy specific Defender for Containers components on Azure (AKS) via portal

This article explains how to deploy specific Defender for Containers components on your AKS clusters when you already enabled the plan but need to add or fix individual components.

## When to use this guide

Use this guide if you:

- Already enabled Defender for Containers but some components are missing
- Want to deploy to specific clusters only
- Need to troubleshoot failed component deployments
- Want to configure custom settings for specific clusters
- Need to exclude certain clusters from protection

If you're setting up Defender for Containers for the first time, see [Enable all Defender for Containers components on Azure (AKS)](defender-for-containers-azure-enable-all-portal.md).

## Prerequisites

- Defender for Containers plan already enabled on your subscription
- Appropriate Azure RBAC permissions (Security Admin or Contributor)
- AKS clusters already deployed

## Check component status

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your subscription.
1. Select **Defender plans**.
1. Next to **Containers**, select **Settings**.
1. Review component status:
   - ✅ Enabled and deployed
   - ⚠️ Enabled but not deployed to all clusters
   - ❌ Disabled or failed

## Deploy missing components

### Deploy Defender sensor to specific clusters

If the Defender sensor is missing from some clusters:

1. Go to **Recommendations**.
1. Search for "Azure Kubernetes Service clusters should have Defender profile enabled".
1. Select the recommendation.
1. Select specific clusters that need the sensor.
1. Select **Fix**.

### Enable Azure Policy Add-on

To deploy Azure Policy to specific clusters:

1. Go to the AKS cluster in the Azure portal.
1. Select **Policies** under **Settings**.
1. Select **Enable Azure Policy**.
1. Configure the policy settings:
   - Enforcement mode: Enforce or Audit
   - Policy initiatives to assign

### Configure vulnerability assessment

For specific registries:

1. Go to **Environment settings** > Subscription > **Containers**.
1. Make sure **Container registries vulnerability assessment** is On.
1. To configure specific registries:
   - Go to your container registry
   - Select **Security** > **Defender for Cloud**
   - Configure the scan settings

## Configure component settings

### Custom Log Analytics workspace

To use a custom workspace for specific clusters:

1. Go to the AKS cluster.
1. Select **Monitoring** > **Diagnostic settings**.
1. Add or edit a diagnostic setting.
1. Select your custom Log Analytics workspace.
1. Enable the required log categories:
   - `kube-audit-admin`
   - `guard`

### Configure auto-provisioning

To control which clusters get components:

1. Go to **Environment settings** > **Auto provisioning**.
1. For **Container sensor**, select **Edit configuration**.
1. Configure:
   - Inclusion tags: `Environment:Production`
   - Exclusion tags: `DefenderExclude:True`

## Deploy by resource properties

### By resource group

Deploy to clusters in specific resource groups:

1. Use Azure Policy to target resource groups.
1. Create custom initiatives scoped to resource groups.
1. Apply Defender components via policy.

### By tags

Deploy based on cluster tags:

```json
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.ContainerService/managedClusters"
      },
      {
        "field": "tags['Environment']",
        "equals": "Production"
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.ContainerService/managedClusters/securityProfiles",
      "deployment": {
        "properties": {
          "template": {
            // Defender deployment template
          }
        }
      }
    }
  }
}
```

### By region

Deploy to clusters in specific regions:

1. Filter recommendations by location.
1. Use Azure Policy with location conditions.
1. Apply fixes selectively by region.

## Exclude clusters from protection

To exclude specific clusters, use one of the following methods:

1. **Using tags**:
   - Add the tag `DefenderForContainersExclude: True` to the AKS cluster.

1. **Using policy exemptions**:
   - Create a policy exemption for specific clusters.
   - Set the scope to a resource or resource group.

1. **Disable monitoring**:

   ```azurecli
   az aks update \
     --name <cluster-name> \
     --resource-group <resource-group> \
     --disable-defender
   ```

## Verify deployment

### Portal verification

1. Check **Inventory** > **Containers** for protected clusters.
1. Review **Recommendations** - it should show "Healthy".
1. Check **Security alerts** for activity.

### Cluster verification

```bash
# Check Defender status
az aks show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query securityProfile.defender

# Verify on cluster
kubectl get pods -n kube-system -l component=microsoft-defender
```

## Troubleshooting

### Component deployment fails

1. **Check AKS version**: Ensure the cluster uses a supported version.
1. **Review permissions**: Verify the managed identity has the required roles.
1. **Check quotas**: Ensure sufficient resources in the cluster.
1. **Network policies**: Verify egress to required endpoints.

### Sensor unhealthy

1. Check pod logs.

   ```bash
   kubectl logs -n kube-system -l component=microsoft-defender
   ```

1. Verify connectivity to:
   - `*.ods.opinsights.azure.com`
   - `*.oms.opinsights.azure.com`

### Policy not applying

1. Check Policy Add-on status.
1. Verify policy assignments.
1. Review policy compliance results.
1. Check for policy exemptions.

## Deploy the Defender sensor

The Defender sensor is essential for runtime threat detection. Deploy it to all or specific clusters:

### Deploy to all AKS clusters

1. Go to **Recommendations**.

1. Search for "Azure Kubernetes Service clusters should have Defender profile enabled".

1. Select the recommendation.

1. Select all affected clusters.

1. Select **Fix** to enable the Defender profile.

### Deploy sensor to specific clusters

1. Go to your AKS cluster.

1. Under **Settings**, select **Defender**.

1. Select **Enable Microsoft Defender for Containers**.

1. Configure settings:
   - Enable runtime protection
   - Configure resource limits
   - Set namespace exclusions

1. Select **Save**.

### Verify sensor deployment

```bash
# Check Defender profile
az aks show -g <resource-group> -n <cluster-name> --query securityProfile.defender

# Check pods
kubectl get pods -n kube-system -l app=microsoft-defender
```

## Deploy Azure Policy for Kubernetes

If you need security recommendations and compliance information, follow these steps:

1. Make sure the Azure Policy Add-on is enabled for your AKS cluster.

1. Go to **Recommendations** in Microsoft Defender for Cloud.

1. Search for "Kubernetes clusters should have Azure Policy enabled".

1. Select the recommendation.

1. Select specific clusters or all clusters.

1. Select **Fix** to apply the policy.

### Verify policy deployment

```bash
# Check policy assignment
az policy assignment list --scope /subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.ContainerService/managedClusters/<cluster-name>

# Check compliance
az policy state list --policy <policy-definition-name> --scope /subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.ContainerService/managedClusters/<cluster-name>
```

## Next steps

- [Verify complete deployment](defender-for-containers-azure-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-azure-configure.md)
- [Enable all components](defender-for-containers-azure-enable-all-portal.md) - For fresh installations
- [Deploy using Helm instead of portal](deploy-helm.md)
