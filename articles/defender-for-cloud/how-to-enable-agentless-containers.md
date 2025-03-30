---
title: How-to enable agentless container posture 
description: Learn how to onboard agentless containers
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 03/30/2025
---

# Onboard agentless container posture in Defender CSPM

Onboarding agentless container posture in Defender CSPM allows you to gain all its [capabilities](concept-agentless-containers.md#capabilities).

> [!NOTE]
> Agentless container posture is available for Azure, AWS, and GCP clouds.

Defender CSPM includes extensions that allow for agentless visibility into Kubernetes and containers registries across your organization's software development lifecycle: **Agentless scanning for machines** for scanning of runtime container images,  **K8S API access** for Kubernetes cluster discovery and **Registry access** to access images in a supported container registry.

## How to onboard agentless container posture in Defender CSPM

1. Before starting, verify that the scope is [onboarded to Defender CSPM](enable-enhanced-security.md).

1. In the Azure portal, navigate to the Defender for Cloud's **Environment Settings** page.

1. Select the scope that's onboarded to the Defender CSPM plan, then select **Settings**.

1. Ensure the **K8S API access** and **Registry access** extensions are toggled to **On**.

1. Select **Continue**.

    :::image type="content" source="media/concept-agentless-containers/select-components.png" alt-text="Screenshot of selecting components 8S API access and Registry access." lightbox="media/concept-agentless-containers/select-components.png":::

1. Select **Save**.

A notification message pops up in the top right corner that verifies that the settings were saved successfully.

> [!NOTE]
> K8S API access uses AKS trusted access. For more information about AKS trusted access, see [Enable Azure resources to access Azure Kubernetes Service (AKS) clusters using Trusted Access](/azure/aks/trusted-access-feature).

## Related content

- Check out [common questions about Defender for Containers](faq-defender-for-containers.yml).
- Learn more about [Trusted Access](/azure/aks/trusted-access-feature).
- Learn how to [view and remediate vulnerability assessment findings for registry images](view-and-remediate-vulnerability-assessment-findings.md).
- Learn how to [view and remediate vulnerabilities for images running on your AKS clusters](view-and-remediate-vulnerabilities-for-images.md).
- Learn how to [Test the Attack Path and Security Explorer using a vulnerable container image](how-to-test-attack-path-and-security-explorer-with-vulnerable-container-image.md)
- Learn how to [create an exemption](exempt-resource.md) for a resource or subscription.
- Learn more about [Cloud Security Posture Management](concept-cloud-security-posture-management.md).
