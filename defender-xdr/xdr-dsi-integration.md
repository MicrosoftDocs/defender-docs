---
title: Create data security investigations in the Microsoft Defender portal
description: Learn how to create data security investigations in the Microsoft Defender portal with the Microsoft Purview Data Security Investigations integration.
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
ms.date: 04/09/2025
appliesto:
- ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
#customer intent: As a security administrator, I want to create data security investigations from the Microsoft Defender portal.
---

# Create data security investigations in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease](../includes/prerelease.md)]

You can now start an investigation on data security incidents from the Microsoft Defender portal with the integration of Microsoft Purview Data Security Investigations and Microsoft Defender XDR.

Security operations center (SOC) teams can take advantage of this integration to enhance their investigation and response to potential data security incidents in their environment like data breaches or data leaks. Using AI, Microsoft Purview Data Security Investigations analyzes impacted data, draws connections to identify risks, and provides actionable insights to protect the organization.

SOC teams can start a data security investigation from an incident page where a potentially affected data set is in the Microsoft Defender portal.

## Prerequisites

To create data security investigations in the Microsoft Defender portal, you need to have the  following permissions:

- Security Administrator
- Security Operator

The **Data Security Investigations Administrator** permission is required to successfully view and access data security investigations in the Microsoft Purview portal.

## Create a data security investigation

Microsoft Defender XDR identifies possibly impacted sensitive data in incidents, where you can start creating a data security investigation. To create a data security investigation in the Microsoft Defender portal, follow these steps:

1. Sign in to the Microsoft Defender portal.
2. Navigate to the incidents queue then select an incident to open the incident page.
3. When the selected incident has potentially impacted data, the option to **Create investigation** appears on the incident page message banner. Choose **Create investigation**.
[SCREENSHOT]
4. In the pop-up window, provide a name and description for the investigation. 
[SCREENSHOT]
   > [!TIP]
   > Investigation names must be unique.
5. Attach mailboxes or files and mail messages to the investigation.
   > [!NOTE]
   > You can attach either mailboxes or files and mail messages in an investigation, but not both. If an incident involves both mailboxes and files or mail messages, you need to create separate investigations. For example, create one investigation for all mailboxes and another for all files and mail messages.
6. Select **Create** to finish creating the data security investigation.

After creating the data security investigation, a link to the Microsoft Purview portal appears on the message banner in the incident page. Here’s an example.

[SCREENSHOT]

You can also create a data security investigation from the Microsoft Defender portal in several ways:

- From the **Incidents** page, select the **More actions** ellipsis to see the options, then choose **Create data security investigation**.
  
  [SCREENSHOT]

- When you select an entity like an email in the incident graph, choose **Create data security investigation** from the entity context menu.

  [SCREENSHOT]

Each data security investigation created is recorded in the Microsoft Defender portal activity log. The activity log entry also includes the relevant link to the investigation created in the Microsoft Purview portal.

[SCREENSHOT]

## Next step

> [!div class="nextstepaction"]
> [Investigate data security incidents in the Microsoft Purview portal](link.md)

