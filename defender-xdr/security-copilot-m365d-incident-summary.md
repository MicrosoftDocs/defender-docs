---
title: Summarize incidents with Microsoft Copilot in Microsoft Defender
description: Generate incident summaries with Microsoft Copilot embedded in Microsoft Defender.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.topic: how-to
ms.date: 11/18/2025
ms.update-cycle: 180-days
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal


---

# Summarize an incident with Microsoft Copilot in Microsoft Defender

Microsoft Defender XDR applies the capabilities of [Security Copilot](/security-copilot/microsoft-security-copilot) to summarize incidents. Incident summaries provide impactful information and insights to simplify investigation tasks. Investigations are often time-consuming and involve numerous steps.

This guide outlines how to access the summarizing capability of Copilot in Defender and what information is included in the summary, including information on providing feedback.

## Prerequisites

If you're new to Security Copilot, familiarize yourself with it by reading the following articles:

- [What is Security Copilot?](/security-copilot/microsoft-security-copilot)
- [Security Copilot experiences](/security-copilot/experiences-security-copilot)
- [Get started with Security Copilot](/security-copilot/get-started-security-copilot)
- [Understand authentication in Security Copilot](/security-copilot/authentication)
- [Prompting in Security Copilot](/security-copilot/prompting-security-copilot)

Incident responders can access the right context to investigate and remediate incidents through Defender XDR's correlation capabilities and Security Copilot's AI-powered data processing and contextualization. With an incident summary, responders get important information quickly to help in their investigation.

## Security Copilot integration in Microsoft Defender

The incident summary capability is available in the Microsoft Defender portal for customers with provisioned access to Security Copilot.

This capability is also available in the Security Copilot standalone experience through the Microsoft Defender XDR plugin. Know more about [preinstalled plugins in Security Copilot](/security-copilot/manage-plugins#preinstalled-plugins).

## Incident summary content

Incidents containing up to 100 alerts can be summarized into one incident summary. An incident summary, depending on the availability of the data, includes the following information:

- The time and date when an attack started.
- The entity or asset where the attack started.
- A summary of timelines of how the attack unfolded.
- The assets involved in the attack.
- Indicators of compromise (IoCs).
- Names of [threat actors](/unified-secops-platform/microsoft-threat-actor-naming) involved.
- Suggested Security Copilot prompts, which guide you to focus on the most relevant next steps, gain deeper insights, and simplify investigations.

### Summarize an incident

1. Open an incident page. Copilot automatically creates an incident summary in the **Tasks** pane. You can stop the summary creation by selecting **Cancel** or restart creation by selecting **Regenerate**.

1. The incident summary card loads on the Copilot pane. Review the generated summary on the card. Review the summary and use the information to guide your investigation and response to the incident.

   :::image type="content" source="media/copilot-in-defender/incident-summary/copilot-defender-incident-summary.png" alt-text="Screenshot that shows the incident summary card on the Copilot pane as seen in the Microsoft Defender incident page." lightbox="media/copilot-in-defender/incident-summary/copilot-defender-incident-summary.png":::

   > [!TIP]
   > You can navigate to a file, IP, or URL page from the Copilot results pane by clicking on the evidence in the results.

1. Select **See prompts** to view suggested prompts. Suggested prompts surface relevant follow-up questions based on the most crucial information in the given incident.

   Select a suggested prompt to get more insights about the specific assets involved in the incident, such as device summaries, identity summaries, and related threat intelligence.

   :::image type="content" source="media/security-copilot-m365d-incident-summary/copilot-defender-incident-summary-see-prompts.png" lightbox="media/security-copilot-m365d-incident-summary/copilot-defender-incident-summary-see-prompts-large.png" alt-text="Screenshot that shows the Copilot suggested prompts on the incident summary card.":::

1. Select the **More actions** ellipsis (...) at the top of the incident summary card to copy or regenerate the summary, or view the summary in the Security Copilot portal. Selecting **Open in Security Copilot** opens a new tab to the Security Copilot standalone portal where you can input prompts and access other plugins.

   :::image type="content" source="media/security-copilot-m365d-incident-summary/incident-summary-options.png" alt-text="Screenshot that shows the actions available on the incident summary card.":::

### Manage Copilot incident summaries settings (preview)

By default, Copilot generates a summary for each incident the user opens, but you can change this setting to display incident summaries only in specific instances. You can choose to have summaries generated:

- Always (for every incident opened)
- Based on the severity level of the incident
- On demand only

To change the settings for Copilot incident summaries in Microsoft Sentinel, follow these steps:

1. Go to **System** > **Settings** > **Copilot in Defender** in the Microsoft Sentinel navigation pane.

    :::image type="content" source="media/security-copilot-m365d-incident-summary/copilot-settings.png" alt-text="Screenshot that shows the Copilot settings page in Microsoft Sentinel.":::

1. Under **Preferences**, select **Incident Summary generation**.
1. Select either **Auto-generate** or **Generate on demand**, depending on your preference.
1. If you select **Auto-generate**, choose between **Always** or **Incident severity**. If you select **Incident severity**, choose the *minimum* severity level for which you want Copilot to generate incident summaries automatically.

    :::image type="content" source="media/security-copilot-m365d-incident-summary/copilot-settings-preferences.png" alt-text="Screenshot that shows the Copilot settings preferences page in Microsoft Sentinel.":::

1. Select **Save**.

- When you select **Incident severity**, an estimate of the number of incidents of each severity level reviewed per day is displayed, along with the estimated SCU consumption.

    :::image type="content" source="./media/security-copilot-m365d-incident-summary/incident-severity.png" alt-text="Screenshot that shows the approximate number of incidents of each severity level.":::

- Copilot saves generated incident summaries for a week. If the incident you select has a summary already in the cache, and the incident didn't change significantly, the summary is automatically redisplayed at no cost regardless of the setting.
- To generate a summary on demand for an incident that doesn't automatically generate, select the **Generate** button.

    :::image type="content" source="media/security-copilot-m365d-incident-summary/generate-summary.png" alt-text="Screenshot that shows the Generate summary button on the incident page.":::

## Sample incident summary prompt

In the Security Copilot standalone portal, you can use the following prompt to generate incident summaries:

- *Provide a summary for Defender incident {incident ID}.*

> [!TIP]
> When you generate an incident summary in the Security Copilot portal, include the word ***Defender*** in your prompts to ensure that the incident summary capability delivers the results.

## Provide feedback

Microsoft highly encourages you to provide feedback to Copilot, as it's crucial for a capability's continuous improvement. You can provide feedback on the summary by selecting the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards](media/copilot-in-defender/copilot-defender-feedback.png) found on the bottom of the Copilot pane.

## See also

- [Learn about other Security Copilot embedded experiences](/security-copilot/experiences-security-copilot)
- [Privacy and data security in Security Copilot](/copilot/security/privacy-data-security)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
