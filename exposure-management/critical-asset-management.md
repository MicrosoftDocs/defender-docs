---
title: Overview of critical asset management in Microsoft Security Exposure Management
description: Learn about critical asset management in Microsoft Security Exposure Management.
ms.topic: overview
ms.date: 07/30/2025
---

# Overview of critical asset management

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) streamlines the identification and prioritization of business-critical assets across all domains including devices, identities, and cloud resources, enabling risk-managers and SOC teams to focus efforts where they matter most and reduce overall attack surface risk. With the integration of Defender for Cloud in the Defender portal, asset classification now covers the unified inventory spanning endpoints, cloud environments, and external attack surfaces. Asset classification is driven by proprietary classifiers, which can be fine-tuned manually to reflect organizational context. This article details the underlying mechanisms used for identifying and classifying assets within the Critical Assets Protection framework.

- Microsoft Defender XDR automatically detects and categorizes critical assets, streamlining identification and enabling immediate protection.  
- Your security team can prioritize security investigations, posture recommendations, and remediation steps to focus on critical assets and systems first.

## Predefined classifications

Security Exposure Management provides an out-of-the-box catalog of predefined critical asset classifications for assets that include devices, identities, and cloud resources across the unified inventory. Predefined classifications include:

- Critical cyber-security assets such as file servers and domain controllers
- Databases with sensitive data
- Identity groups such as Power Users
- User roles like Privileged Role Administrator
- Cloud resources from Azure, AWS, and GCP environments
- External assets discovered through third-party integrations

In addition, you can create custom critical assets to prioritize what your organization considers to be critical when assessing exposure and risk across all asset types in the unified inventory.

## Identifying critical assets

Critical assets can be identified in different ways:

- **Automatically:** The solution employs advanced analytics to automatically identify critical assets within your organization, in line with predefined classifications. This streamlines the identification process, enabling you to pinpoint assets that require heightened protection and immediate attention.
- **With custom queries:** Writing custom queries allows you to pinpoint your organization's "crown jewels" based on your unique criteria. With granular control, you can ensure that you can focus your security efforts precisely where they're needed.
- **Manually:**
  - Review assets in the [device inventory](/defender-endpoint/machines-view-overview) sorted by criticality level, and identify assets that require attention.
  - Review and approve assets classified automatically but with lower confidence.  

## Classifying assets

After business critical assets are defined and identified, asset criticality appears with your asset information. Asset criticality is integrated into other experiences in the Defender portal, such as in advanced hunting, the device inventory, and in attack paths that involve critical assets.

For example, in the **Device Inventory**, a criticality level is shown.

:::image type="content" source="./media/critical-asset-management/device-inventory-criticality-level.png" alt-text="Screenshot of the Device inventory window. The image includes an emphasis on the criticality level section." lightbox="media/critical-asset-management/device-inventory-criticality-level.png":::

In another example, on the [**Attack surface map**](enterprise-exposure-map.md), as you look for exposure to threats and identify choke points, the halo color surrounding the asset icon, and the crown indicator, visually indicate the high criticality level.

:::image type="content" source="./media/critical-asset-management/attack-surface-exposure-map.png" alt-text="Screenshot of an asset viewed in the exposure map in the context of other connections. Two devices on the map show high critical levels." lightbox="media/critical-asset-management/attack-surface-exposure-map.png":::

## Working with asset classifications

You can work with critical asset settings as follows:

- **Create custom classifications**: You can create new critical asset classifications for devices, identities, and cloud resources from any domain (Azure, AWS, GCP, or on-premises), tailored to your organization.
  - You use the query builder to define a new classification. For example, you might build a query to define devices with a specific naming convention as critical, or cloud resources with specific tags as critical.
  - Creating critical asset classification queries is also useful for limited cases where not all assets of interest are identified across the unified inventory.
- **Add assets to classifications**: You can manually add assets from any domain to critical asset classifications in the unified asset management experience.
- **Modify criticality levels**: You can choose to edit criticality levels according to your organization's risk profile across all asset types.
- **Edit custom classifications**: You can edit, delete, and turn off custom classifications. Predefined classifications can't be modified. The "turn off" rule functionality is available for predefined queries. However, it might not be visible to some users due to specific issues.
- **Third-party data integration**: Assets discovered via third-party connectors (such as ServiceNow CMDB) can be automatically tagged as critical if they meet certain criteria, enhancing critical asset identification across the unified inventory.

## Reviewing critical assets

The critical asset classification logic uses asset behavior from Microsoft Defender workloads, cloud environments (Azure, AWS, GCP), and third-party integrations. With the integration of Defender for Cloud in the Defender portal, this now includes assets from the unified inventory across all domains. To implement different logic, turn off the rule and create a custom rule suited to your scenarios.

Some assets that match a classification might not meet the criticality threshold. For example, an asset might be a domain controller or a cloud resource, but it might not be deemed critical for your business. Use the asset review feature to add these assets to your defined classification. This feature allows you to include assets based on your organization's specific criticality criteria across the entire unified asset inventory, ensuring all critical assets across devices, identities, and cloud resources are properly managed in one place.

## Critical Asset Protection initiative

The Critical Asset Protection initiative helps prioritize business-critical systems and assets, focusing SOC team efforts on enhancing resiliency, monitoring, and incident response. This initiative is available in the Initiatives section of Exposure Insights in the Microsoft Defender portal.

- The initiative continuously monitors the security resilience of your critical assets, providing real-time insights into the effectiveness of your protection measures. Use the initiative score to compare the security resilience of critical assets across different environments, helping you identify areas that require more focus and improvement.
- The initiative provides visibility into all critical assets within your organization, identifies potential gaps in critical asset discovery, and fine-tunes your classifications accordingly. The initiative consolidates information about critical assets and their security resilience into a single view. This comprehensive report enables you to make informed decisions and take proactive measures to safeguard your critical assets.

## Next steps

[Classify critical assets](classify-critical-assets.md).
