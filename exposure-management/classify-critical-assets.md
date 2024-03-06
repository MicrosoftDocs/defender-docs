---
title: Work with critical assets in Microsoft Security Exposure Management
description: Learn how to manage critical assets in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 03/06/2023
---

# Work with critical assets

[Microsoft Security Exposure Manager](microsoft-security-exposure-management.md) helps keep your business critical assets secure and available. This article describes how to work with critical assets.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Prerequisites

- Before you start, [learn about critical asset management](critical-asset-management.md) in Security Exposure Manager.
- To manage critical assets you need one of these roles: Global Administrator, Security Administrator, Security Operator, Global Reader, Security Reader.

## Review critical assets

Review critical assets.

1. In the [Microsoft Defender portal](https://security.microsoft.com) select **Settings > Microsoft XDR > rules > Critical asset management**
1. On the **Critical asset management** page, review predefined and custom critical asset classifications, including the number of assets in the classification, whether assets are on or off, and criticality levels.  

:::image type="content" source="./media/critical-asset-management-window.png" alt-text="Screenshot of the Critical asset management window." lightbox="./media/critical-asset-management-window.png":::


> [!NOTE]
> You can also view critical assets in **Assets > Devices** > **Classify critical asset**, and view the **Critical Asset Protection** initiative in **Exposure insights -> Initiatives**.

## Request a new predefined classification

Request a new predefined classification as follows.

1. On the **Critical asset management** page, select **Suggest new classification**.

1. Fill in what classification you'd like to see and then select **Submit request**.



<!--1. From there you can choose to change criticality levels,  view the general critical asset information including the  review general information such , choose to review classifications, create new classifications, or update the criticality levels for the existing classifications in your organization.-->

## Create a custom classification

Create a custom classification as follows.

1. On the **Critical asset management** page, select **Create a new classification.**

1. On the **Create a critical asset classification** page, complete the following information to set your classification criteria:

    - **Name** - New classification name
    - **Description** - New classification description
    - **Query builder**
        - Use the query builder to define a new classification, for instance, "mark all devices with a certain naming convention as critical.".
        - Add one or more boolean filters that are defined per device, identity, or cloud resource.
        
:::image type="content" source="./media/create-critical-asset-classification.png" alt-text="Screenshot of the create critical asset classification window." lightbox="./media/create-critical-asset-classification.png":::

1. After setting the criteria select **Next**. 
1. On the following pages, preview the affected assets, and assign the criticality level.


## Set critical asset levels

Set levels as follows.

1. On the **Critical asset management** page, select a critical asset classification.

1. In the **Overview** tab, select the desired criticality level.

1. Select **Save**.

:::image type="content" source="./media/edit-criticality-levels.png" alt-text="Screenshot of the Critical asset management criticality editing feature.":::


> [!NOTE]
> You can set critical levels manually in the device inventory. We recommend creating criticality rules for broad application of levels across assets.
<!--initiative?The initiative page allows you to view security metrics, security recommendations, critical assets, and history in one place. In addition, you can access critical asset management to change your asset criticality levels. -->

## Edit custom classifications

Edit custom classifications as follows.

1. On the **Critical asset management** page, browse to the classification you want to modify. Only custom classifications can be edited or deleted.
1. Select **Edit**, **Delete**, or **Turn off**.

## Add assets to classifications

1. On the **Critical asset management** page, select the relevant asset classification.

1. To see all assets in the classification, select the **Overview** or **Assets** tab.

1. Review the asset list.

1. To approve assets that fit the classification but are out of threshold, browse to **Assets to review**.
1. Review the listed assets. Select the **plus** button next to the assets you want to add.

> [!NOTE]
> **Assets to review** only displays when there are assets to review.

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

## Sort by criticality

1. Select **Devices** in the **Device Inventory**.
1. Sort by **Criticality level** to view business critical assets with a "very high" level of criticality.

:::image type="content" source="./media/device-inventory.png" alt-text="screenshot of the Device inventory window" lightbox="./media/device-inventory.png":::
