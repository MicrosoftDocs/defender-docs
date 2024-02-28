---
title: Overview of critical asset management
description: This article describes how Microsoft Security Exposure Management's critical asset management works.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Overview of critical asset management

Critical asset protection helps you proactively identify and secure your organization’s business critical assets and reduce the risk of data breaches and operational disruptions. It allows you to identify, classify, and manage your critical assets. Critical asset protection helps you ensure that the assets critical to your organization operations and business continuity, are secure. Additionally, it reduces the risk of data breaches and operational disruptions.

[!INCLUDE [prerelease](../includes//prerelease.md)]

**Critical asset management** allows you to manage protection with pre-existing and customizable business critical asset classifications for devices, identities, and cloud resources. An out-of-the-box catalog of predefined critical asset classifications relevant across a broad range of organizations. It also allows you to create custom queries to identify your unique organizational “crown jewels." Critical asset management allows you to customize and manage criticality levels. Custom critical assets provide more granular control regarding how to prioritize what your organization considers to be critical when assessing exposure and risk. Once business critical assets are defined and identified, asset criticality appears with your asset information. Asset criticality is integrated into other experiences in the Microsoft Defender portal, such as advanced hunting, the device inventory, and attack paths involving critical assets. You can use the Critical Asset Protection initiative to help in threat prevention.

> [!NOTE]
> Critical asset protection management is only available to members with one of the following roles: Global administrator, Security administrator, Security Operator, Global Reader, and Security Reader.
>Creating critical asset classification queries is additionally useful for limited cases where not all assets of interest are identified.

## Identify critical assets

Critical assets can be identified in different ways:

- **Automatically:** The solution employs advanced analytics to automatically identify critical assets within your organization,  including devices, identities, or cloud resources. This streamlines the identification process, enabling you to pinpoint assets that require heightened protection and immediate attention.
- **With custom queries:** Writing custom queries allows you to pinpoint your organization’s "crown jewels" based on unique criteria. With granular control, you can ensure that you can focus your security efforts precisely where they're needed.
- **Manually:** Review assets in the [device inventory](../defender-endpoint/machines-view-overview.md) sorted by criticality level and identify assets that require attention.

## Use predefined classifications

Critical asset management provides a range of Microsoft defined critical classifications for assets including devices, identities, and cloud resources. Your relevant assets are automatically classified according to these critical asset classifications using predefined criticality levels. Predefined classifications include *Domain controllers,* *Databases with sensitive data,* groups like *Power users,* and roles like *Privileged Role Administrator.* You can choose to edit the criticality levels according to your organization's risk profile.

## Edit asset classifications

In order to better manage your critical assets, you can choose to edit classification information, delete, or turn off critical asset classifications, and change classification levels to better suit your business needs.

## Create an asset classification

In order to protect your business critical assets, you might need to create custom classifications for business critical assets. You can classify organizational assets using the critical asset classification logic according to your needs. You can change the asset classification levels based on your organization's risk profile.

## Classify assets

Once your criticality levels are defined, rules classify your assets by criticality level in other Exposure Management and Defender contexts. You can sort your assets in the device inventory by criticality and explore them individually. You can choose to view the asset on the [attack map](enterprise-exposure-map.md) and look for any exposure to threats and identify choke points. The halo color surrounding the asset icon and the crown indicator visually indicate the high criticality level. In addition, you can gain an overview of threats to critical assets through the [Critical asset protection initiative](#critical-asset-protection-initiative).

:::image type="content" source="./media/device-inventory-criticality-level.png" alt-text="Screenshot of the Device inventory window. The image includes an emphasis on the criticality level section.":::

:::image type="content" source="./media/attack-surface-exposure-map.png" alt-text="Screenshot of an asset viewed in the exposure map in the context of other connections. Two devices on the map show high critical levels.":::

## Review critical assets

The critical asset classification logic classifies your assets according to the particular classification. However, some assets that fit the classification might not meet the threshold for the classification. For instance, it might be a domain controller, but it isn't clear whether your organization considers the asset business critical. When assets don't meet the classification threshold for criticality, you can choose to add them to your defined classification with the asset review feature. This feature allows you to add listed assets based on your organization's criticality criteria.

## Critical asset protection initiative

The Critical Asset Protection initiative helps you make sure your business critical assets are safeguarded from threats. The Critical Asset Protection initiative offers continuous monitoring of the security resilience of your critical assets, providing real-time insights into the effectiveness of your protection measures. The initiative's asset tab lets you gain visibility into all critical assets within your organization, identify potential gaps in critical asset discovery, and fine-tune your classifications accordingly. To view the Critical Asset Protection initiative from the [Microsoft Defender portal](https://security.microsoft.com/), go to **Exposure Insights -> Initiatives** and select the **Critical Asset Protection** initiative.

## Next steps

- [Classify critical assets](classify-critical-assets.md)
- [Work with attack paths](work-attack-paths-overview.md)
<!-- [!INCLUDE [support](../includes//support.md)] -->
