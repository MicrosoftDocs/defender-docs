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

## Choose how cluster components are deployed

After onboarding the environment, decide whether cluster components are deployed automatically or manually.

This decision determines how the Defender sensor and other cluster components are installed.

### Automatic provisioning

With automatic provisioning enabled, Microsoft Defender for Cloud automatically installs the required cluster components after the Defender for Containers plan is enabled.

For AKS clusters, this deployment uses the **Defender AKS add-on**.

This option requires minimal configuration and is the default for most environments.

### Manual deployment

You might choose manual deployment if you want more control over how cluster components are installed or if your environment requires a specific deployment method.

If you plan to deploy components manually, exclude the cluster from automatic sensor deployment before enabling the Defender for Containers plan.

#### Exclude the Defender sensor from automatic provisioning

To exclude the Defender sensor from automatic provisioning, add the following tag to the cluster resource in Azure:

`ms_defender_container_exclude_sensors = true`

For clusters connected through Azure Arc (including Amazon EKS and Google Kubernetes Engine), apply the tag to the **Azure Arc-enabled Kubernetes resource** in Azure.

## Enable the Defender for Containers plan

Enable the Defender for Containers plan on your subscription.

After the plan is enabled:

- If automatic provisioning is enabled, Defender for Cloud automatically deploys the required cluster components.

- If automatic provisioning is disabled or the cluster is excluded from automatic deployment, you must install the required cluster components manually.

Learn how to [enable Defender for Containers](defender-for-containers-enable-portal.md).

## Deploy cluster components manually

If automatic provisioning is disabled, deploy the required cluster components manually.

Depending on the Kubernetes environment and the enabled Defender capabilities, this deployment installs components such as the Defender sensor or Azure Policy extension.

You can deploy these components by using one of the following methods:

- [Deploy Defender sensor and Azure Policy to clusters using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Install Defender for Containers sensor by using Helm](deploy-helm.md)

## Post-deployment steps

After deployment, verify that Defender components are running correctly and address any issues.

- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md)

- [Remediate Defender for Containers recommendations](defender-for-containers-deploy-portal.md)

- [Troubleshoot Defender for Containers deployment](defender-for-containers-troubleshoot.md)

## Related content

