---
title: Rerun queries in query history
description: View previously run advanced hunting queries in the Query history tab and rerun them even after closing the original query tab.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom:
- msecd-doc-authoring-1014
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
---

# Rerun queries in query history

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]



<a name="query-history"></a>
## Query history overview

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

Your previous queries appear in the **Query history** tab in the lower half of the advanced hunting page. You can rerun past queries even after closing the tab where they ran. 

## View the query history tab

To view your query history, select the **Query history** tab. 

:::image type="content" source="media/advanced-hunting-query-history/advanced-hunting-query-history.png" alt-text="Screenshot of the query history pane in advanced hunting" lightbox="media/advanced-hunting-query-history/advanced-hunting-query-history.png":::

Recent queries appear with the newest first. The list keeps up to 30 queries from the last 28 days.

By default, **Query history** shows these columns:
- Time - when the query started
- Query   
- Query time - how long the query took
- State - whether the query finished, failed, or was throttled

To hide columns, select **Customize columns**.



## Rerun queries from query history

To reuse a previous query, select it. The **Run query** and **Use in editor** options appear. 

:::image type="content" source="media/advanced-hunting-query-history/advanced-hunting-query-history-functions.png" alt-text="Screenshot of the query history functions in advanced hunting" lightbox="media/advanced-hunting-query-history/advanced-hunting-query-history-functions.png":::

Select **Run query** to run it right away, or select **Use in editor** to edit it first.
