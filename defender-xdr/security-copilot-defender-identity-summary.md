---
title: Summarize identity information with Microsoft Copilot in Microsoft Defender
description: Summarize an identity information with Microsoft Copilot in Microsoft Defender to investigate identities.
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
ms.date: 10/14/2024
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel with Defender XDR in the Microsoft Defender portal
---

# Summarize identity information with Microsoft Copilot in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Security operations teams investigating users can easily understand identity information with the identity summary capability in [Microsoft Security Copilot](/security-copilot/microsoft-security-copilot) in Microsoft Defender. Through generative AI and harnessing the power of Microsoft Defender for Identity, Copilot creates contextual insights about an identity in an organization, helping analysts quickly understand important data to speed up their investigation.

With the identity summary capability, analysts can immediately identify suspicious or risky identity-related changes and actions that can negatively impact an organization. The summary also includes potential misconfigurations that affect an identity. Using natural language, Copilot delivers clear and actionable user information that analysts can use in their incident investigation activities. The capability currently focuses on users and will include service accounts in its next iteration.

This guide describes what the identity summary capability is and how it works, including how you can provide feedback on the results generated.

## Know before you begin

If you're new to Security Copilot, you should familiarize yourself with it by reading the following articles:

- [What is Security Copilot?](/security-copilot/microsoft-security-copilot)
- [Security Copilot experiences](/security-copilot/experiences-security-copilot)
- [Get started with Security Copilot](/security-copilot/get-started-security-copilot)
- [Understand authentication in Security Copilot](/security-copilot/authentication)
- [Prompting in Security Copilot](/security-copilot/prompting-security-copilot)

With the identity summary capability, analysts can immediately identify suspicious or risky identity-related changes and actions that can negatively impact an organization. The summary also includes potential misconfigurations that affects an identity. Using natural language, Copilot delivers clear and actionable user information that analysts can use in their incident investigation activities. The capability currently focuses on users and will include service accounts in its next iteration.

## Security Copilot integration in Microsoft Defender

The identity summary capability is available in the Microsoft Defender portal for customers who have provisioned access to Security Copilot. 

Users who access the Security Copilot standalone portal can use this capability through the Microsoft Defender XDR plugin. Know more about [preinstalled plugins in Security Copilot](/security-copilot/manage-plugins#preinstalled-plugins).

## Key features

The identity summary contains essential information about an identity, including:

- The date when a user account is created, and whether the user account is of high, medium, or low criticality
- Any unusual behavioral patterns related to sign in locations, sign in frequency, or frequency of failed sign in attempts
- A user's current role, including their department and position, and whether there are notable role changes compared to the user's job title and department to highlight inconsistencies
- Data about a user's last sign in to a device, whether or not the device is associated to the user, in the last 30 days
- Authentication methods and applications used
- Risks associated with a user based on Microsoft Entra ID
- General information like a user's professional title and contact information, department, and their manager's contact information

You can access the identity summary capability in the following ways:

- From an incident page, choose an identity on the incident graph and then (1) select **User details**. In the user details pane, (2) select **Summarize**. The results are displayed in the Copilot side panel.

  :::image type="content" source="/defender/media/copilot-in-defender/identity-summary/identity-summary-incident-small.png" alt-text="Screenshot showing the Summarize option in the user details pane." lightbox="/defender/media/copilot-in-defender/identity-summary/identity-summary-incident.png":::

- Alternatively, you can select **Go to user page** on the bottom of the user details pane to open the user page. Copilot automatically generates the identity summary and displays the side panel upon opening the user page.

- You can also access the identity summary capability by choosing a user in the **Assets** tab of an incident. Select **Summarize** in the user details pane to generate the identity summary.

   :::image type="content" source="/defender/media/copilot-in-defender/identity-summary/identity-summary-assets-small.png" alt-text="Screenshot showing the Assets tab and a user account highlighted." lightbox="/defender/media/copilot-in-defender/identity-summary/identity-summary-assets.png":::

- In an alert page, select a user then select **Summarize** in the user details pane to generate the identity summary.

- In the advanced hunting page, you can access the identity summary capability by selecting a user in the results table, then selecting the link to the user page. Copilot automatically generates the identity summary and displays the side panel upon opening the user page.

- From the main menu, navigate to **Assets > Identities**. Select a username from the list, then select **View user page** to open the user page. Copilot automatically generates the identity summary and displays the side panel upon opening the user page.

   :::image type="content" source="/defender/media/copilot-in-defender/identity-summary/identity-summary-viewuser-small.png" alt-text="Screenshot highlighting the view user page option in a username search within Identities." lightbox="/defender/media/copilot-in-defender/identity-summary/identity-summary-viewuser.png":::

- Type a username in the Microsoft Defender portal's **search box** then select the username from the search results. In the user details side panel, select **Summarize** to generate the identity summary.

Review the identity summary results. You can copy the results to clipboard, regenerate the results, or open Security Copilot by selecting the More actions ellipsis (...) on top of the identity summary card. You can extend your investigation of identity using prompts and other plugins in the Security Copilot portal.

## Sample identity summary prompt

In the Security Copilot standalone portal, you can use the following prompt to generate an identity summary:

- *Show the Defender summary of this user in the last {time frame}.*

> [!TIP]
> When investigating users in the Security Copilot portal, Microsoft recommends including the word ***Defender*** in your prompts to ensure that the identity summary capability delivers the results. You can specify up to 120 days on the investigation time frame, with the default being 30 days when you don't indicate one.

## Provide feedback

Microsoft highly encourages you to provide feedback to Copilot, as it's crucial for a capability's continuous improvement. To provide feedback, navigate to the bottom of the Copilot side panel and select the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards](/defender/media/copilot-in-defender/create-report/copilot-defender-feedback.png).

  :::image type="content" source="/defender/media/copilot-in-defender/identity-summary/feedback-textbox.png" alt-text="Screenshot that shows the Feedback text box where you can share your feedback.":::

Fill in the dedicated text box to share your thoughts, experiences, and requests. Microsoft values your feedback and takes it seriously in our commitment to enhance Copilot's performance and user experience.

## See also

- [Learn about other Security Copilot embedded experiences](/security-copilot/experiences-security-copilot)
- [Privacy and data security in Security Copilot](/copilot/security/privacy-data-security)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
