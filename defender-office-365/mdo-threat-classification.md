---
title: Threat classification in Defender for Office 365
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: overview
ms.localizationpriority: medium
search.appverid:
  - MET150
  - MOE150
ms.collection:
  - m365-security
  - tier1
description: Admins can learn about threat classification in Microsoft Defender for Office 365.
ms.service: defender-office-365
ms.date: 01/06/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Threat classification in Microsoft Defender for Office 365

Effective threat classification is a crucial component of cybersecurity that enables organizations to quickly identify, assess, and mitigate potential risks. The threat classification system in Microsoft Defender for Office 365 uses advanced technologies such as large language models (LLMs), small language models (SLMs), and machine learning (ML) models to automatically detect and classify email-based threats. These models work together to provide comprehensive, scalable, and adaptive threat classification, helping security teams stay ahead of emerging attacks.

By categorizing email threats into specific types, such as phishing, malware, and business email compromise (BEC), our system provides organizations with actionable insights to protect against malicious activities.

## Threat types

_Threat type_ refers to the primary categorization of a threat based on fundamental characteristics or attack method. Historically, these broad categories are identified early in the attack lifecycle and help organizations understand the nature of the attack. Common threat types include:

- **Phishing**: Attackers impersonate trusted entities to deceive recipients into revealing sensitive information such as sign in credentials or financial data.
- **Malware**: Malicious software designed to damage or exploit systems, networks, or devices.
- **Spam**: Unsolicited, often irrelevant email sent in bulk, typically for malicious or promotional purposes.

## Threat detections

_Threat detections refer to the technologies and methodologies that are used to identify specific indicators or suspicious activities within an email message or communication. Threat detections help spot the presence of threats by identifying anomalies or characteristics in the message. Common threat detections include:

- **Spoof**: Identifies when the sender's email address is forged to look like a trusted source.
- **Impersonation**: Detects when an email message impersonates a legitimate entity, such as an executive or trusted business partner, to trick recipients into taking harmful actions.
- **URL reputation**: Assesses the reputation of URLs included in an email to determine if they lead to malicious websites.
- **Other filters**

## Threat classification

_Threat classification_ is the process of categorizing a threat based on intent and the specific nature of the attack. The threat classification system uses LLMs, ML models, and other advanced techniques to understand the intent behind threats and provide a more accurate classification. As the system evolves, you can expect new threat classifications to keep pace with emerging attack methods.

Different threat classes are described in the following list:

- **Advance fee scam**: Victims are promised large financial rewards, contracts, or prizes in exchange for upfront payments or a series of payments, which the attacker never delivers.

- **Business intelligence**: Requests for information regarding vendors or invoices, which are used by attackers to build a profile for further targeted attacks, often from a look-alike domain that mimics a trusted source.

- **Callback phishing**: Attackers use phone calls or other communication channels to manipulate individuals into revealing sensitive information or performing actions that compromise security.

- **Contact establishment**: Email messages (often generic text) to verify whether an inbox is active and to initiate a conversation. These messages aim to bypass security filters and build a trusted reputation for malicious future messages.

- **Credential phishing**: Attackers attempt to steal usernames and passwords by tricking individuals into entering their credentials on a fraudulent website or through manipulative email prompts.

- **Credit card collection**: Attackers attempt to steal credit card information and other personal details by deceiving individuals into providing their payment information through fake email messages, websites, or messages that appear legitimate.

- **Extortion**: The attacker threatens to release sensitive information, compromise systems, or take malicious actions unless a ransom is paid. This type of attack typically involves psychological manipulation to coerce the victim into compliance.

- **Gift cards**: Attackers impersonate trusted individuals or organizations, convincing the recipient to purchase and send gift card codes, often using social engineering tactics.

- **Invoice fraud**: Invoices that look legitimate, either by altering details of an existing invoice or submitting a fraudulent invoice, with the intent to trick recipients into making payments to the attacker.

- **Payroll fraud**: Manipulate users into updating payroll or personal account details to divert funds into the attacker's control.

- **Personally identifiable information (PII) gathering**: Attackers impersonate a high-ranking individual, such as a CEO, to request personal information. These email messages are often followed by a shift to external communication channels like WhatsApp or text messages to evade detection.

- **Social OAuth phishing**: Attackers use single sign-on (SSO) or OAuth services to deceive users into providing their sign in credentials, gaining unauthorized access to personal accounts.

- **Task fraud**: Short, seemingly safe email messages asking for assistance with a specific task. These requests are designed to gather information or induce actions that can compromise security.

## Where threat classification results are available

The results of threat classification are available in the following experiences in Defender for Office 365:

- [Explorer (Threat Explorer)](threat-explorer-real-time-detections-about.md)
- [Incidents and alerts](mdo-sec-ops-manage-incidents-and-alerts.md)
- [Advanced hunting](/defender-xdr/advanced-hunting-overview)
