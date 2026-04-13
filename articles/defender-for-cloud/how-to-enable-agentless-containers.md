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

1. Select the relevant subscription.

1. Under **Defender plans**, locate **Defender CSPM**.

1. Select **Settings**.

1. Enable the following settings:
   - **Kubernetes API access**
   - **Registry access**

1. Select **Continue**.

1. Select **Save**.

# [AWS](#tab/aws)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS connector.

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

1. Select the relevant GCP connector.

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

---

## Related content

- [Enable Defender CSPM](enable-enhanced-security.md)

- [Agentless container posture capabilities](concept-agentless-containers.md)

- [View and remediate vulnerability assessment findings for registry images](view-and-remediate-vulnerability-assessment-findings.md)

- [View and remediate vulnerabilities for images running on AKS clusters](view-and-remediate-vulnerabilities-for-images.md)