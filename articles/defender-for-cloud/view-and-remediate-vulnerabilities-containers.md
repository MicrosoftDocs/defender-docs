---
title: Assess vulnerabilities for containers running on your Kubernetes clusters
description: Learn how to view and remediate runtime threat findings for containers running on your Kubernetes clusters.
ms.service: defender-for-cloud
ms.custom: build-2023, sfi-image-nochange
ms.topic: how-to
ms.date: 02/12/2026
---

# View and remediate vulnerabilities for containers running on Kubernetes clusters (risk-based)

> [!NOTE]
> This article describes the new risk-based approach to vulnerability management in Microsoft Defender for Cloud. If you're using the Defender for Cloud Security Posture Management (CSPM) plan, use this method. To use the classic secure score approach, see [View and remediate vulnerabilities for images running on your Kubernetes clusters (Secure Score)](view-and-remediate-vulnerabilities-for-images-secure-score.md).

Defender for Cloud helps you prioritize the remediation of vulnerabilities in containers running on your Kubernetes clusters. It bases this prioritization on a contextual risk analysis of the vulnerabilities in your cloud environment. In this article, you review the [Containers running in Azure should have vulnerability findings resolved](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/e9acaf48-d2cf-45a3-a6e7-3caa2ef769e0) recommendation. For the other supported environments, see the parallel recommendations in [Vulnerability assessments in supported environments](agentless-vulnerability-assessment-azure.md).

To provide findings for the recommendation, Defender for Cloud uses [agentless discovery for Kubernetes](defender-for-containers-introduction.md) or the [Defender sensor](tutorial-enable-containers-azure.md#deploy-the-defender-sensor-in-azure) to create a full inventory of your Kubernetes clusters and their workloads. It correlates that inventory with the vulnerability reports created for your registry images. The recommendation shows your running containers with the vulnerabilities associated with the images that each container uses and remediation steps.

Defender for Cloud presents the findings and related information as recommendations. This information includes remediation steps and relevant CVEs. You can view the identified vulnerabilities for one or more subscriptions or for a specific resource.

Details include additional containers affected by that vulnerability, information on the software version that contributes to resolving the vulnerability, and links to external resources to help with patching the vulnerability.

## View vulnerabilities for a container

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Go to **Microsoft Defender for Cloud > Recommendations**. 
1. Search for `Containers running in Azure should have vulnerability findings resolved`

    :::image type="content" source="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-image-recommendation-line.png" alt-text="Screenshot showing the recommendation line for running container images should have vulnerability findings resolved." lightbox="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-image-recommendation-line.png":::

1. Select the recommendation.
1. Review the recommendation details.

    :::image type="content" source="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-select-cluster.png" alt-text="Screenshot showing the affected clusters for the recommendation." lightbox="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-select-cluster.png":::

1. Select the **Findings** tab to see the list of vulnerabilities impacting the container.

    :::image type="content" source="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-select-container.png" alt-text="Screenshot showing the findings tab containing the vulnerabilities." lightbox="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-select-container.png":::

1. Select each vulnerability to view a detailed description of the vulnerability.

    :::image type="content" source="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-list-vulnerabilities.png" alt-text="Screenshot showing the container vulnerabilities." lightbox="media/view-and-remediate-vulnerabilities-for-images-running-on-aks/running-list-vulnerabilities.png":::

To find all containers impacted by a specific vulnerability, see [Group recommendations by title](review-security-recommendations.md#group-recommendations-by-title).

For information on how to remediate the vulnerabilities, see [Remediate recommendations](implement-security-recommendations.md).

## Next step

- Learn how to [view and remediate vulnerabilities for registry images](view-and-remediate-vulnerability-assessment-findings.md).
