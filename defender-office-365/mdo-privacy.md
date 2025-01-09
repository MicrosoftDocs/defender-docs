---
title: Privacy in Microsoft Defender for Office 365
f1.keywords:
- NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
ms.date: 09/03/2024
audience: ITPro
ms.topic: conceptual
ms.service: defender-office-365
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
ms.custom:
description: Admins can learn about privacy in Defender for Office 365.
search.appverid: met150
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
---

# Privacy in Microsoft Defender for Office 365

Microsoft Defender for Office 365 helps protect organizations against threats in email messages, links (URLs), file attachment, and collaboration tools. For more information about Defender for Office 365, see [Microsoft Defender for Office 365 overview](mdo-about.md).

## What do we collect?

We collect the following personal data as part of metadata when Microsoft 365 receives and processes email or Microsoft Teams messages:

- Display names
- Email addresses
- IP addresses
- Domains

Microsoft gathers system execution metadata for offline machine learning, and IP address and sender reputation information to protect users from malicious email or to filter unwanted email. This protection includes proactive [zero-hour auto purge (ZAP)](zero-hour-auto-purge.md) to remove messages that were already delivered.

All [reports in Defender for Office 365](reports-defender-for-office-365.md) are subject to End User Pseudonymous Identifiers (EUPI) and End User Identifiable Information (EUII):

- Data is shared within the organization only and is stored as plain text.
- All related data is securely stored in the organization's region.
- Only authorized users in the organization can access the data.

Microsoft stores this data securely in Microsoft Entra and maintains it in accordance with Microsoft privacy practices and [Microsoft Trust Center policies](https://go.microsoft.com/fwlink/p/?linkid=827578). All service log data at rest is encrypted and hashed using Office Data Loader (ODL) and Common Data Platform (CDP) encryption (no clear text). Defender for Office 365 uses this data for the following features:

- Threat protection policies to set the appropriate level of protection for your organization.
- Real-time reports to monitor Defender for Office 365 performance in your organization.
- Threat investigation and response capabilities that use leading-edge tools to investigate, understand, simulate, and prevent threats.
- Automated investigation and response capabilities that save time and effort investigating and mitigating threats.
- Advanced machine learning techniques and isolated detonation to detect the latest malware.

## Data location

Defender for Office 365 operates in the Microsoft Entra datacenters. For the following geo locations, data at rest for organizations that were provisioned in these geo locations is stored only in these geo locations:

- Australia
- Brazil
- Canada
- The European Union
- France
- Germany
- India
- Israel
- Italy
- Japan
- Norway
- Poland
- Qatar
- Singapore
- South Africa
- South Korea
- Sweden
- Switzerland
- United Arab Emirates
- United Kingdom
- United States

In Exchange Online Protection (EOP), the following data is stored at rest in the local region geo:

- Alerts
- Attachments
- Block lists (URLs, block entries in the Tenant Allow/Block List, user Blocked Senders lists)
- Email metadata
- Grading analysis
- Junk email
- Quarantined email and quarantined attachments
- Reports
- Service configuration data and policies
- Spam domains
- URLs

In Defender for Office 365, the following customer data is stored at rest in the local region geo:

- Alerts
- Attachments
- Block lists (URLs, block entries in the Tenant Allow/Block List, user Blocked Senders lists)
- Email metadata
- Grading analysis
- Junk email
- Quarantined email and quarantined attachments
- Reports
- Service configuration data and policies
- Spam domains
- URLs

## Data Retention

Data from Defender for Office is retained for 180 days in reporting and logs. When email and Microsoft Teams messages are sent to Microsoft 365, sender and recipient personal data is extracted. Data is stored and processed securely: personal information is encrypted and automatically deleted 30 days after the retention period.

Your data is available to you while the license is within the grace period or suspended. At the end of this period, the data is erased from Microsoft systems in an unrecoverable manner no later than 190 days from the end of the subscription or after user account deletion.

## Data sharing for Defender for Office 365

Defender for Office 365 shares data, including customer data, among the following Microsoft products, if they're also licensed by a customer:

- Microsoft 365 Defender XDR
- Microsoft Sentinel
- Audit logs
