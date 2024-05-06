---
title: Review architecture requirements and planning concepts for Microsoft Defender for Office 365
description: The technical diagram for Microsoft Defender for Office 365 in Microsoft Defender XDR helps you understand identity at Microsoft 365 before you build your trial lab or pilot environment.
search.appverid: met150
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: tracyp
author: MSFTTracyP
ms.date: 04/26/2024
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
  - m365-security
  - m365solution-scenario
  - m365solution-evalutatemtp
  - zerotrust-solution
  - highpri
  - tier1
ms.topic: conceptual
---

# Review Microsoft Defender for Office 365 architecture requirements and key concepts

**Applies to:**
- Microsoft Defender XDR

This article is [Step 1 of 3](eval-defender-office-365-overview.md) in the process of setting up the evaluation environment for Microsoft Defender for Office 365. For more information about this process, see the [overview article](eval-defender-office-365-overview.md).

Before enabling Defender for Office 365, be sure you understand the architecture and can meet the requirements. This article describes the architecture, key concepts, and the prerequisites that your Exchange Online environment must meet.

## Understand the architecture

The following diagram illustrates baseline architecture for Microsoft Defender for Office 365, which can include a third-party SMTP gateway or on-premises integration. Hybrid coexistence scenarios (that is, production mailboxes are both on-premises and online) require more complex configurations and aren't covered in this article or evaluation guidance.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-office-architecture.svg" alt-text="A diagram for the architecture for the Microsoft Defender for Office 365." lightbox="./media/eval-defender-xdr/m365-defender-office-architecture.svg":::

The following table describes this illustration.

|Call-out|Description|
|---|---|
|1|The host server for the external sender typically performs a public DNS lookup for an MX record, which provides the target server to relay the message. This referral can either be Exchange Online (EXO) directly or an SMTP gateway configured to relay against EXO.|
|2|Exchange Online Protection negotiates and validates the inbound connection and inspects the message headers and content to determine what extra policies, tagging, or processing is required.|
|3|Exchange Online integrates with Microsoft Defender for Office 365 to offer more advanced threat protection, mitigation, and remediation.|
|4|A message that isn't malicious, blocked, or quarantined is processed and delivered to the recipient in EXO where user preferences related to junk mail, mailbox rules, or other settings are evaluated and triggered.|
|5|Integration with on-premises Active Directory can be enabled using Microsoft Entra Connect to synchronize and provision mail-enabled objects and accounts to Microsoft Entra ID and ultimately Exchange Online.|
|6|When integrating an on-premises environment, it's encouraged to use an Exchange server for supported management and administration of mail-related attributes, settings, and configurations|
|7|Microsoft Defender for Office 365 shares signals to Microsoft Defender XDR for extended detection and response (XDR).|

On-premises integration is common but optional. If your environment is cloud-only, this guidance also works for you.

## Understand key concepts

The following table identified key concepts that are important to understand when evaluating, configuring, and deploying Defender for Office 365.

|Concept|Description|More information|
|---|---|---|
|Exchange Online Protection|Exchange Online Protection (EOP) is the cloud-based filtering service that helps protect your organization against spam and malware in email. EOP is included in all Microsoft 365 licenses that include Exchange Online.|[Exchange Online Protection overview](/defender-office-365/eop-about)|
|Anti-malware protection|Organizations with mailboxes in Exchange Online are automatically protected against malware.|[Anti-malware protection in EOP](/defender-office-365/anti-malware-protection-about)|
|Anti-spam protection|Organizations with mailboxes in Exchange Online are automatically protected against junk mail and spam.|[Anti-spam protection in EOP](/defender-office-365/anti-spam-protection-about)|
|Anti-phishing protection|Defender for Office 365 offers more advanced anti-phishing protection related to spear phishing, whaling, ransomware, and other malicious activities.|[Extra anti-phishing protection in Microsoft Defender for Office 365](/defender-office-365/anti-phishing-protection-about)|
|Anti-spoofing protection|EOP includes features to help protect your organization from spoofed (forged) senders.|[Anti-spoofing protection in EOP](/defender-office-365/anti-phishing-protection-spoofing-about)|
|Safe Attachments|Safe Attachments provides an extra layer of protection by using a virtual environment to check and "detonate" attachments in email messages before they're delivered.|[Safe Attachments in Microsoft Defender for Office 365](/defender-office-365/safe-attachments-about)|
|Safe Attachments for SharePoint, OneDrive, and Microsoft Teams|In addition, Safe Attachments for SharePoint, OneDrive, and Microsoft Teams offers an extra layer of protection for files that have been uploaded to cloud storage repositories.|[Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](/defender-office-365/safe-attachments-for-spo-odfb-teams-about)|
|Safe Links|Safe Links is a feature that provides URL scanning and rewriting within inbound email messages and offers verification of those links before they're delivered or clicked.|[Safe Links in Microsoft Defender for Office 365](/defender-office-365/safe-links-about)|

For more detailed information about the capabilities included with Microsoft Defender for Office 365, see [Microsoft Defender for Office 365 service description](/office365/servicedescriptions/office-365-advanced-threat-protection-service-description).

## Review architecture requirements

A successful Defender for Office 365 evaluation or production pilot assumes the following prerequisites:

- All your recipient mailboxes are currently in Exchange Online.
- Your public MX record resolves directly to EOP or a third-party Simple Mail Transfer Protocol (SMTP) gateway that then relays inbound external email directly to EOP.
- Your primary email domain is configured as *authoritative* in Exchange Online.
- You successfully deployed and configured *Directory-Based Edge Blocking* (DBEB) as appropriate. For more information, see [Use Directory-Based Edge Blocking to reject messages sent to invalid recipients](/exchange/mail-flow-best-practices/use-directory-based-edge-blocking).

> [!IMPORTANT]
> If these requirements aren't applicable or you are still in a hybrid coexistence scenario, then a Microsoft Defender for Office 365 evaluation can require more complex or advanced configurations which aren't fully covered in this guidance.

## SIEM integration

You can integrate Microsoft Defender for Office 365 with Microsoft Sentinel to more comprehensively analyze security events across your organization and build playbooks for effective and immediate response. For more information, see [Connect alerts from Microsoft Defender for Office 365](/azure/sentinel/connect-office-365-advanced-threat-protection).

Microsoft Defender for Office 365 can also be integrated into other Security Information and Event Management (SIEM) solutions using the [Office 365 Activity Management API](/office/office-365-management-api/office-365-management-activity-api-reference).

## Next steps

Step 2 of 3: [Enable the evaluation environment Microsoft Defender for Office 365.](eval-defender-office-365-enable-eval.md)

Return to the overview for [Evaluate Microsoft Defender for Office 365.](eval-defender-office-365-overview.md)

Return to the overview for [Evaluate and pilot Microsoft Defender XDR](eval-overview.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
