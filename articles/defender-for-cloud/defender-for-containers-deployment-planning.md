---
title: Deployment planning for Microsoft Defender for Containers
description: Learn how to plan deployment of Microsoft Defender for Containers across Kubernetes environments, including onboarding, deployment methods, and post-deployment verification.
ms.topic: reference
ms.author: elkrieger
author: Elazark
ms.date: 03/16/2026
---

# Plan deployment for Microsoft Defender for Containers

This guide helps you plan how to deploy Microsoft Defender for Containers across Kubernetes environments. It outlines the onboarding flow, deployment options, and post-deployment steps.

## Onboard the environment

Connect the Kubernetes environment to Microsoft Defender for Cloud. For Azure, no additional connector is required.

- [Amazon Web Services (AWS)](quickstart-onboard-aws.md).

- [Google Cloud Platform (GCP)](quickstart-onboard-gcp.md).

- [Azure Arc-enabled Kubernetes clusters](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Deployment options

After onboarding the environment, choose how cluster components are deployed to your clusters.

| Option | Description | When to use |
|--------|-------------|-------------|
| **Automatic provisioning** | Components are deployed automatically after the Defender for Containers plan is enabled. | Recommended for most environments |
| **Manual deployment** | Components are not deployed automatically and must be installed manually. | When you require full control over deployment |
| **Mixed deployment** | Automatic provisioning is enabled, but specific clusters are excluded and deployed manually. | When only some clusters require customization |


## Automatic provisioning

With automatic provisioning enabled, Microsoft Defender for Cloud installs the required cluster components after the Defender for Containers plan is enabled.

For AKS clusters, deployment uses the **Defender AKS add-on**. For Arc-enabled clusters, deployment uses Azure Arc extensions.

This option requires minimal configuration and is recommended for most environments.

You can customize automatic provisioning by excluding specific clusters using tags before enabling the Defender for Containers plan, and then deploying those clusters manually.

## Manual deployment

If automatic provisioning is disabled, no cluster components are deployed automatically. You must deploy all required components manually.

## Mixed deployment (automatic with exclusions)

If you want to use automatic provisioning for most clusters but deploy specific clusters manually:

- Enable automatic provisioning.
- Exclude specific clusters by using tags.
- Deploy components manually on the excluded clusters.

You can deploy components manually by using one of the following methods:

- [Deploy Defender sensor and Azure Policy to clusters using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Install Defender for Containers sensor by using Helm](deploy-helm.md)

## Post-deployment steps

After deployment, verify that Defender components are running correctly and address any issues.

- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md)

- [Remediate Defender for Containers recommendations](defender-for-containers-deploy-portal.md)

- [Troubleshoot Defender for Containers deployment](defender-for-containers-troubleshoot.md)

## Related content

