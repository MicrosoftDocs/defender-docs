---
title: Deploy specific Defender for Containers components on AWS (EKS) via portal
description: Learn how to deploy individual Microsoft Defender for Containers components on Amazon EKS clusters when you already have the plan enabled.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy specific Defender for Containers components on AWS (EKS) via portal

This article explains how to deploy specific Defender for Containers components on your Amazon EKS clusters when you already have the plan enabled but need to add or fix individual components.

## When to use this guide

Use this guide if you:

- Already have Defender for Containers enabled but some components are missing
- Want to deploy to specific clusters only
- Need to troubleshoot failed component deployments
- Want to exclude certain clusters from protection

If you're setting up Defender for Containers for the first time, see [Enable all Defender for Containers components on AWS (EKS)](defender-for-containers-aws-enable-all-portal.md).

## Prerequisites

- AWS connector already created in Defender for Cloud
- Defender for Containers plan enabled on your subscription
- IAM roles and permissions already configured
- Some or all EKS clusters may already be connected to Azure Arc

## Check component status

1. Navigate to **Environment settings** in Defender for Cloud.
2. Select your AWS connector.
3. Select **Containers** to view component status:
   - ✅ Green checkmark = Component enabled and deployed
   - ⚠️ Yellow warning = Component enabled but not deployed to all clusters
   - ❌ Red X = Component disabled or failed

## Deploy missing components

### Connect specific EKS clusters to Azure Arc

If some clusters aren't connected:

1. Go to **Recommendations** in Defender for Cloud.
2. Search for "EKS clusters should be connected to Azure Arc".
3. Select the recommendation.
4. Select only the clusters you want to connect.
5. Select **Fix** and follow the provided script.

### Deploy Defender sensor to specific clusters

To deploy the sensor to selected clusters:

1. Go to **Recommendations**.
2. Search for "EKS clusters should have Microsoft Defender's extension for Azure Arc installed".
3. Select the recommendation.
4. Select specific clusters that need the sensor.
5. Select **Fix**.

### Fix failed deployments

If components show as failed:

1. Select the affected cluster in the recommendation.
2. Review the error message.
3. Common fixes:
   - **Permission issues**: Update IAM roles
   - **Network issues**: Check connectivity to Azure endpoints
   - **Resource limits**: Increase cluster resources

## Configure component settings

### Enable/disable specific components

1. Navigate to your AWS connector settings.
2. Select **Containers**.
3. Toggle individual components:
   - **Cloud Security Posture Management** - Security recommendations
   - **Kubernetes sensor** - Runtime protection
   - **Agentless discovery** - Inventory without agents
   - **Container registry vulnerability** - ECR scanning

### Configure scanning exclusions

To exclude specific registries or repositories:

```json
{
  "properties": {
    "exclusionTags": {
      "Environment": "Development",
      "Scanner": "Skip"
    }
  }
}
```

## Deploy by cluster tags

Deploy to clusters with specific tags:

1. In the extension deployment recommendation.
2. Use filters to select by tags:
   - Environment: Production
   - Team: Security
   - Region: us-east-1

## Verify deployment

After deployment:

1. Check recommendation status - should show "Healthy"
2. Navigate to **Inventory** > **Containers** to see protected clusters
3. Review **Security alerts** for any new detections

### Monitor ongoing health

Set up continuous monitoring:

1. Create alerts for component health changes
2. Review weekly security recommendations
3. Monitor alert trends in the dashboard

## Troubleshooting

### Sensor deployment fails

1. **Check Arc connectivity**:
   - Navigate to **Azure Arc** > **Kubernetes clusters**
   - Select your cluster and check "Connected" status
   - If disconnected, see [Verify Arc connection](defender-for-containers-aws-verify.md#check-arc-connection)

2. **Review extension status**:
   - In the Arc cluster, select **Extensions**
   - Click on **microsoft-defender** extension
   - Check the error message in the status
   - For detailed diagnostics, see [Verify Defender sensor](defender-for-containers-aws-verify.md#verify-defender-sensor)

3. **Common solutions**:
   - **Permission issues**: [Update IAM roles](defender-for-containers-aws-configure.md#configure-aws-permissions)
   - **Network issues**: [Check connectivity requirements](defender-for-containers-aws-verify.md#no-security-data-appearing)
   - **Resource limits**: Increase node resources or add nodes to cluster

### Components show as unhealthy

1. Check cluster logs:

   ```bash
   kubectl logs -n kube-system -l app=microsoft-defender
   ```

2. Verify network connectivity to:
   - *.ods.opinsights.azure.com
   - *.oms.opinsights.azure.com
   - *.security.azure.com

## Next steps

- [Verify deployment](defender-for-containers-aws-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-aws-configure.md)
- [Enable all components](defender-for-containers-aws-enable-all-portal.md) - For fresh installations
