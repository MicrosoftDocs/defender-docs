---
title: Create investigations in Data Security Investigations (preview) from the Microsoft Defender portal
description: Learn how to create investigations in the Microsoft Defender portal with the Microsoft Purview Data Security Investigations (preview) integration.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
ms.topic: how-to
search.appverid: 
  - MOE150
  - MET150
ms.date: 04/23/2025
appliesto:
- ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
#customer intent: As a security administrator, I want to create data security investigations from the Microsoft Defender portal.
---

# Create investigations in Data Security Investigations (preview) from the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease](../includes/prerelease.md)]

You can now start an investigation on data security incidents from the Microsoft Defender portal with the integration of [Microsoft Purview Data Security Investigations (preview)](/purview/data-security-investigations) and Microsoft Defender XDR.

Security operations center (SOC) teams can take advantage of this integration to enhance their investigation and response to potential data security incidents like data breaches or data leaks. Data Security Investigations (preview) uses generative AI to analyze impacted data, draws connections to identify risks, and provide actionable insights to protect the organization.

SOC teams can start an investigation in Data Security Investigations (preview) from an incident page where a potentially affected data set is in the Microsoft Defender portal.

## Prerequisites

To create investigations in Data Security Investigations (preview) in the Microsoft Defender portal, you must have the following permissions:

- Security Administrator
- Security Operator

To view and access the investigation in Data Security Investigations (preview) in the Microsoft Purview portal, the *Data Security Investigations Administrator* [permission](/purview/data-security-investigations-permissions) is required.

## Create a data security investigation

Microsoft Defender XDR identifies possibly impacted sensitive data in incidents, where you can start creating an investigation in Data Security Investigations (preview). Investigations support mailboxes, files, and mail messages as the scope of the investigation.

To create an investigation in Data Security Investigations (preview) in the Microsoft Defender portal, follow these steps:

1. Sign in to the Microsoft Defender portal at [security.microsoft.com](https://security.microsoft.com).
2. In the navigation pane, select **Investigation & response** > **Incidents & alerts** > **Incidents** to open the incident queue. Select an incident from the queue to open the incident page.
3. When the selected incident contains potentially impacted data, the option to create a Data Security investigation appears on the incident page message banner. Choose **Investigate this incident**.
   :::image type="content" source="/defender-xdr/media/xdr-dsi/xdr-dsi-banner-small.png" alt-text="Screenshot of the incident page highlighting the create investigation message banner" lightbox="/defender-xdr/media/xdr-dsi/xdr-dsi-banner.png":::
4. In the pop-up window, provide a name and description for the investigation. Investigation names must be unique.
   :::image type="content" source="/defender-xdr/media/xdr-dsi/xdr-dsi-popup-small.png" alt-text="Screenshot of the Data Security investigations pop-up window" lightbox="/defender-xdr/media/xdr-dsi/xdr-dsi-popup.png":::
5. In the Investigation scope, attach mailboxes or files and mail messages to the investigation.
   > [!NOTE]
   > You can attach either mailboxes or files and mail messages in an investigation, but not both at the same time. If an incident involves both mailboxes and files or mail messages, you need to create separate investigations. For example, create one investigation for all mailboxes and another for all files and mail messages. Files and mail messages can be attached in one investigation.
6. Select **Create investigation** to finish creating the data security investigation.

Once the investigation in Data Security Investigations (preview) is created, a link to the Microsoft Purview portal appears on the message banner in the incident page. Here’s an example.

:::image type="content" source="/defender-xdr/media/xdr-dsi/xdr-dsi-success-link-small.png" alt-text="Screenshot highlighting the link to Microsoft Purview portal after successful creation" lightbox="/defender-xdr/media/xdr-dsi/xdr-dsi-success-link.png":::

You can also create an investigation in Data Security Investigations (preview) from the incident page in the following ways:

- From the **Incidents** page, select the **More actions** ellipsis to see the options, then choose **Investigate data security with AI**.
  
  :::image type="content" source="/defender-xdr/media/xdr-dsi/xdr-dsi-create-action-small.png" alt-text="Screenshot highlighting the Create Data Security investigation option from the more actions ellipsis" lightbox="/defender-xdr/media/xdr-dsi/xdr-dsi-create-action.png":::

- When you select an entity like an email in the incident graph, choose **Investigate data security with AI** from the entity context menu.

  :::image type="content" source="/defender-xdr/media/xdr-dsi/xdr-dsi-create-entity-small.png" alt-text="Screenshot highlighting the Create Data Security investigation option from an entity in the incident graph" lightbox="/defender-xdr/media/xdr-dsi/xdr-dsi-create-entity.png":::

Each investigation in Data Security Investigations (preview) created is recorded in the Microsoft Defender portal activity log. The activity log entry also includes the relevant link to the investigation created in the Microsoft Purview portal.

:::image type="content" source="/defender-xdr/media/xdr-dsi/xdr-dsi-activity-log-small.png" alt-text="Screenshot highlighting the link to Microsoft Purview portal in the activity log" lightbox="/defender-xdr/media/xdr-dsi/xdr-dsi-activity-log.png":::

## Next step

> [!div class="nextstepaction"]
> [Manage the investigation scope in Microsoft Purview Data Security Investigations (preview)](/purview/data-security-investigations-scope)