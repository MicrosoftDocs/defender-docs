---
title: Script analysis with Microsoft Copilot in Microsoft Defender
description: Use Microsoft Copilot script analysis in Microsoft Defender to investigate scripts and command lines.
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
ms.date: 11/20/2024
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Script analysis with Microsoft Copilot in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Through AI-powered investigation capabilities from [Microsoft Security Copilot](/security-copilot/microsoft-security-copilot) in the Microsoft Defender portal, security teams can speed up their analysis of malicious or suspicious scripts and command lines.

This guide describes what the script analysis capability is and how it works, including how you can provide feedback on the results generated.

## Know before you begin

If you're new to Security Copilot, you should familiarize yourself with it by reading the following articles:

- [What is Security Copilot?](/security-copilot/microsoft-security-copilot)
- [Security Copilot experiences](/security-copilot/experiences-security-copilot)
- [Get started with Security Copilot](/security-copilot/get-started-security-copilot)
- [Understand authentication in Security Copilot](/security-copilot/authentication)
- [Prompting in Security Copilot](/security-copilot/prompting-security-copilot)

Most complex and sophisticated attacks like [ransomware](/security/ransomware) evade detection through numerous ways, including the use of scripts and PowerShell command lines. Moreover, these scripts are often obfuscated, which adds to the complexity of detection and analysis. Security operations teams need to quickly analyze scripts to understand capabilities and apply appropriate mitigation, immediately stopping attacks from progressing further within a network.

The script analysis capability provides security teams added capacity to inspect scripts without using external tools. This capability also reduces complexity of analysis, minimizing challenges and allowing security teams to quickly assess and identify a script as malicious or benign.

## Security Copilot integration in Microsoft Defender

The script analysis capability is available in the Microsoft Defender portal for customers who have provisioned access to Security Copilot.

Script analysis is also available in the Security Copilot standalone experience through the Microsoft Defender XDR plugin. Know more about [preinstalled plugins in Security Copilot](/security-copilot/manage-plugins#preinstalled-plugins).

## Key features

You can access the script analysis capability within the attack story below the incident graph on an incident page and in the [device timeline](/defender-endpoint/device-timeline-event-flag).

To begin analysis, perform the following steps:

1. Open an incident page then select an item on the left pane to open the attack story below the incident graph. Within the attack story, select an event with a script or command line that you want to analyze. Click **Analyze** to start the analysis.

   :::image type="content" source="/defender/media/copilot-in-defender/script-analyzer/copilot-defender-script-analysis-incident-small.png" alt-text="Screenshot that shows the script analysis button in the attack story view." lightbox="/defender/media/copilot-in-defender/script-analyzer/copilot-defender-script-analysis-incident.png":::

   Alternately, you can select an event to inspect in the device timeline view. On the file details pane, select **Analyze** to run the script analysis capability.

   :::image type="content" source="/defender/media/copilot-in-defender/script-analyzer/copilot-defender-script-device-timeline-small.png" alt-text="Screenshot that shows the Analyze button in the device timeline." lightbox="/defender/media/copilot-in-defender/script-analyzer/copilot-defender-script-device-timeline.png":::
  
2. Copilot runs script analysis and displays the results in the Copilot pane. Select **Show code** to expand the script, or **Hide code** to close the expansion.

   :::image type="content" source="/defender/media/copilot-in-defender/script-analyzer/show-code-script-small.png" alt-text="Screenshot highlighting the show or hide code option within the script analysis results." lightbox="/defender/media/copilot-in-defender/script-analyzer/show-code-script.png":::

3. Select **Show MITRE techniques** to view the MITRE ATT&CK techniques associated with the script. This information helps you understand the techniques used by the script and how it can impact your environment. Select **Hide MITRE techniques** to close the expansion.

   :::image type="content" source="/defender/media/copilot-in-defender/script-analyzer/hide-mitre-script-small.png" alt-text="Screenshot highlighting the show or hide MITRE techniques option within the script analysis results." lightbox="/defender/media/copilot-in-defender/script-analyzer/hide-mitre-script.png":::

4. Select the **More actions** ellipsis (...) on the upper right of the script analysis card to copy or regenerate the results, or view the results in the Security Copilot standalone experience. Selecting **Open in Security Copilot** opens a new tab to the Copilot standalone portal where you can input prompts and access other plugins.
  
    ![Screenshot that shows the More actions option in the Copilot script analysis card.](/defender/media/copilot-in-defender/script-analyzer/script-analysis-options.png)

5. Review the results an use the information to guide your investigation and response to the incident.

## Sample script analysis prompt

In the Security Copilot standalone portal, you can use the following prompt identify and analyze scripts:

- *Identify the scripts in Defender incident {incident ID}. Are these malicious scripts?*

> [!TIP]
> When analyzing scripts in the Security Copilot portal, Microsoft recommends including the word ***Defender*** in your prompts to ensure that the script analysis capability delivers the results.

## Provide feedback

Microsoft highly encourages you to provide feedback to Copilot, as it’s crucial for a capability’s continuous improvement. You can provide feedback on the results by selecting the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards.](/defender/media/copilot-in-defender/copilot-defender-feedback.png) found at the end of the script analysis card.

## See also

- [Learn about other Security Copilot embedded experiences](/security-copilot/experiences-security-copilot)
- [Privacy and data security in Security Copilot](/copilot/security/privacy-data-security)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]