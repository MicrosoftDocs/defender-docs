---
title: Respond to and mitigate threats in Microsoft Defender for Business
description: Learn how to investigate, respond to, and mitigate detected threats in Microsoft Defender for Business through an example workflow in the Defender portal.
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 07/03/2026
ms.reviewer: nehabha
ms.collection:
- SMB
- m365-security
- m365-initiative-defender-business
- tier1
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Respond to and mitigate threats in Microsoft Defender for Business

The Microsoft Defender portal enables your security team to respond to and mitigate detected threats. This article walks you through an example of how you can use Defender for Business to review threat indicators on the Home page, investigate at-risk devices in the device inventory, and take response actions such as running an antivirus scan or initiating an automated investigation.

## View detected threats

Use the following steps to view detected threats in the Microsoft Defender portal and take response actions.

1. Go to the [Microsoft Defender portal](https://security.microsoft.com) and sign in.

2. Notice the cards on the Home page. These cards show how many threats were found, how many user accounts were affected, and which devices or other assets are at risk. The following image is an example:

   :::image type="content" source="media/mdb-examplecards.png" alt-text="Screenshot of cards in the Microsoft Defender portal":::

3. Select a button or link on a card to view more details. For example, the **Devices at risk** card has a **View details** button. Select the **View details** button to open the **Devices** list, as shown in the following image:

   :::image type="content" source="media/mdb-device-inventory.png" alt-text="Screenshot of device inventory":::

   The **Devices** page lists company devices with their risk level and exposure level.

4. Select an item, such as a device. A flyout pane opens with more details about alerts and incidents for the selected device, as shown in the following image:

   :::image type="content" source="media/mdb-deviceinventory-selecteddeviceflyout.png" alt-text="Screenshot of the flyout pane for a selected device":::

5. On the flyout, review the details. Select the ellipsis (...) to open a menu of available actions, as shown in the following image:

   :::image type="content" source="media/mdb-deviceinventory-selecteddeviceflyout-menu.png" alt-text="Screenshot of available actions for a selected device":::

6. Select an available action. For example, you might choose **Run antivirus scan**, which starts a quick scan with Microsoft Defender Antivirus on the device. Or, you could select **Initiate Automated Investigation** to trigger an automated investigation on the device.

## Next steps

Learn more about related Defender for Business tasks:

- [Learn about automatic attack disruption](mdb-attack-disruption.md)
- [Review remediation actions in the Action center](mdb-review-remediation-actions.md)
- [Manage devices in Defender for Business](mdb-manage-devices.md)
- [View and manage incidents in Defender for Business](mdb-view-manage-incidents.md)
