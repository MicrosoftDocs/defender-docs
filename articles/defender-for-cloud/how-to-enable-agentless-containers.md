---
title: How-to enable agentless container posture 
description: Learn how to onboard agentless containers
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 03/02/2026
---

# Onboard agentless container posture in Defender CSPM

Enable agentless container posture in Defender CSPM to gain visibility into Kubernetes clusters and container images without deploying agents.

Agentless container posture is available for Azure, AWS, and GCP environments.

## Prerequisites

- [Defender CSPM plan is enabled for your environment](enable-enhanced-security.md).

## How to onboard agentless container posture in Defender CSPM

# [Azure](#tab/azure)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. Under **Defender plans**, locate **Defender CSPM**.

1. Select **Settings**.

1. Enable the following settings:
   - **Kubernetes API access**
   - **Registry access**

    :::image type="content" source="media/concept-agentless-containers/toggle-on-components-aks.png" alt-text="Screenshot of the Defender CSPM plan configuration for Azure Kubernetes Service (AKS) showing Kubernetes API access and Registry access enabled." lightbox="media/concept-agentless-containers/toggle-on-components-aks.png":::

1. Select **Continue**. (check this)

1. Select **Save**.

# [AWS](#tab/aws)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your AWS connector.

1. Under **Defender plans**, locate **Defender CSPM**.

1. Select **Settings**.

1. Enable the following settings:
   - **Kubernetes API access**
   - **Registry access**

    :::image type="content" source="media/concept-agentless-containers/toggle-on-components-aws.png" alt-text="Screenshot of the Defender CSPM plan configuration for AWS showing Kubernetes API access and Registry access enabled." lightbox="media/concept-agentless-containers/toggle-on-components-aws.png":::

1. Select **Continue**.

1. Select **Save**.

1. Select **Next: Configure access**.

1. Redeploy the CloudFormation or Terraform template.

1. Select **Next: Review and generate**.

1. Select **Update**.

# [GCP](#tab/gcp)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your GCP connector.

1. Under **Defender plans**, locate **Defender CSPM**.

1. Select **Settings**.

1. Enable the following settings:
   - **Kubernetes API access**
   - **Registry access**

    :::image type="content" source="media/concept-agentless-containers/toggle-on-components-gcp.png" alt-text="Screenshot of the Defender CSPM plan configuration for GCP showing Kubernetes API access and Registry access enabled." lightbox="media/concept-agentless-containers/toggle-on-components-gcp.png":::

1. Select **Continue**.

1. Select **Save**.

1. Select **Next: Configure access**.

1. Redeploy the Cloud Shell or Terraform template.

1. Select **Next: Review and generate**.

1. Select **Update**.

> [!NOTE]
> Kubernetes API access uses AKS trusted access. For more information about AKS trusted access, see [Enable Azure resources to access Azure Kubernetes Service (AKS) clusters using Trusted Access](/azure/aks/trusted-access-feature).

## Related content

- Learn more about [agentless container posture capabilities](concept-agentless-containers.md#capabilities).
- Check out [common questions about Defender for Containers](faq-defender-for-containers.yml).
- Learn more about [Trusted Access](/azure/aks/trusted-access-feature).
- Learn how to [view and remediate vulnerability assessment findings for registry images](view-and-remediate-vulnerability-assessment-findings.md).
- Learn how to [view and remediate vulnerabilities for images running on your AKS clusters](view-and-remediate-vulnerabilities-for-images.md).
- Learn how to [Test the Attack Path and Security Explorer using a vulnerable container image](how-to-test-attack-path-and-security-explorer-with-vulnerable-container-image.md)
- Learn how to [create an exemption](exempt-resource.md) for a resource or subscription.
- Learn more about [Cloud Security Posture Management](concept-cloud-security-posture-management.md).
