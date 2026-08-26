---
title: View and remediate vulnerabilities for running containers
description: Learn how to view and remediate vulnerability findings for running containers in Microsoft Defender for Cloud.
ms.service: defender-for-cloud
ms.custom: build-2023, sfi-image-nochange, msecd-doc-authoring-1013
ms.topic: how-to
ms.date: 07/03/2026
#customer intent: As a security administrator, I want to review vulnerability findings for images used by running containers so I can prioritize and remediate issues that affect active Kubernetes workloads.
ai-usage: ai-assisted
---

# View and remediate vulnerabilities for running containers

Defender for Cloud helps you find and fix vulnerabilities in images that your Kubernetes workloads use.

To create these findings, Defender for Cloud first builds a list of your Kubernetes workloads. It uses supported discovery and protection components to do this. Then it matches that list against known vulnerability data for the images those workloads run.

Findings for running containers appear as security recommendations. The following steps use the **Flat list** view, which shows results at the resource level. Learn more about [reviewing recommendations by title or by resource](review-security-recommendations.md#recommendation-title-view).
> [!NOTE]
> You might see both grouped and individual recommendation formats in the portal during this transition. Learn more about [transitioning from grouped to individual recommendations](transition-grouped-individual-recommendations.md).

## Prerequisites

Before you begin, enable [Defender for Containers](defender-for-containers-enable-plan.md) or [Defender CSPM](tutorial-enable-cspm-plan.md) on your subscription. Turn on one of these component sets:

- **Registry access** and either **Kubernetes API access** or **Defender sensor**. This option links scanned registry images to running workloads.
- **Agentless scanning for machines** and either **Kubernetes API access** or **Defender sensor**. This option checks for runtime vulnerabilities without a registry.

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

1. Review the details, including risk info, fix steps, and metadata.

1. Select the **Associated CVEs** tab to see the CVEs for that item.

1. Select a CVE to view its severity, affected components, and fix version.

## Related content

- To find all containers with a given vulnerability, see [Group recommendations by title](review-security-recommendations.md#resource-views).

- To fix vulnerabilities, see [Remediate recommendations](implement-security-recommendations.md).

- [Query container vulnerabilities in Cloud Security Explorer](cloud-security-explorer-container-vulnerabilities.md)

- [View and fix vulnerabilities for registry images](view-and-remediate-vulnerability-registry-images.md)