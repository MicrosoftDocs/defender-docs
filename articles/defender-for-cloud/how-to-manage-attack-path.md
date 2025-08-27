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

Defender for Cloud uses a [proprietary algorithm to locate potential attack paths](concept-attack-path.md#what-is-an-attack-path) specific to your multicloud environment. Instead of looking for preset attack paths, Defender for Cloud uses its algorithm to detect potential attack paths based on your multicloud security graph. Attack path analysis helps you focus on the most critical security issues that could lead to a breach.

You can use attack path analysis to address security issues that pose immediate threats and have the greatest potential for exploitation in your environment. Defender for Cloud analyzes which security issues are part of potential attack paths that attackers could use to breach your environment. It also highlights the security recommendations you need to resolve to mitigate these issues.

By default attack paths are organized by risk level. The risk level is determined by a context-aware risk-prioritization engine that considers the risk factors of each resource. Learn more about how Defender for Cloud [prioritizes security recommendations](risk-prioritization.md).

## Prerequisites

- You must [enable Defender Cloud Security Posture Management (CSPM)](enable-enhanced-security.md) and have [agentless scanning](enable-vulnerability-assessment-agentless.md) enabled.

- **Required roles and permissions**: Security Reader, Security Admin, Reader, Contributor, or Owner.

**To view attack paths that are related to containers**:

- You must [enable agentless container posture extension](tutorial-enable-cspm-plan.md) in Defender CSPM
    or
- You can [enable Defender for Containers](defender-for-containers-enable.md), and install the relevant agents in order to view attack paths that are related to containers. This also gives you the ability to [query](how-to-manage-cloud-security-explorer.md#build-a-query) containers data plane workloads in security explorer.

- **Required roles and permissions**: Security Reader, Security Admin, Reader, Contributor, or Owner.

## Identify attack paths

The attack path page shows you an overview of all of your attack paths. You can also see your affected resources and a list of active attack paths.

:::image type="content" source="media/concept-cloud-map/attack-path-homepage.png" alt-text="Screenshot of a sample attack path homepage." lightbox="media/concept-cloud-map/attack-path-homepage.png":::

You can use Attack path analysis to locate the biggest risks to your environment and to remediate them.

::: zone pivot="azure-portal"

## [Azure portal](#tab/azure-portal)

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

## [Defender portal](#tab/defender-portal)

**To identify attack paths in the Defender portal**:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. Navigate to **Exposure Management** > **Attack path analysis**.

    > [!NOTE]
    > In the Defender portal, attack path analysis is part of the broader Exposure Management capabilities, providing enhanced integration with other Microsoft security solutions and unified incident correlation.

1. Select an attack path to view details.

1. Select a node to investigate.

   > [!NOTE]
   > If you have limited permissions—especially across subscriptions—you might not see full attack path details. This is expected behavior designed to protect sensitive data.
   > To view all details, make sure you have the necessary permissions.

1. Select **Insight** to view the associated insights for that node.

1. Select **Recommendations** to see actionable guidance.

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

::: zone-end

## Differences between Azure portal and Defender portal

The attack path analysis feature is available in both the Azure portal and the Microsoft Defender portal, with some key differences:

| Feature | Azure portal | Defender portal |
|---------|--------------|-----------------|
| **Location** | Microsoft Defender for Cloud > Attack path analysis | Exposure Management > Attack path analysis |
| **Integration** | Focused on cloud security posture management | Integrated with broader Microsoft security ecosystem |
| **Correlation** | Limited to cloud security events | Cross-service correlation with endpoint, identity, and email security |
| **Investigation** | Cloud-focused investigation capabilities | Enhanced investigation with unified incident management |
| **Hunting** | Basic search and filtering | Advanced hunting with KQL across multiple security signals |
| **Notifications** | Cloud security alerts | Unified notifications across all Microsoft security solutions |
| **Incident management** | Standalone cloud security incidents | Correlated incidents across the entire security stack |

### When to use each portal

- **Use the Azure portal** when you're primarily focused on cloud security posture management and want to work within the Azure ecosystem for cloud resource management.

- **Use the Defender portal** when you need comprehensive security operations that span across cloud, endpoint, identity, and email security, or when you want to correlate cloud attack paths with broader security incidents.

---

## Remediate attack paths

Once you're done with your investigation of an attack path and you review all of the associated findings and recommendations, you can start to remediate the attack path.

::: zone pivot="azure-portal"

## [Azure portal](#tab/azure-portal)

**To remediate an attack path in the Azure portal**:

1. Navigate to **Microsoft Defender for Cloud** > **Attack path analysis**.

1. Select an attack path.

1. Select **Remediation**.

    :::image type="content" source="media/how-to-manage-attack-path/recommendations-tab.png" alt-text="Screenshot of the attack path that shows you where to select remediation." lightbox="media/how-to-manage-attack-path/recommendations-tab.png":::

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

Once an attack path is resolved, it can take up to 24 hours for an attack path to be removed from the list.

::: zone-end

::: zone pivot="defender-portal"

## [Defender portal](#tab/defender-portal)

**To remediate an attack path in the Defender portal**:

1. Navigate to **Exposure Management** > **Attack path analysis**.

1. Select an attack path.

1. Select **Remediation**.

    > [!NOTE]
    > In the Defender portal, remediation steps are integrated with the broader incident management workflow, allowing you to track remediation progress across multiple security solutions.

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

Once an attack path is resolved, it can take up to 24 hours for an attack path to be removed from the list.

::: zone-end

---

## Remediate all recommendations within an attack path

Attack path analysis grants you the ability to see all recommendations by attack path without having to check each node individually. You can resolve all recommendations without having to view each node individually.

The remediation path contains two types of recommendation:

- **Recommendations** - Recommendations that mitigate the attack path.
- **Additional recommendations** - Recommendations that reduce the exploitation risks, but don't mitigate the attack path.

::: zone pivot="azure-portal"

## [Azure portal](#tab/azure-portal)

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

## [Defender portal](#tab/defender-portal)

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

## Next Step

> [!div class="nextstepaction"]
> [Build queries with cloud security explorer](how-to-manage-cloud-security-explorer.md).
