---
title: Use the Microsoft Defender for Endpoint Power Automate connector to create event-triggered flows
ms.reviewer: 
description: Create Power Automate flows with the Microsoft Defender for Endpoint connector to trigger automated security workflows when events or alerts occur in your tenant.
ms.service: defender-endpoint
ms.subservice: reference
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
- Microsoft Defender for Endpoint Plan 1
- Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Use the Power Automate connector to create an event flow


Automating security procedures is a standard requirement for every modern Security Operations Center (SOC). For SOC teams to operate in the most efficient way, automation is a must. Use Microsoft Power Automate to help you create automated workflows and build an end-to-end procedure automation within a few minutes. Microsoft Power Automate supports different connectors that were built exactly for automating security workflows.  

Use this guide to create event-triggered automations in Power Automate, such as workflows that run when a new alert is created in your tenant. Microsoft Defender API has an official Power Automate Connector with many capabilities. 

:::image type="content" source="media/api-flow-0.png" alt-text="The Actions page in the Microsoft Defender 365 portal" lightbox="media/api-flow-0.png" :::

> [!NOTE]
> For more information about premium connectors licensing prerequisites, see [Licensing for premium connectors](/power-automate/triggers-introduction#licensing-for-premium-connectors).

<a name="usage-example"></a>
## Example: Create an event-triggered flow

This example demonstrates how to create a flow that is triggered whenever a new alert occurs on your tenant. You'll define what event starts the flow and which follow-up action the flow takes when the trigger occurs.  

1. Log in to [Microsoft Power Automate](https://make.powerautomate.com).

1. Go to **My flows** \> **New** \> **Automated-from blank**.

    a. :::image type="content" source="media/api-flow-1.png" alt-text="The New flow pane under My flows menu item in the Microsoft Defender 365 portal" lightbox="media/api-flow-1.png":::

1. Choose a name for your Flow, search for "Microsoft Defender ATP Triggers" as the trigger, and then select the new Alerts trigger.

    :::image type="content" source="media/api-flow-2.png" alt-text=" The Choose your flow's trigger section in the Microsoft Defender 365 portal" lightbox="media/api-flow-2.png" :::

    Now you have a Flow that is triggered every time a new Alert occurs.

    :::image type="content" source="media/api-flow-3.png" alt-text="A trigger description" lightbox="media/api-flow-3.png":::

    Next, add actions to retrieve alert details and define the automated response.
    For example, you can isolate the device if the Severity of the Alert is High and send an email about the alert.
    The Alert trigger provides only the Alert ID and the Machine ID. You can use the Microsoft Defender ATP connector to expand these entities.

### Get the Alert entity using the connector

Perform the following steps to retrieve the full Alert entity by using the connector:

1. Choose **Microsoft Defender ATP** for the new step.

1. Choose **Alerts - Get single alert API**.

1. Set the **Alert ID** from the last step as **Input**.

    :::image type="content" source="media/api-flow-4.png" alt-text="The Alerts pane"  lightbox="media/api-flow-4.png":::

### Isolate the device if the Alert's severity is High

Use the following steps to isolate the device when the alert severity is High:

1. Add **Condition** as a new step.

1. Check if the Alert severity **is equal to** High.

   If yes, add the **Microsoft Defender ATP - Isolate machine** action with the Machine ID and a comment.

    :::image type="content" source="media/api-flow-5.png" alt-text="The Actions pane"  lightbox="media/api-flow-5.png":::

1. Add a new step for emailing about the Alert and the Isolation. There are multiple email connectors that are easy to use, such as Outlook or Gmail.

1. Save your flow.

    You can also create a **scheduled** flow that runs Advanced Hunting queries and much more!

<a name="related-topic"></a>
## Related content

- [Supported operating systems and platforms for Defender Vulnerability Management](/defender-vulnerability-management/tvm-supported-os)