---
title: Overview of critical asset management in Microsoft Security Exposure Management
description: Learn about critical asset management in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Overview of critical asset management

In [Microsoft Security Exposure Management](microsoft-security-exposure-management.md), you can define and manage resources as critical assets.

- Identifying critical assets helps ensure that the most important assets in your organization are protected against risk of data breaches and operational disruptions. Critical asset identification contributes to availability and business continuity.
- You can prioritize security investigations, posture recommendations, and remediation steps to focus on critical assets first.

## Predefined classifications

Security Exposure Management provides an out-of-the-box catalog of predefined critical asset classifications for assets that include devices, identities, and cloud resources. Predefined classifications include:

- Domain controllers
- Databases with sensitive data
- Groups such as Power Users
- Roles like Privileged Role Administrator

In addition, you can create custom critical assets to prioritize what your organization considers to be critical when assessing exposure and risk.

## Identifying critical assets

Critical assets can be identified in different ways:

- **Automatically:** The solution employs advanced analytics to automatically identify critical assets within your organization, in line with predefined classifications. This streamlines the identification process, enabling you to pinpoint assets that require heightened protection and immediate attention.
- **With custom queries:** Writing custom queries allows you to pinpoint your organization's "crown jewels" based on your unique criteria. With granular control, you can ensure that you can focus your security efforts precisely where they're needed.
- **Manually:** Review assets in the [device inventory](/defender-endpoint/machines-view-overview) sorted by criticality level, and identify assets that require attention.

## Classifying assets

After business critical assets are defined and identified, asset criticality appears with your asset information. Asset criticality is integrated into other experiences in the Defender portal, such as in advanced hunting, the device inventory, and in attack paths that involve critical assets.

For example, in the **Device Inventory**, a criticality level is shown.

:::image type="content" source="./media/critical-asset-management/device-inventory-criticality-level.png" alt-text="Screenshot of the Device inventory window. The image includes an emphasis on the criticality level section." lightbox="media/critical-asset-management/device-inventory-criticality-level.png":::

In another example, on the [**Attack surface map**](enterprise-exposure-map.md), as you look for exposure to threats and identify choke points, the halo color surrounding the asset icon, and the crown indicator, visually indicate the high criticality level.

:::image type="content" source="./media/critical-asset-management/attack-surface-exposure-map.png" alt-text="Screenshot of an asset viewed in the exposure map in the context of other connections. Two devices on the map show high critical levels." lightbox="media/critical-asset-management/attack-surface-exposure-map.png":::

## Working with asset classifications

You can work with critical asset settings as follows:

- **Create custom classifications**: You can create new critical asset classifications for devices, identities, and cloud resources, tailored to your organization.
  - You use the query builder to define a new classification. For example, you might build a query to define devices with a specific naming convention as critical.
  - Creating critical asset classification queries is also useful for limited cases where not all assets of interest are identified.
- **Add assets to classifications**: You can manually add assets to critical asset classifications.
- **Modify criticality levels**: You can choose to edit criticality levels according to your organization's risk profile.
- **Edit custom classifications**: You can edit, delete, and turn off custom classifications. Predefined classifications can't be modified.

## Reviewing critical assets

The critical asset classification logic classifies your assets according to a particular classification.

Some assets that fit a classification might not meet the classification threshold. For instance, the asset might be a domain controller, but it might not be considered a critical asset in your business. When assets don't meet the classification threshold for criticality, you can choose to add them to your defined classification with the asset review feature. This feature allows you to add listed assets based on your organization's criticality criteria.

## Critical Asset Protection initiative

The Critical Asset Protection initiative, in the **Initiatives** section of **Exposure insights** in the [Microsoft Defender portal](https://security.microsoft.com/) helps you make sure your business critical assets are safeguarded from threats.

- The initiative offers continuous monitoring of the security resilience of your critical assets, providing real-time insights into the effectiveness of your protection measures.
- Within the initiative, you can gain visibility into all critical assets within your organization, identify potential gaps in critical asset discovery, and fine-tune your classifications accordingly.

## Next steps

[Classify critical assets](classify-critical-assets.md).
