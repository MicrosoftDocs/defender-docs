---
title: Get email notifications for Threat analytics updates
ms.reviewer: 
description: Set up email notifications to get notified of new Threat analytics reports in Microsoft Defender XDR.
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
- m365initiative-m365-defender 
- tier1
ms.topic: conceptual
ms.custom: seo-marvel-apr2020
search.appverid: met150
ms.date: 01/17/2025
appliesto:
- Microsoft Defender XDR
---

# Get email notifications for Threat analytics updates

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

You can set up email notifications that send you updates on [threat analytics](threat-analytics.md) reports.

## Set up email notifications for report updates

To set up email notifications for threat analytics reports, perform the following steps:

1. In the navigation pane of the Microsoft Defender portal, select **Settings > Microsoft Defender XDR**. Under **General**, select **Email notifications**.

2. In the **Threat analytics** tab, select **+ Create a notification rule**. A flyout appears.

3. Follow the steps listed in the flyout. First, give your new rule a name. The description field is optional, but a name is required. You can toggle the rule on or off using the checkbox under the description field.

   > [!NOTE]
   > The name and description fields for a new notification rule only accept English letters and numbers. Punctuations like spaces, dashes, underscores, aren't supported.

   ![Screenshot of the naming screen, with all fields filled out and the "Turn rule on" checkbox checked](/defender/media/threat-analytics/ta_create_notification_2.png)

4. Choose the reports you want to be notified about. You can choose to be updated about all newly published or updated reports or only those reports of a certain type or with a specific tag.

   ![Screenshot of the notification screen, with Ransomware tags selected and a drop down menu for types open](/defender/media/threat-analytics/ta_create_notification_3.png)

5. Add at least one recipient to receive the notification emails. You can also use this screen to send a test email to check the notification settings.

   ![Screenshot of the recipients screen. There are 3 recipients listed, and a test email has been sent, as indicated by a green checkmark](/defender/media/threat-analytics/ta_create_notification_4.png)

6. Review your new rule. Select **Edit** at the end of each subsection to change any of the settings. Once your review is complete, select **Create rule**.

   ![Screenshot of the review screen. An edit button is highlighted in red](/defender/media/threat-analytics/ta_create_notification_5.png)

7. Select **Done** to complete the process and close the flyout. 

   ![Screenshot of the rule created screen. A successfully created rule will display green checkmarks along the sidebar, and a big green check in the main area of the screen](/defender/media/threat-analytics/ta_create_notification_6.png)

Your new rule now appears in the list of Threat analytics email notifications.

## Next steps

- [Get email notifications on incidents](m365d-notifications-incidents.md)
- [Get email notifications on response actions](m365d-response-actions-notifications.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
