---
title: Review and classify critical assets in Microsoft Security Exposure Management
description: Learn how to manage critical assets in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Review and classify critical assets

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) helps keep your business critical assets secure and available. This article describes how to work with critical assets.

## Prerequisites

- Before you start, learn about [critical asset management](critical-asset-management.md) in Security Exposure Management.
- [Review required permissions](prerequisites.md#permissions) for working with the critical assets.
- When classifying critical assets, we support devices running version 10.3740.XXXX of the Defender for Endpoint sensor or later. We recommended running a more recent sensor version, as listed on the Defender for Endpoint [What's New page](/defender-endpoint/windows-whatsnew).

    You can check which sensor version a device is running as follows:

    - On a specific device, browse to the MsSense.exe file in
C:\Program Files\Windows Defender Advanced Threat Protection. Right-click the file, and select **Properties**. On the **Details** tab, check the file version.
    - For multiple devices, it's easier to run an [advanced hunting Kusto query](/defender-xdr/advanced-hunting-query-language) to check device sensor versions, as follows:

        ``` DeviceInfo | project DeviceName, ClientVersion ```


## Review critical assets

Review critical assets as follows.

1. In the [Microsoft Defender portal](https://security.microsoft.com), select **Settings > Microsoft XDR > Rules > Critical asset management**.
1. On the **Critical asset management** page, review predefined and custom critical asset classifications, including the number of assets in the classification, whether assets are on or off, and criticality levels.  

:::image type="content" source="./media/classify-critical-assets/critical-asset-management-window.png" alt-text="Screenshot of the Critical asset management window." lightbox="./media/classify-critical-assets/critical-asset-management-window.png":::

> [!NOTE]
> You can also see critical assets in **Assets > Devices** > **Classify critical asset**. In addition, you can view the **Critical Asset Protection** initiative in **Exposure insights -> Initiatives**.

## Request a new predefined classification

Request a new predefined classification as follows.

1. On the **Critical asset management** page, select **Suggest new classification**.

1. Fill in what classification you'd like to see and then select **Submit request**.

## Create a custom classification

Create a custom classification as follows.

1. On the **Critical asset management** page, select **Create a new classification.**

1. On the **Create a critical asset classification** page, complete the following information to set your classification criteria:

    - **Name** - A new classification name.
    - **Description** - A new classification description.
    - **Query builder**
        - Use the query builder to define a new classification, for instance, "mark all devices with a certain naming convention as critical."
        - Add one or more boolean filters that are defined per device, identity, or cloud resource.

:::image type="content" source="./media/classify-critical-assets/create-critical-asset-classification.png" alt-text="Screenshot of the page where you create critical asset classifications." lightbox="./media/classify-critical-assets/create-critical-asset-classification.png":::

1. After setting the criteria, select **Next**.
1. On the following pages, preview the affected assets, and assign the criticality level.

## Set critical asset levels

Set levels as follows.

1. On the **Critical asset management** page, select a critical asset classification.

1. In the **Overview** tab, select the desired criticality level.

1. Select **Save**.

:::image type="content" source="./media/classify-critical-assets/edit-criticality-levels.png" alt-text="Screenshot of the Critical asset management criticality editing feature.":::

> [!NOTE]
> You can set critical levels manually in the device inventory. We recommend creating criticality rules that allow broad application of critical levels across assets.

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

:::image type="content" source="./media/classify-critical-assets/assets-to-review.png" alt-text="Screenshot of the Assets to review screen.":::

You can change the criticality levels and turn off all assets. You can also edit and delete custom critical assets.

## Sort by criticality

1. Select **Devices** in the **Device Inventory**.
1. Sort by **Criticality level** to view business critical assets with a "very high" level of criticality.

:::image type="content" source="./media/classify-critical-assets/device-inventory.png" alt-text="screenshot of the Device inventory window" lightbox="./media/classify-critical-assets/device-inventory.png":::

## Prioritize recommendations for critical assets

To help prioritize security recommendations, and remediation steps to focus on critical assets, the sum of exposed critical assets for a recommendation can be viewed from the [Security recommendations](/defender-vulnerability-management/tvm-security-recommendation) page in the Microsoft Defender portal.

To see the sum of exposed critical assets go to the [Security recommendations](/defender-vulnerability-management/tvm-security-recommendation) page:

   :::image type="content" source=" ./media/critical-asset-management/security-recommendations-critical-assets.png" alt-text="Screenshot of the critical assets column on the security recommendations page." lightbox="./media/critical-asset-management/security-recommendations-critical-assets.png":::

## Next steps

Learn about simulating [attack paths](work-attack-paths-overview.md).
