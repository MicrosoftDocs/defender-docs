---
title: Verify Defender for Containers deployment on Azure (AKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your AKS clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Defender for Containers deployment on Azure (AKS)

After you enable Defender for Containers, use this guide to verify all components are functioning correctly.

## Validation checklist

Complete these verification steps in order:

1. [Defender plan shows as enabled](#verify-plan-enablement)
1. [Defender sensor pods are running](#verify-sensor-deployment)
1. [Azure Policy add-on is enabled](#verify-azure-policy-add-on)
1. [Test security alert generated successfully](#test-security-detection)

> [!TIP]
> If any validation step fails, see the [Troubleshooting](#common-verification-issues) section for that component.

## Verify plan enablement

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your subscription.
1. Verify that **Containers** shows as **On**.
1. Select **Settings** next to Containers and verify all extensions are enabled.

### Using Azure CLI

```azurecli
az aks show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query "securityProfile.defender"
```

The output should show `securityMonitoring.enabled` as `true`.

## Verify sensor deployment

Check if the Defender sensor pods are running:

```bash
kubectl get ds microsoft-defender-collector-ds -n kube-system
```

All pods should show a status of `Running`.

## Verify Azure Policy add-on

```azurecli
az aks show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query addonProfiles.azurepolicy
```

The output should show `enabled: true`.

## Test security detection

To verify that your Defender for Containers deployment is working correctly, you can simulate security alerts. These simulations trigger real alerts without causing harm to your clusters.

For detailed instructions on generating test alerts and simulating various threat scenarios, see [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

## Common verification issues

### Sensor pods not running

If sensor pods aren't running:

1. Check pod events: `kubectl get ds microsoft-defender-collector-ds -n kube-system`
1. Verify resource availability: `kubectl top nodes`

Common causes:

- **Insufficient resources**: Increase node size or add nodes
- **Network policies**: Ensure egress to Azure endpoints is allowed
- **RBAC issues**: Verify cluster has proper permissions

### Missing recommendations

If recommendations are missing:

1. Check that you enabled the Azure Policy add-on.
1. Wait up to 24 hours for the initial assessment.
1. Verify you enabled agentless discovery.
1. Make sure you didn't exclude clusters through tags.

### No vulnerability scan results

If vulnerability scans are missing:

1. Check that you configured ACR integration.
1. Verify you recently pushed images.
1. Make sure you enabled vulnerability assessment.
1. Wait up to four hours for the initial scans.

## Related content

- [Configure advanced settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
