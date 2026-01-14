---
title: Verify Defender for Containers deployment on AWS (EKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your Amazon EKS clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Defender for Containers deployment on AWS (EKS)

After you enable Defender for Containers, use this guide to verify all components are functioning correctly on your EKS clusters.

## Validation checklist

Complete these verification steps in order:

1. [AWS connector shows as connected](#verify-connector-status)
1. [EKS clusters connected to Arc](#verify-arc-connection)  
1. [Defender sensor pods running](#verify-sensor-deployment)

> [!TIP]
> If any validation step fails, see the [Common verification issues](#common-verification-issues) section for troubleshooting guidance.

## Verify connector status

### Check connector in Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your AWS connector.
1. Verify the following values:
   - Connection status shows as **Connected**
   - Last sync time is recent (within 15 minutes)
   - Containers plan shows as **On**

## Verify Arc connection

### Check EKS clusters in Arc

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

## Test security detection

To verify that your Defender for Containers deployment is working correctly, you can simulate security alerts. These simulations trigger real alerts without causing harm to your clusters.

For detailed instructions on generating test alerts and simulating various threat scenarios, see [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

## Related content

- [Configure advanced settings](defender-for-containers-aws-configure.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
