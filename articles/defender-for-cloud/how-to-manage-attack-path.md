---
title: Identify and remediate attack paths
author: Elazark
ms.author: elkrieger
description: Learn how to identify and remediate attack paths in Microsoft Defender for Cloud and enhance the security of your environment.
ms.topic: how-to
ms.date: 05/18/2025
ms.custom: sfi-image-nochange
zone_pivot_groups: defender-portal-experience
#customer intent: As a security analyst, I want to learn how to identify and remediate attack paths in Microsoft Defender for Cloud so that I can enhance the security of my environment.
---

# Identify and remediate attack paths

Defender for Cloud uses a [proprietary algorithm to locate potential attack paths](concept-attack-path.md#what-is-an-attack-path) specific to your multicloud environment. Defender for Cloud focuses on real, externally-driven and exploitable threats rather than broad scenarios. The algorithm detects attack paths that begin outside your organization and progress to business-critical targets, helping you cut through the noise and act faster.

You can use attack path analysis to address security issues that pose immediate threats and have the greatest potential for exploitation in your environment. Defender for Cloud analyzes which security issues are part of externally-exposed attack paths that attackers could use to breach your environment. It also highlights the security recommendations you need to resolve to mitigate these issues.

By default attack paths are organized by risk level. The risk level is determined by a context-aware risk-prioritization engine that considers the risk factors of each resource. Learn more about how Defender for Cloud [prioritizes security recommendations](risk-prioritization.md).

::: zone pivot="azure-portal"

::: zone-end

::: zone pivot="defender-portal"

> [!NOTE] 
> This capability is currently in preview.   
> For details about current gaps and restrictions, see [Known limitations](defender-portal/known-limitations.md).

::: zone-end

## Prerequisites

- You must [enable Defender Cloud Security Posture Management (CSPM)](enable-enhanced-security.md) and have [agentless scanning](enable-vulnerability-assessment-agentless.md) enabled.

- **Required roles and permissions**: Security Reader, Security Admin, Reader, Contributor, or Owner.

> [!NOTE]
> You may see an empty Attack Path page, as attack paths now focus on real, externally-driven and exploitable threats rather than broad scenarios. This helps reduce noise and prioritize imminent risks.

**To view attack paths that are related to containers**:

- You must [enable agentless container posture extension](tutorial-enable-cspm-plan.md) in Defender CSPM
    or
- You can [enable Defender for Containers](defender-for-containers-enable.md), and install the relevant agents in order to view attack paths that are related to containers. This also gives you the ability to [query](how-to-manage-cloud-security-explorer.md#build-a-query) containers data plane workloads in security explorer.

- **Required roles and permissions**: Security Reader, Security Admin, Reader, Contributor, or Owner.

## Identify attack paths

You can use Attack path analysis to locate the biggest risks to your environment and to remediate them.

::: zone pivot="azure-portal"

The attack path page shows you an overview of all of your attack paths. You can also see your affected resources and a list of active attack paths.

:::image type="content" source="media/concept-cloud-map/attack-path-homepage.png" alt-text="Screenshot of a sample attack path homepage." lightbox="media/concept-cloud-map/attack-path-homepage.png":::

**To identify attack paths in the Azure portal**:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Attack path analysis**.

    :::image type="content" source="media/how-to-manage-attack-path/attack-path-blade.png" alt-text="Screenshot that shows the attack path analysis page on the main screen." lightbox="media/how-to-manage-attack-path/attack-path-blade.png":::

1. Select an attack path.

1. Select a node.

    :::image type="content" source="media/how-to-manage-attack-path/node-select.png" alt-text="Screenshot of the attack path screen that shows you where the nodes are located for selection." lightbox="media/how-to-manage-attack-path/node-select.png":::
   > [!NOTE]
   > If you have limited permissions—especially across subscriptions—you might not see full attack path details. This is expected behavior designed to protect sensitive data.
   > To view all details, make sure you have the necessary permissions.

1. Select **Insight** to view the associated insights for that node.

    :::image type="content" source="media/how-to-manage-attack-path/insights.png" alt-text="Screenshot of the insights tab for a specific node." lightbox="media/how-to-manage-attack-path/insights.png":::

1. Select **Recommendations**.

    :::image type="content" source="media/how-to-manage-attack-path/attack-path-recommendations.png" alt-text="Screenshot that shows you where to select recommendations on the screen." lightbox="media/how-to-manage-attack-path/attack-path-recommendations.png":::

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

::: zone-end

::: zone pivot="defender-portal"

**To identify attack paths in the Defender portal**:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. Navigate to **Exposure Management** > **Attack surface** > **Attack paths**. You will see an overview of your attack paths.
    
    The attack paths experience provides multiple views:
    - **Overview tab**: View attack paths over time, top 5 choke points, top 5 attack path scenarios, top targets, and top entry points
    - **Attack paths list**: Dynamic, filterable view of all attack paths with advanced filtering capabilities
    - **Choke points**: List of nodes where multiple attack paths converge, flagged as high-risk bottlenecks
    
    :::image type="content" source="media/how-to-manage-attack-path/attack-path-overview-defender-portal.png" alt-text="Screenshot showing attack path overview in the Defender portal." lightbox="media/how-to-manage-attack-path/attack-path-overview-defender-portal.png":::

> [!NOTE]
> In the Defender portal, attack path analysis is part of the broader Exposure Management capabilities, providing enhanced integration with other Microsoft security solutions and unified incident correlation.

1. Select the **Attack paths** tab.

    :::image type="content" source="media/how-to-manage-attack-path/defender-portal/attack-paths-main.png" alt-text="Screenshot that shows the attack path page in the Defender portal." lightbox="media/how-to-manage-attack-path/defender-portal/attack-paths-main.png":::

1. Use advanced filtering in the Attack paths list to focus on specific attack paths:
   - **Risk level**: Filter by High, Medium, or Low risk attack paths
   - **Asset type**: Focus on specific resource types
   - **Remediation status**: View resolved, in-progress, or pending attack paths
   - **Time frame**: Filter by specific time periods (e.g., last 30 days)

1. Select an attack path to view the Attack Path Map, a graph-based view highlighting:
   - **Vulnerable nodes**: Resources with security issues
   - **Entry points**: External access points where attacks could begin
   - **Target assets**: Critical resources attackers are trying to reach
   - **Choke points**: Convergence points where multiple attack paths intersect

1. Select a node to investigate detailed information:

    :::image type="content" source="media/how-to-manage-attack-path/attack-path-node-defender-portal.png" alt-text="Screenshot of the attack path screen in the Defender portal showing node selection." lightbox="media/how-to-manage-attack-path/attack-path-node-defender-portal.png":::

   > [!NOTE]
   > If you have limited permissions—especially across subscriptions—you might not see full attack path details. This is expected behavior designed to protect sensitive data.
   > To view all details, make sure you have the necessary permissions.

1. Review node details including:
   - **MITRE ATT&CK tactics and techniques**: Understanding the attack methodology
   - **Risk factors**: Environmental factors contributing to risk
   - **Associated recommendations**: Security improvements to mitigate the issue

1. Select **Insight** to view the associated insights for that node.

1. Select **Recommendations** to see actionable guidance with remediation status tracking.

    :::image type="content" source="media/how-to-manage-attack-path/attack-path-recommendations-defender-portal.png" alt-text="Screenshot that shows where to select recommendations in the Defender portal." lightbox="media/how-to-manage-attack-path/attack-path-recommendations-defender-portal.png":::

1. Select a recommendation.
   Once you're done with your investigation of an attack path and you review all of the associated findings and recommendations, you can start to remediate the attack path.

1. [Remediate the recommendation](implement-security-recommendations.md).

Once an attack path is resolved, it can take up to 24 hours for an attack path to be removed from the list.

::: zone-end

---

::: zone pivot="azure-portal"

## Remediate attack paths

Once you're done with your investigation of an attack path and you review all of the associated findings and recommendations, you can start to remediate the attack path.

**To remediate an attack path in the Azure portal**:

1. Navigate to **Microsoft Defender for Cloud** > **Attack path analysis**.

1. Select an attack path.

1. Select **Remediation**.

    :::image type="content" source="media/how-to-manage-attack-path/recommendations-tab.png" alt-text="Screenshot of the attack path that shows you where to select remediation." lightbox="media/how-to-manage-attack-path/recommendations-tab.png":::

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

Once an attack path is resolved, it can take up to 24 hours for an attack path to be removed from the list.

::: zone-end

## Remediate all recommendations within an attack path

Attack path analysis grants you the ability to see all recommendations by attack path without having to check each node individually. You can resolve all recommendations without having to view each node individually.

The remediation path contains two types of recommendation:

- **Recommendations** - Recommendations that mitigate the attack path.
- **Additional recommendations** - Recommendations that reduce the exploitation risks, but don't mitigate the attack path.

::: zone pivot="azure-portal"

**To resolve all recommendations in the Azure portal**:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Attack path analysis**.

1. Select an attack path.

1. Select **Remediation**.

    :::image type="content" source="media/how-to-manage-attack-path/bulk-recommendations.png" alt-text="Screenshot that shows where to select on the screen to see the attack paths full list of recommendations." lightbox="media/how-to-manage-attack-path/bulk-recommendations.png":::

1. Expand **Additional recommendations**.

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

Once an attack path is resolved, it can take up to 24 hours for an attack path to be removed from the list.

::: zone-end

::: zone pivot="defender-portal"

**To resolve all recommendations in the Defender portal**:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. Navigate to **Exposure Management** > **Attack path analysis**.

1. Select an attack path.

1. Select **Remediation**.

    > [!NOTE]
    > The Defender portal provides enhanced tracking of remediation progress and can correlate remediation activities with broader security operations and incident management workflows.

1. Expand **Additional recommendations**.

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

Once an attack path is resolved, it can take up to 24 hours for an attack path to be removed from the list.

::: zone-end

---

::: zone pivot="defender-portal"

## Enhanced exposure management capabilities

The Defender portal provides additional capabilities for attack path analysis through its integrated Exposure Management framework:

- **Unified incident correlation**: Attack paths are automatically correlated with security incidents across your Microsoft security ecosystem.
- **Cross-product insights**: Attack path data is integrated with findings from Microsoft Defender for Endpoint, Microsoft Sentinel, and other Microsoft security solutions.
- **Advanced threat intelligence**: Enhanced context from Microsoft threat intelligence feeds to better understand attack patterns and actor behaviors.
- **Integrated remediation workflows**: Streamlined remediation processes that can trigger automated responses across multiple security tools.
- **Executive reporting**: Enhanced reporting capabilities for security leadership with business impact assessments.

These capabilities provide a more comprehensive view of your security posture and enable more effective response to potential threats identified through attack path analysis.

Learn more about [attack paths](concept-attack-path.md) in Defender for Cloud.

::: zone-end

---

## Next Step

> [!div class="nextstepaction"]
> [Build queries with cloud security explorer](how-to-manage-cloud-security-explorer.md).
