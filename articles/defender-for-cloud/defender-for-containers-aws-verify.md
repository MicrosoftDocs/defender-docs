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

## Common verification issues

### Connector shows disconnected

1. Verify CloudFormation stack completed successfully.
1. Check IAM role has correct trust policy.
1. Ensure you correctly entered the role ARN in Azure.

### No security alerts

If you don't see security alerts:

1. Make sure audit logging is enabled on EKS clusters.
1. Verify Defender sensor pods are running.
1. Check that runtime protection is enabled in connector settings.
1. Wait 5-10 minutes after generating test events.

### Missing vulnerability scans

For missing ECR scans:

1. Verify ECR permissions in IAM role.
1. Check that images are pushed recently.
1. Ensure vulnerability assessment is enabled in connector.
1. Wait up to 4 hours for initial scans.

### Clusters not appearing

If EKS clusters aren't showing:

1. Verify clusters are tagged correctly (no exclusion tags).
1. Check IAM role has `eks:ListClusters` permission.
1. Ensure clusters are in the same AWS account.
1. Wait 15-30 minutes for discovery.

## Related content

- [Configure advanced settings](defender-for-containers-aws-configure.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
