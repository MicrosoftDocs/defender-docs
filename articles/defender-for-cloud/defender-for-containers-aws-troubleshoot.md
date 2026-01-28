---
title: Troubleshoot Defender for Containers on AWS (EKS)
description: Troubleshoot common issues when deploying or operating Microsoft Defender for Containers on Amazon Elastic Kubernetes Service (EKS).
author: Elazark
ms.author: elkrieger
ms.topic: troubleshooting
ms.date: 01/13/2026
---

# Troubleshoot Defender for Containers on AWS (EKS)

This article helps you troubleshoot common issues when deploying or operating Microsoft Defender for Containers on Amazon Elastic Kubernetes Service (EKS).

## Connector and onboarding issues

### AWS connector shows as disconnected

**Symptoms**

- AWS connector status is **Disconnected**
- No EKS clusters or ECR registries appear in inventory

**What to check**

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your AWS connector.
1. Verify the connector status and last sync time.

**Common causes**

- CloudFormation stack failed or was deleted
- Required IAM roles or policies were modified
- Incorrect or missing CloudTrail SQS ARN

**Resolution**

- Redeploy the CloudFormation stack from the connector configuration.
- Confirm the required IAM roles still exist in AWS.
- Verify the CloudTrail SQS queue ARN is correctly entered in the connector settings.

## Cluster discovery issues

### EKS clusters aren’t discovered

**Symptoms**

- Connector is connected, but no EKS clusters appear
- Inventory doesn’t list expected clusters

**What to check**

- Ensure **Kubernetes API access** is enabled in the Containers plan settings.
- Verify the AWS regions selected during connector creation include your clusters.
- Confirm the IAM role has permissions to list EKS clusters.

**Resolution**

- Update the AWS connector settings to include the correct regions.
- Re-enable **Kubernetes API access** if it was disabled.
- Wait up to 30 minutes for discovery to complete.

## Agentless threat protection issues

### No control plane alerts detected

**Symptoms**

- No control plane alerts are generated.
- Kubernetes API or audit-based detections are missing.

**What to check**

- Ensure **Agentless threat protection** is enabled in the Containers plan settings.
- Verify that Kubernetes audit logging is enabled for the EKS cluster:
```bash
aws eks describe-cluster \
  --name <cluster-name> \
  --query "cluster.logging.clusterLogging"
```
- Confirm CloudTrail is configured to send logs to the Amazon SQS queue used by the AWS connector. 

  > [!NOTE]
  > If Kubernetes audit logging is disabled, control plane threat detection doesn’t function.

**Resolution**

- Enable Kubernetes audit logging on the EKS cluster.
- Verify the CloudTrail SQS queue is active and receiving events.
- Allow up to an hour for alerts to start appearing after configuration changes.

## Defender sensor deployment issues

### Defender sensor pods aren’t running

**Symptoms**

- No Defender sensor pods appear on cluster nodes
- Runtime alerts aren’t generated

**What to check**

- Ensure the EKS cluster is connected to Azure Arc.
- Verify the Defender sensor extension is installed.
- Check node resources and Kubernetes scheduling status.

**Resolution**

- Go to **Microsoft Defender for Cloud** > **Recommendations**.
- Follow the remediation steps for installing the Defender extension on Arc-enabled clusters.
- Check pod status:
  ```bash
  kubectl get pods -n kube-system -l app=microsoft-defender
  ```

## Azure Arc connectivity issues

### Cluster shows as disconnected in Azure Arc

**Symptoms**

- The Arc-enabled Kubernetes cluster status is **Disconnected**.
- Defender extensions fail to deploy.

**What to check**

- Verify outbound HTTPS connectivity from the cluster to Azure endpoints.
- Check Azure Arc agent logs.

**Resolution**

- Re-run the Azure Arc onboarding script.
- Verify that required network endpoints are reachable.
- Review Arc agent logs:
  ```bash
  kubectl logs -n azure-arc -l app.kubernetes.io/component=cluster-agent
  ```

### Defender sensor extension deployment is stuck

**Symptoms**

- The Defender extension status remains **Creating** or **Failed** for an extended period.
- The Defender sensor pods aren’t deployed to the cluster.

**What to check**

Use Azure CLI to check the extension status:

```azurecli
az k8s-extension show \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --cluster-type connectedClusters \
  --name microsoft.azuredefender.kubernetes
```

**Resolution**

If the extension is stuck or failed, delete and redeploy it:

```bash
az k8s-extension delete \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --cluster-type connectedClusters \
  --name microsoft.azuredefender.kubernetes
```
After deletion, redeploy the extension by following the remediation steps in **Microsoft Defender for Cloud** > **Recommendations**.

## ECR vulnerability scanning issues

### Images aren’t scanned

**Symptoms**

- No vulnerability findings for Amazon ECR images.
- Registry access appears enabled.

**What to check**

- Confirm **Registry access** is enabled in the Containers plan.
- Verify the IAM role includes permissions to read from Amazon ECR.
- Ensure the ECR registry and images are located in a supported AWS region.

**Notes**

- Image scanning runs periodically (typically every 24 hours).
- Newly pushed images might not appear immediately.
- Vulnerability assessment for ECR isn’t supported in all AWS regions. Check [Defender for Containers feature availability](support-matrix-defender-for-containers.md) documentation to confirm that ECR vulnerability scanning is supported in the image’s AWS region.

## Verification issues

### Partial or missing coverage

**Symptoms**

- Some clusters or registries are missing.
- Coverage appears incomplete.

**What to check**

- Verify that exclusion tags aren’t applied:
  - `ms_defender_container_exclude_agents`
  - `ms_defender_container_exclude_agentless`
- Confirm all required Defender for Containers components are enabled.

**Resolution**

- Remove exclusion tags if they weren’t intended.
- Enable missing components and follow the deployment steps.

## Related content

- [Enable Defender for Containers using the Azure portal](defender-for-containers-enable-portal.md)

- [Enable Defender for Containers using the Azure CLI](defender-for-containers-enable-azure-cli.md)