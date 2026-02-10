---
title: Alert Triage Agent permissions and prerequisites
description: Review the prerequisites, permissions, and configuration requirements needed to run the Alert Triage Agent in Microsoft Defender.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: how-to
search.appverid:
- MOE150
- MET150
ms.date: 01/25/2026
appliesto:
- Microsoft Defender XDR
#customer intent: As a security administrator, I want to understand the prerequisites and permissions needed for the Alert Triage Agent so that I can properly prepare my environment for deployment.
---

# Alert Triage Agent permissions and prerequisites

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Before setting up the Alert Triage Agent, ensure your environment meets the necessary prerequisites and your organization has the required permissions configured. This article outlines the products, features, and permissions needed to successfully deploy and operate the Alert Triage Agent.

## Prerequisites

To run the Alert Triage Agent in your environment, you need:

|Components|Details|
|:---|:---|
|Products|- Security Copilot and provisioned capacity in Security Compute Units (SCU). See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) or check whether you're entitled to SCUs as part of the [Microsoft Security Copilot inclusion model](/copilot/security/security-copilot-inclusion)</br> - At least one of the [supported products](alert-triage-agent-overview.md#supported-workloads-and-alert-types) deployed and configured. |
|Microsoft Defender required features|- Unified role-based access control (URBAC) enabled for Defender for Office 365. See [Activate URBAC settings](#activate-urbac-settings) for more information. </br> - Enable **Monitor reported messages in Outlook** in **User reported settings**. See [User reported settings](#configure-user-reported-settings) for more information </br> - The alert policy **Email reported by user as malware or phish** must be turned on. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information|
| Plugins | The Phishing Triage Agent automatically activates these Security Copilot plugins: <br>- Microsoft Defender XDR<br>- Microsoft Threat Intelligence<br>- Phishing Triage Agent |

### Activate URBAC settings

To ensures the agent has the necessary access to triage alerts, activate the URBAC settings for all of the [supported products](alert-triage-agent-overview.md#supported-workloads-and-alert-types) you want to associate with the Alert Triage Agent.

For more information, see [Activate workloads in Microsoft Defender XDR settings](activate-defender-rbac.md#activate-in-microsoft-defender-xdr-settings).

### Configure user reported settings

Enable **Monitor reported messages in Outlook** to define how users report potentially malicious messages in Microsoft Outlook and select any of the **Reported message destinations** options: 

:::image type="content" source="media/phishing-triage-agent/configure-user-reported-settings.png" alt-text="Screenshot of the User reported settings page showing the Outlook report button and reported message destinations configurations." lightbox="media/phishing-triage-agent/configure-user-reported-settings.png":::

For more information, see [Use the Microsoft Defender portal to configure user reported settings](/defender-office-365/submissions-user-reported-messages-custom-mailbox).

If you're using a third-party email reporting tool, review [Options for third-party reporting tools](/defender-office-365/submissions-user-reported-messages-custom-mailbox) and view your vendor's options to integrate reported messages with Microsoft Defender XDR.

### Add alert policy

The Phishing Triage Agent addresses phishing incidents that include alerts with the type **Email reported by user as malware or phish**. Ensure that you have the corresponding alert policy enabled. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information.

> [!IMPORTANT]
> The Phishing Triage Agent doesn't classify alerts that you suppress by using [suppression rules](/defender-endpoint/manage-suppression-rules).

## Permissions required

This table outlines the permissions required to perform various actions related to the Phishing Triage Agent in the Defender portal.

| **User action**                                              | **Permission required**                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| View agent results and teach agent through feedback | View agent results and provide feedback you need the same permissions as the agent, or higher. For more information, see [Alert Triage Agent required permissions](alert-triage-agent-setup.md#alert-triage-agent-required-permissions). |
| View  agent settings                                         | **Security  Copilot (read)** and **Security data  basics (read)** under the **Security operations** permissions  group in the Defender portal<br>OR<br>**Security Administrator** in Microsoft Entra ID |
| View  feedback page | **Security  Copilot (read)**, **Security data basics  (read)**, and **Email & collaboration metadata (read)** under  the **Security operations** permissions group in the Defender  portal<br>OR<br>**Security Administrator** in Microsoft Entra ID |
| Manage  agent settings (set up, pause, remove the agent, and manage agent identity) | **Security  Administrator** in Microsoft Entra ID            |
| Reject  feedback                                             | **Security  Administrator** in Microsoft Entra ID            |

For more information about unified RBAC in the Defender portal, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).


## Next steps

- [Set up the Alert Triage Agent](alert-triage-agent-setup.md)
- [Learn how to use the agent](alert-triage-agent-usage.md)

## Related content

- [Alert Triage Agent overview](alert-triage-agent-overview.md)
- [Activate workloads in Microsoft Defender XDR settings](activate-defender-rbac.md)
- [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md)