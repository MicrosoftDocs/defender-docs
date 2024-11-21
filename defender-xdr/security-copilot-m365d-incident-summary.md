---
title: Summarize incidents with Microsoft Copilot in Microsoft Defender
description: Generate incident summaries with Microsoft Copilot embedded in Microsoft Defender.
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
  - security-copilot
  - magic-ai-copilot
ms.topic: conceptual
search.appverid:
  - MOE150
  - MET150
ms.date: 11/18/2024
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Summarize an incident with Microsoft Copilot in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender XDR applies the capabilities of [Security Copilot](/security-copilot/microsoft-security-copilot) to summarize incidents, delivering impactful information and insights to simplify investigation tasks. Attack investigation is a crucial step for incident response teams to successfully defend an organization against further damage from a cyber threat. Investigations can often be time-consuming as it involves numerous steps. Incident response teams need to understand how the attack happened: sort through numerous alerts, identify which assets and entities are involved, and assess the scope and impact of an attack.

This guide outlines what to expect and how to access the summarizing capability of Copilot in Defender, including information on providing feedback.

## Know before you begin

If you're new to Security Copilot, you should familiarize yourself with it by reading the following articles:

- [What is Security Copilot?](/security-copilot/microsoft-security-copilot)
- [Security Copilot experiences](/security-copilot/experiences-security-copilot)
- [Get started with Security Copilot](/security-copilot/get-started-security-copilot)
- [Understand authentication in Security Copilot](/security-copilot/authentication)
- [Prompting in Security Copilot](/security-copilot/prompting-security-copilot)

Incident responders can easily gain the right context to investigate and remediate incidents through Defender XDR's correlation capabilities and Security Copilot's AI-powered data processing and contextualization. With an incident summary, responders can quickly get important information to help in their investigation.

## Security Copilot integration in Microsoft Defender

The incident summary capability is available in the Microsoft Defender portal for customers who have provisioned access to Security Copilot.

This capability is also available in the Security Copilot standalone experience through the Microsoft Defender XDR plugin. Know more about [preinstalled plugins in Security Copilot](/security-copilot/manage-plugins#preinstalled-plugins).

## Key features

Incidents containing up to 100 alerts can be summarized into one incident summary. An incident summary, depending on the availability of the data, includes the following:

- The time and date when an attack started.
- The entity or asset where the attack started.
- A summary of timelines of how the attack unfolded.
- The assets involved in the attack.
- Indicators of compromise (IoCs).
- Names of [threat actors](/microsoft-365/security/intelligence/microsoft-threat-actor-naming) involved.

To summarize an incident, perform the following steps:

1. Open an incident page. Copilot automatically creates an incident summary upon opening the page. You can stop the summary creation by selecting **Cancel** or restart creation by selecting **Regenerate**.

2. The incident summary card loads on the Copilot pane. Review the generated summary on the card.
 
   :::image type="content" source="/defender/media/copilot-in-defender/incident-summary/copilot-defender-incident-summary-small.png" alt-text="Screenshot that shows the incident summary card on the Copilot pane as seen in the Microsoft Defender incident page." lightbox="/defender/media/copilot-in-defender/incident-summary/copilot-defender-incident-summary.png":::

   > [!TIP]
   > You can navigate to a file, IP, or URL page from the Copilot results pane by clicking on the evidence in the results.

3. Select the **More actions** ellipsis (...) at the top of the incident summary card to copy or regenerate the summary, or view the summary in the Security Copilot portal. Selecting **Open in Security Copilot** opens a new tab to the Security Copilot standalone portal where you can input prompts and access other plugins.

   :::image type="content" source="/defender/media/copilot-in-defender/incident-summary/incident-summary-options.png" alt-text="Screenshot that shows the actions available on the incident summary card.":::

4. Review the summary and use the information to guide your investigation and response to the incident.

## Sample incident summary prompt

In the Security Copilot standalone portal, you can use the following prompt to generate incident summaries:

- *Provide a summary for Defender incident {incident ID}.*

> [!TIP]
> When generating an incident summary in the Security Copilot portal, Microsoft recommends including the word ***Defender*** in your prompts to ensure that the incident summary capability delivers the results.

## Provide feedback

Microsoft highly encourages you to provide feedback to Copilot, as it’s crucial for a capability’s continuous improvement. You can provide feedback on the summary by selecting the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards](/defender/media/copilot-in-defender/copilot-defender-feedback.png) found on the bottom of the Copilot pane.

## See also

- [Learn about other Security Copilot embedded experiences](/security-copilot/experiences-security-copilot)
- [Privacy and data security in Security Copilot](/copilot/security/privacy-data-security)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
