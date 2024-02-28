---
title: Classify assets as critical
description: This article describes how to manage critical assets in Microsoft Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Classify assets as critical

[Critical asset management](critical-asset-management.md) provides visibility into your business critical assets.

[!INCLUDE [prerelease](../includes//prerelease.md)]

To access critical asset management:

1. Select **Settings > Microsoft XDR > Rules > Critical asset management**  in the Security Exposure Management section in the [Microsoft Defender portal](https://security.microsoft.com) or from the **Classify critical asset** action card in **Assets > Devices**, and the **Critical asset protection** initiative in **Exposure insights -> Initiatives**.

1. From the critical asset management page, you can view basic overview information. For instance, the on/off state or number of assets, and can select individual critical asset classifications to edit or explore. You can also choose to add a new classification.
<!--1. From there you can choose to change criticality levels,  view the general critical asset information including the  review general information such , choose to review classifications, create new classifications, or update the criticality levels for the existing classifications in your organization.-->

:::image type="content" source="./media/critical-asset-management-window.png" alt-text="Screenshot of the Critical asset management window.":::

> [!NOTE]
> Critical asset protection management is only available to members with one of the following roles: Global administrator, Security administrator, Security Operator, Global Reader, and Security Reader.
>Creating critical asset classification queries is additionally useful for limited cases where not all assets of interest are identified.

## Set critical asset levels

1. Select a critical asset classification from **Critical asset management.**

1. In the side pane **Overview** tab, select the desired criticality level. 

1. Select **Save**.

:::image type="content" source="./media/edit-criticality-levels.png" alt-text="Screenshot of the Critical asset management criticality editing feature.":::

./media/edit-criticality-levels.png" alt-text="Screenshot of the Critical asset management criticality editing feature."

## Edit critical asset classifications

1. Browse to the critical asset classification you want to modify, delete, or turn off. Only custom classifications can be edited or deleted.
1. Select **Edit**, **Delete**, or **Turn off**.
1. Selecting **Edit** takes you to the [Create a critical asset classification](#create-critical-asset-classification) window for modification.

## Add assets to critical asset classifications

1. Select the predefined or custom business critical asset classification to review based on your current needs.

1. To see all the custom and predefined assets classified to the defined critical asset select the **Overview** or **Assets** tab.

1. Review the list of assets to give you a clearer picture of the specific assets detected by each classification.

1. To approve assets that fit the critical asset classification definition, but which are out of threshold, browse to the *Assets to review* window.
    1. Review the listed assets for assets that meet your organization's criticality criteria for that definition.
    1. Select the **plus** button next to the assets that fit the business critical asset criteria to add to your Asset tab.

> [!NOTE]
> The Assets to review window only displays when there are assets to review.

:::image type="content" source="./media/assets-to-review.png" alt-text="Screenshot of the Assets to review screen.":::

<!--## Critical asset overview

: CAP management  explanation about how we identify critical asset for our customers and marking them as critical  predefined queries, what, which, why  managing rules – setting criticality level, turning rules off/on  Reviewing asset list  low confidence criticality  suggest new classifications for us to support  custom queries  criticality in other portal experiences (e.g., device inventory).-->

<!--The Overview tab provides the following information:


- **Description** - A description of the critical asset.
- **Status** - Whether the critical asset is on or off.
- **Assets** - The number of connected assets.
- **Created on** - The date the critical asset was created.
- **Updated on** - The date the critical asset was updated.
- **Created by** - The critical asset creator.
-->
You can change the criticality levels and turn off all assets. You can also edit and delete custom critical assets.

## Create critical asset classification

1. To create a new classification, select **Create a new classification.**

1. In the *create critical asset classification* window complete the following information to set your classification criteria:

    - **Name** - New classification name
    - **Description** - New classification description
    - **Query builder** - Use the query builder to define a new classification, for instance, "mark all devices with a certain naming convention as critical.". Add one or more boolean filters that are defined per device, identity, or cloud resource.
:::image type="content" source="./media/create-critical-asset-classification.png" alt-text="Screenshot of the create critical asset classification window.":::
1. Once your criteria are set, select **Next**. On the following pages, you can preview the assets that are affected and assign the criticality level for the set of assets.

> [!NOTE]
> It's also possible to set the criticality levels manually in the device inventory. We recommend creating criticality rules to ensure a broader application of the designation across assets.
<!--initiative?The initiative page allows you to view security metrics, security recommendations, critical assets, and history in one place. In addition, you can access critical asset management to change your asset criticality levels. -->

## Sort by criticality

1. Select **Devices** in the Microsoft Security portal.

1. Sort by **criticality level** to view business critical assets with a "very high" level of criticality or other needs.

:::image type="content" source="./media/device-inventory.png" alt-text="screenshot of the Device inventory window":::

## Request a new critical asset classification

1. To request a new classification select **Suggestion new classification** from **Critical asset management**.

1. Fill in what classification you'd like to see and then select **Submit request**.

## Next steps

- [Critical asset management](critical-asset-management.md)
