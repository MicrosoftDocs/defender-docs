---
title: How to use the Microsoft Defender Experts for XDR service
ms.reviewer:
description: Learn about the different in-portal experiences in Microsoft Defender where you can view and perform Defender Experts notifications and activities
ms.service: defender-experts-for-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-manage
ms.topic: how-to
search.appverid: met150
ms.date: 03/24/2026
---

# Start using Defender Experts for XDR service

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

After you complete the [onboarding steps and readiness checks](get-started-xdr.md) for Microsoft Defender Experts for XDR and once the experts begin to perform comprehensive response work on your behalf, you start receiving notifications about incidents that require remediation steps and targeted recommendations on critical incidents. You can also start chatting with the experts or your security delivery experts (SDXs) and viewing reports on the number of incidents they investigated and resolved.

This article describes the different in-portal experiences in Microsoft Defender where you can view and perform the previously mentioned Defender Experts notifications and activities, among others. These experiences provide you visibility into the experts' activities and clear entry points into tasks that require your attention.

## Where to find Microsoft Defender Experts in Microsoft Defender portal

You can view and monitor Defender Experts activities in the following sections of the Microsoft Defender portal:
- As a status card in the portal home page
- In the portal navigation menu

:::image type="content" source="media/start-using-mdex-xdr/defender-experts-experiences.png" alt-text="Screenshot of the Microsoft defender portal with the Defender Experts experiences highlighted." lightbox="media/start-using-mdex-xdr/defender-experts-experiences.png":::

### Home page card

The Defender Experts status card in the Defender portal home page is located in the upper portion. You see a summary of the experts' activities and items requiring your attention immediately when you open the portal. 

By default, this status card is located in the top row immediately after the home page banner. It might surface the following information:
- Onboarding and readiness calls to action
- Managed response incidents that require customer action
- Messages that might be awaiting your response
- Incidents that Defender Experts handled in the last month
- A call to action to open Defender Experts overview page for more details

### Navigation menu

When you subscribe to the Defender Experts service, you see **Defender Experts** as a distinct entry in the Defender portal navigation menu. This feature provides you with consistent and predictable access to the service across the portal.

From this navigation menu, you can go directly to the Defender Experts overview page or check your communications with the experts.

#### Overview

The **Defender Experts Overview** page provides a consolidated view of Defender Experts activity, status, and outcomes. You can understand the value of the service without navigating across multiple areas in the portal.

:::image type="content" source="media/start-using-mdex-xdr/defender-experts-overview-page.png" alt-text="Screenshot of Defender Experts overview page." lightbox="media/start-using-mdex-xdr/defender-experts-overview-page.png":::

The information it provides helps you answer the following questions:

-	What does Defender Experts need me to do right now?
-	What did Defender Experts recently investigate or hunt for?

The page brings together high-signal information in a single place, including:
- **Items that require your action:** A summary of incidents or findings where customer input or acknowledgment is needed.
- **XDR highlights:** Recent Defender Experts investigations, detections, or completed work along with their outcomes.
- **Hunting highlights:** A snapshot of notable hunting activity and results.

#### Messages

The Defender Experts messages page lets you track your managed response chat conversations and inquiries you submitted through Ask Defender Experts.

:::image type="content" source="media/start-using-mdex-xdr/defender-experts-messages.png" alt-text="Screenshot of Defender Experts messages page." lightbox="media/start-using-mdex-xdr/defender-experts-messages.png":::

Select a message topic to open a side panel where you can read through the conversation and respond to it. You can also perform several actions to manage your messages, including:
- Export the list of messages into a .CSV file
- Mark messages as unread or read
- Group messages according to status, submitter, and reference (for example, incident ID)
- Display messages from a given time period
                                                           
## How Defender Experts in-portal experiences work together
The home page card, navigation menu, and overview page work together to give you a cohesive user experience flow:
1.	You discover Defender Experts from the portal homepage left navigation menu.
1.	To open the Defender Experts overview page, select **Defender Experts** > **Overview** from the navigation menu.
1.	From the overview page, drill down into specific incidents, investigations, or hunting-related experiences.

This flow reduces friction, improves visibility into managed hunting activity, and helps you more easily understand the scope and impact of Defender Experts.

## Next steps
The Defender Experts overview page serves as your starting point to:
- Review active or recent Defender Experts activity.
- Understand where analyst attention is focused.
- Navigate to detailed experiences for investigations, hunting results, or follow-up actions.

For more information, see the following articles:
- [Managed detection and response](managed-detection-and-response-xdr.md)
- [Communicating with experts in the Microsoft Defender Experts for XDR service](communicate-defender-experts-xdr.md)
- [Get real-time visibility with Defender Experts for XDR reports](reports-xdr.md)