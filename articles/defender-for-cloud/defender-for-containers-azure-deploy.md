---
title: Deploy Defender for Containers on Azure (AKS)
description: Learn how to enable Microsoft Defender for Containers on Azure Kubernetes Service (AKS) clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on Azure (AKS)

This article explains how to enable Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters.

## Prerequisites

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

- AKS cluster running version 1.19 or later
- Contributor role on the subscription or resource group

## Enable Defender for Containers

You can enable Defender for Containers using the Azure portal, Azure CLI, PowerShell, or ARM templates.

### [Azure portal](#tab/azure-portal)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the subscription where your AKS clusters are located.

1. In the Defender plans page, toggle **Containers** to **On**.

1. Select **Settings** next to the Containers plan.

1. Ensure all components are enabled:
   - **Agentless container vulnerability assessment** - On
   - **Agentless discovery for Kubernetes** - On
   - **Container registries vulnerability assessments** - On
   - **Runtime threat protection** - On

1. Select **Continue** and then **Save**.

### [Azure CLI](#tab/azure-cli)

```azurecli
# Enable Defender for Containers on a subscription
az security pricing create \
    --name 'Containers' \
    --tier 'Standard' \
    --subplan 'DefenderForContainersAks'

# Enable all extensions
az security pricing extension create \
    --name 'Containers' \
    --pricing-tier 'Standard' \
    --extension-name 'AgentlessContainerVulnerabilityAssessment' \
    --extension-value '{"isEnabled":"true"}'

az security pricing extension create \
    --name 'Containers' \
    --pricing-tier 'Standard' \
    --extension-name 'AgentlessDiscoveryForKubernetes' \
    --extension-value '{"isEnabled":"true"}'

az security pricing extension create \
    --name 'Containers' \
    --pricing-tier 'Standard' \
    --extension-name 'ContainerRegistriesVulnerabilityAssessments' \
    --extension-value '{"isEnabled":"true"}'
```

### [PowerShell](#tab/powershell)

```powershell
# Enable Defender for Containers
Set-AzSecurityPricing `
    -Name "Containers" `
    -PricingTier "Standard"

# Enable extensions
$extensions = @{
    "AgentlessContainerVulnerabilityAssessment" = @{"isEnabled" = "true"}
    "AgentlessDiscoveryForKubernetes" = @{"isEnabled" = "true"}
    "ContainerRegistriesVulnerabilityAssessments" = @{"isEnabled" = "true"}
}

foreach ($ext in $extensions.GetEnumerator()) {
    Set-AzSecurityPricingExtension `
        -Name "Containers" `
        -ExtensionName $ext.Key `
        -ExtensionValue ($ext.Value | ConvertTo-Json)
}
```

### [ARM template](#tab/arm-template)

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "resources": [
        {
            "type": "Microsoft.Security/pricings",
            "apiVersion": "2023-01-01",
            "name": "Containers",
            "properties": {
                "pricingTier": "Standard",
                "subPlan": "DefenderForContainersAks",
                "extensions": [
                    {
                        "name": "AgentlessContainerVulnerabilityAssessment",
                        "isEnabled": "true"
                    },
                    {
                        "name": "AgentlessDiscoveryForKubernetes",
                        "isEnabled": "true"
                    },
                    {
                        "name": "ContainerRegistriesVulnerabilityAssessments",
                        "isEnabled": "true"
                    }
                ]
            }
        }
    ]
}
```

---

## Deploy the Defender sensor

After enabling Defender for Containers, the Defender sensor is automatically deployed to your AKS clusters through Azure Policy. This process typically takes 5-10 minutes.

### Manual deployment (if needed)

If automatic deployment doesn't occur, you can manually deploy the sensor:

```azurecli
# Get the Defender sensor deployment YAML
curl -o defender-sensor.yaml https://aka.ms/defender-for-containers-sensor-aks

# Apply to your cluster
kubectl apply -f defender-sensor.yaml
```

## Enable Azure Policy for Kubernetes

Azure Policy for Kubernetes is required for security recommendations:

1. In the Azure portal, navigate to your AKS cluster.
2. Select **Policies** under **Settings**.
3. Enable the **Azure Policy add-on**.

Or use Azure CLI:

```azurecli
az aks enable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

## Configure diagnostic logs

To ensure proper data collection:

1. Navigate to your AKS cluster in the Azure portal.
2. Select **Diagnostic settings** under **Monitoring**.
3. Select **Add diagnostic setting**.
4. Enable the following logs:
   - kube-apiserver
   - kube-controller-manager
   - kube-scheduler
   - kube-audit
   - guard
5. Send to a Log Analytics workspace.

## Next steps

- [Verify your Defender for Containers deployment](defender-for-containers-azure-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-azure-configure.md)
- [Troubleshoot common deployment issues](defender-for-containers-troubleshooting.md)