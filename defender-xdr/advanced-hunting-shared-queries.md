---
title: Use shared queries in Microsoft Defender advanced hunting
description: Start threat hunting immediately with predefined and shared queries. Share your queries to the public or to your organization.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
ms.custom:
- msecd-doc-authoring-1014
- cx-ti
- cx-ah
ms.topic: how-to
ms.date: 06/16/2026
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
ai-usage: ai-assisted
---

# Use shared queries in advanced hunting

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[Advanced hunting](advanced-hunting-overview.md) queries can be shared with users in your organization. You can also save queries that only you can access. Community queries shared on GitHub are available too. These saved queries help you quickly start hunting for threats without writing queries from scratch.

The **Queries** tab in advanced hunting has drop-down menus for **Shared queries**, **My queries**, and **Community queries**. Select an arrow to expand a menu.

:::image type="content" source="media/advanced-hunting-shared-queries/advanced-hunting-shared-queries-1.png" alt-text="Shared queries, My queries, and Community queries in the Microsoft Defender portal" lightbox="media/advanced-hunting-shared-queries/advanced-hunting-shared-queries-1.png":::

## Save, modify, and share a query
You can save a new or existing query so that it is only accessible to you or shared with other users in your organization.

1. Create or modify a query.

2. Click the **Save query** drop-down button and select **Save as**.

3. Enter a name for the query.

   :::image type="content" source="media/advanced-hunting-shared-queries/shared-query-2.png" alt-text="The new query that is about to be saved in the Microsoft Defender portal" lightbox="media/advanced-hunting-shared-queries/shared-query-2.png":::

4. Select the folder where you'd like to save the query.
    - **Shared queries** — shared to all users your organization
    - **My queries** — accessible only to you

5. Select **Save**.

## Delete or rename a query

To rename a saved query or delete one you no longer need, follow these steps:

1. Find the query you want to change. Select the three dots to its right.

    :::image type="content" source="media/advanced-hunting-shared-queries/advanced-hunting-del-save-query.png" alt-text="Rename or delete a query in the Advanced Hunting page in the Microsoft Defender portal" lightbox="media/advanced-hunting-shared-queries/advanced-hunting-del-save-query.png":::

> [!CAUTION]
> Deleting a query removes it permanently. If you want to keep the query, rename it instead.

2. To remove the query, select **Delete** and confirm. To change its name, select **Rename** and enter a new name.

## Create a direct link to a query

To generate a link that opens your query directly in the advanced hunting query editor, finalize your query and select **Share link**.

## Access community queries in the GitHub repo

Microsoft security researchers share advanced hunting queries in a [public GitHub repository](https://github.com/Azure/Azure-Sentinel/tree/master/Hunting%20Queries/Microsoft%20365%20Defender). All contributions are reviewed before they're published. To contribute, [join GitHub for free](https://github.com/).

You can easily find these queries in the **Community queries** drop-down menu as well.

:::image type="content" source="media/advanced-hunting-shared-queries/advanced-hunting-shared-queries-2.png" alt-text="Community queries organized by folder in the Microsoft Defender portal" lightbox="media/advanced-hunting-shared-queries/advanced-hunting-shared-queries-2.png":::

Community queries are grouped into folders such as *Campaigns*, *Collection*, and *Defense evasion*. Each query includes in-line comments with more details.

> [!TIP]
> Microsoft security researchers also provide advanced hunting queries that you can use to locate activities and indicators associated with emerging threats. These queries are provided as part of the [threat analytics](/windows/security/threat-protection/microsoft-defender-atp/threat-analytics) reports in Microsoft Defender XDR.

<a name="related-topics"></a>
## Related content

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Work with query results](advanced-hunting-query-results.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
