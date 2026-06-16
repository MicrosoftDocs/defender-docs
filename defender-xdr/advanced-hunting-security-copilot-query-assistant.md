---
title: Microsoft Security Copilot advanced hunting query assistant
description: Learn how Microsoft Security Copilot threat hunting agent can help you can generate a KQL query for you.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - security-copilot
  - magic-ai-copilot
ms.custom:
- cx-ti
- cx-ah
ms.topic: how-to
ms.date: 12/08/2025
appliesto:
- Microsoft Defender
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Microsoft Security Copilot advanced hunting query assistant

[Microsoft Security Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md) includes a query assistant feature for advanced hunting.

Threat hunters or security analysts who aren't familiar with or haven't learned Kusto query language (KQL) can make a request or ask a question in natural language (for example, *Get all alerts involving user admin123*). Security Copilot then generates a KQL query that matches the request by using the advanced hunting data schema.

This feature reduces the time it takes to write a hunting query from scratch, so threat hunters and security analysts can focus on hunting and investigating threats.

Users with access to Security Copilot can use this feature in advanced hunting.

> [!NOTE]
> The advanced hunting capability is also available in the Security Copilot standalone experience through the Microsoft Defender XDR plugin. Know more about [preinstalled plugins in Security Copilot](/security-copilot/manage-plugins#preinstalled-plugins).

## Try your first request
To start using the Query assistant, follow these steps:

>[!NOTE]
> Make sure that the Query assistant mode is active. [Learn more](advanced-hunting-security-copilot.md#get-access)

1. Open the **Advanced hunting** page from the navigation bar in Microsoft Defender portal. The Security Copilot side pane for advanced hunting appears at the right hand side.

    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-pane-big.png" alt-text="Screenshot of the Copilot pane in advanced hunting." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-pane-big.png":::

    You can also reopen Copilot by selecting **Copilot** at the top of the query editor.

 
1. In the Copilot prompt bar, ask any threat hunting query that you want to run and press :::image type="icon" source="./media/advanced-hunting-security-copilot/Send.png" border="false"::: or **Enter**.



    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-query-big.png" alt-text="Screenshot that shows prompt bar in the Security Copilot for advanced hunting." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-query-big.png":::

1. Copilot generates a KQL query from your text instruction or question. While Copilot is generating, you can cancel the query generation by selecting **Stop generating**.

    ![Screenshot of Security Copilot in advanced hunting generating a response.](./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-generate.png)


1. Review the generated query. To check how Copilot came up with the query, you can select **See the logic behind the query** below the query text to expand the explanation behind the query. Select it again to minimize.

   ![Screenshot of Copilot button showing See the logic behind the query.](./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-see-logic.png)

     You can then choose to run the query by selecting **Run query**.

   ![Screenshot of Copilot button showing Run query option.](./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-run-query.png)

    The generated query then appears as the last query in the query editor and runs automatically.

    If you need to make further tweaks, select **Add to editor**.

   ![Screenshot of Security Copilot in advanced hunting showing the Add to editor option.](./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-add-editor.png)

    The generated query appears in the query editor as the last query, where you can edit it before running using the regular **Run query** above the query editor.


1. You can provide feedback about the generated response by selecting the feedback icon ![Screenshot of feedback icon.](./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-feedback-icon.png) and choosing **Looks right**, **Needs improvement**, or **Inappropriate**.


> [!TIP]
> Providing feedback is an important way to let the Security Copilot team know how well the query assistant was able to help in generating a useful KQL query. Feel free to articulate what could make the query better, what adjustments you had to make before running the generated KQL query, or share the KQL query that you eventually used.


## Modify settings

Select the three-dot menu in the Copilot side pane to choose whether to automatically add and run the generated query in advanced hunting.

   ![Screenshot of Security Copilot in advanced hunting showing the settings three-dot menu icon.](./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-settings.png)

If you deselect the **Run generated query automatically** setting, you can choose to run the generated query automatically (**Add and run**) or add the generated query to the query editor for further modification (**Add to editor**).
