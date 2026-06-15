---
title: View and remediate vulnerabilities for running containers
description: Learn how to view and remediate vulnerability findings for running containers in Microsoft Defender for Cloud.
ms.service: defender-for-cloud
ms.custom: build-2023, sfi-image-nochange
ms.topic: how-to
ms.date: 06/14/2026
#customer intent: As a security administrator, I want to review vulnerability findings for images used by running containers so I can prioritize and remediate issues that affect active Kubernetes workloads.
---

# View and remediate vulnerabilities for running containers

Defender for Cloud helps you identify and prioritize vulnerabilities in images currently used by workloads running on Kubernetes clusters.

To generate these findings, Defender for Cloud builds an inventory of your Kubernetes workloads by using supported discovery and protection components, and correlates that inventory with vulnerability data for the images used by those workloads.

Vulnerability findings for running containers are shown as security recommendations in Defender for Cloud. The steps in this article use the **Flat list** recommendations view, which shows recommendations at the affected-resource level. Learn more about [reviewing recommendations by title or by resource](review-security-recommendations.md#recommendation-title-view).
> [!NOTE]
> During the transition from grouped to individual recommendations, you might see both recommendation formats in the portal. Learn more about [transitioning from grouped to individual recommendations](transition-grouped-individual-recommendations.md).

## Prerequisites

Before you begin, make sure that [Defender for Containers](defender-for-containers-enable-plan.md) or [Defender CSPM](tutorial-enable-cspm-plan.md) is enabled on your subscription with one of the following component combinations toggled on:

- **Registry access** and either **Kubernetes API access** or **Defender sensor** to map registry-scanned images to running workloads.
- **Agentless scanning for machines** and either **Kubernetes API access** or **Defender sensor** for registry-agnostic runtime vulnerability assessment.

## View vulnerabilities for running containers

To view vulnerabilities for a running container:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Select the **Vulnerabilities** tab.

1. Select the **Flat list** view.

1. Select **Add filter**.

1. Select **Resource type**.

1. Select **Container**.

   :::image type="content" source="./media/view-and-remediate-vulnerabilities-containers/resource-type-container.png" alt-text="Screenshot of the Resource type filter in Microsoft Defender for Cloud Recommendations with Container selected." lightbox="./media/view-and-remediate-vulnerabilities-containers/resource-type-container.png":::

1. Select **Apply**.

1. Select a recommendation.

1. Review the recommendation details, including the risk information, remediation guidance, and recommendation metadata.

1. Select the **Associated CVEs** tab to review the CVEs associated with the recommendation.

1. Select a CVE to view details such as severity, affected components, and fix version information.

## Related content

- To find all containers affected by a specific vulnerability, see [Group recommendations by title](review-security-recommendations.md#resource-views).

- To remediate vulnerabilities, see [Remediate recommendations](implement-security-recommendations.md).

- [Build Cloud Security Explorer queries for container vulnerabilities](cloud-security-explorer-container-vulnerabilities.md)

- [View and remediate vulnerabilities for registry images](view-and-remediate-vulnerability-registry-images.md)