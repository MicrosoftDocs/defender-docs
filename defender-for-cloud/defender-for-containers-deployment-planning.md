---
title: Deployment planning for Microsoft Defender for Containers
description: Learn how to plan deployment of Microsoft Defender for Containers across Kubernetes environments, including onboarding, deployment methods, and post-deployment verification.
ms.topic: concept-article
ms.date: 03/16/2026
---

# Deployment planning for Microsoft Defender for Containers

This article helps you plan how to deploy Microsoft Defender for Containers across Kubernetes environments. It focuses on the Defender for Containers components that are deployed to Kubernetes clusters, including the Defender sensor and Azure Policy for Kubernetes.

Other capabilities, such as Registry access, Kubernetes API access, and agentless threat protection, are enabled through Defender for Containers plan or connector settings.

## Onboard the environment

Before Defender for Containers can deploy cluster components, the Kubernetes environment must be connected to Microsoft Defender for Cloud.

| Environment | Onboarding path |
|------------|-----------------|
| **AKS** | No additional connector is required. AKS clusters are native Azure resources. |
| **EKS** | [Onboard AWS to Defender for Cloud](quickstart-onboard-aws.md). |
| **GKE** | [Onboard GCP to Defender for Cloud](quickstart-onboard-gcp.md). |
| **On-premises and other Arc-enabled Kubernetes clusters** | [Connect your existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster). |

## Deployment options

| Deployment approach | Description |
|--------|-------------|
| **Automatic provisioning** | Supported components are deployed automatically after the Defender for Containers plan or relevant settings are enabled. |
| **Manual deployment** | Automatic provisioning is turned off and supported components are installed manually. |
| **Mixed deployment** | Automatic provisioning is enabled, but specific AKS, EKS, or GKE clusters are excluded and deployed manually. Mixed deployment isn't supported for on-premises or other Kubernetes clusters connected directly to Azure Arc.

## Automatic provisioning

With automatic provisioning enabled, Microsoft Defender for Cloud installs supported cluster components after the Defender for Containers plan and the relevant settings are enabled.

For AKS clusters, Defender sensor deployment uses the **Defender AKS add-on**. For EKS and GKE clusters, deployment uses Azure Arc Kubernetes extensions on the Arc-enabled Kubernetes resources created through the AWS or GCP connector flow.

For on-premises and other Kubernetes clusters connected directly to Azure Arc, the cluster must first be connected to Azure Arc. Deployment then uses Azure Arc Kubernetes extensions after the relevant Defender for Containers settings are enabled.

You can customize automatic Defender sensor provisioning by excluding specific clusters using tags before enabling the Defender for Containers plan, and then deploying the sensor manually.

> [!NOTE]
> Exclusion tags apply to automatic Defender sensor deployment. They don't apply to on-premises or other Kubernetes clusters connected directly to Azure Arc.

With automatic provisioning, the Defender sensor is installed after the cluster is discovered and can take several hours to complete.

Use manual deployment or exclude specific clusters from automatic Defender sensor provisioning and deploy the sensor manually to install the Defender sensor immediately.

## Manual deployment

If automatic provisioning is disabled, supported cluster components aren't deployed automatically. You can deploy supported components manually.

Manual deployment can also be used for Defender sensor deployment on clusters that are excluded from automatic Defender sensor provisioning.

You can deploy components manually by using one of the following methods:

- [Deploy Defender sensor and Azure Policy to clusters using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Install Defender for Containers sensor by using Helm](deploy-helm.md)

## Post-deployment steps

After deployment, verify that Defender components are running correctly and address any issues.

- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md)

- [Troubleshoot Defender for Containers deployment](defender-for-containers-troubleshoot.md)

## Related content

- [Enable Defender for Containers](defender-for-containers-enable-plan.md)

- [Exclude clusters from automatic Defender sensor provisioning](defender-for-containers-exclude-cluster.md)


