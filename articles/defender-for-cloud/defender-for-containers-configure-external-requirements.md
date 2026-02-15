---
title: Configure external requirements for Defender for Containers components
description: Learn how to configure cloud and Kubernetes settings required for certain Microsoft Defender for Containers components to function, including audit logging, control plane access, and registry scanning.
ms.topic: how-to
ms.date: 02/01/2026
ms.author: elkrieger
author: Elazark
---

# Configure external requirements for Defender for Containers components

Some Microsoft Defender for Containers components rely on cloud-provider or Kubernetes configuration that isn't performed automatically when you enable the Containers plan. 

After you [enable the Containers plan on your connector](defender-for-containers-enable-portal.md), configure the settings in this article for any components you enabled so Defender for Cloud can collect the required data.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

This configuration is relevant if you enabled one or more of the following Defender for Containers components:

- Agentless threat protection  
- Kubernetes API access
- Registry access

## Enable audit logging

**Required if you enabled:** Agentless threat protection

Audit logs are required for Defender for Cloud to analyze Kubernetes control plane activity and generate control plane threat detections.

Enable Kubernetes audit logging for each EKS cluster:

```bash
aws eks update-cluster-config \
  --name <cluster-name> \
  --logging '{"clusterLogging":[{"types":["audit","authenticator"],"enabled":true}]}'
```

> [!IMPORTANT]
> Agentless threat protection requires a properly configured log delivery pipeline, including an Amazon SQS queue. If the SQS queue ARN isn't configured or permissions aren't correctly granted, the AWS connector can show as **Connected**, but no control plane alerts are generated.
>
> Ensure that:
> - An SQS queue exists for log notifications.
> - The required IAM permissions are granted.
> - The correct SQS ARN is configured in the AWS connector settings.

## Configure Kubernetes control plane access 

**Required if you enabled:** Kubernetes API access

Defender for Cloud requires access to the Kubernetes API server. You must map the role `MDCContainersAgentlessDiscoveryK8sRole` into the EKS cluster.

Choose one of the following methods.

### Option 1: Use the Python onboarding script

Run the onboarding script from the Microsoft Defender for Cloud repository.

**Python onboarding repository script:**  
https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/AWS/ReadMe.md

The script automatically adds the required role mapping to the `aws-auth` ConfigMap.

### Option 2: Use eksctl

Create the IAM identity mapping manually:

```bash
eksctl create iamidentitymapping \
  --cluster my-cluster \
  --region region-code \
  --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \
  --group system:masters \
  --no-duplicate-arns
```
## Configure ECR vulnerability scanning (agentless)

**Required if you enabled:** Registry access

1. Go to your **AWS connector** settings in Microsoft Defender for Cloud.

1. Select **Configure** next to the **Containers** plan.

1. Verify **Registry access** is enabled.

1. Images pushed to **Amazon ECR** are automatically scanned within 24 hours.

# [Google Kubernetes Engine (GKE)](#tab/gke)

This configuration is relevant if you enabled one or more of the following Defender for Containers components:

- Agentless threat protection
- Registry access

## Enable Kubernetes audit logging 

**Required if you enabled:** Agentless threat protection

Enable audit logging for each GKE cluster:

```bash
gcloud container clusters update <cluster-name> \
  --zone <zone> \
  --enable-cloud-logging \
  --logging=SYSTEM,WORKLOAD,API_SERVER
```

Only `SYSTEM`, `WORKLOAD`, and `API_SERVER` log types are required for Defender for Cloud control plane threat detection. Avoid enabling additional logging types unless required by your organization to prevent unnecessary logging costs.

## Configure container registry scanning

**Required if you enabled:** Registry access

1. Go to your GCP connector settings in Defender for Cloud.

1. Select **Configure** next to the **Containers** plan.

1. Verify agentless container vulnerability assessment is enabled.

1. Images pushed to Google Container Registry (GCR) or Artifact Registry are scanned automatically.

# [Arc-enabled Kubernetes](#tab/arc)

## Configure registry access for private registries

**Required if you enabled:** Registry access and your images are stored in a private registry that requires credentials.

If your cluster needs credentials to pull images, create a Kubernetes secret that stores the registry credentials.

1. Sign in to the cluster context:

   ```bash
   kubectl config current-context
   ```
1. Create a Docker registry secret:

   ```bash
   kubectl create secret docker-registry regcred \
     --namespace mdc \
     --docker-server=<registry-url> \
     --docker-username=<username> \
     --docker-password=<password>
   ```
1. Verify the secret exists:

   ```bash
   kubectl get secret regcred -n mdc
   ```
   
---

## Related content

- [Enable Defender for Containers in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md)