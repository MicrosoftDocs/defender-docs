---
title: Tune Microsoft Defender for Office 365
description: Tune settings and protection in Microsoft Defender for Office 365.
ms.service: defender-office-365
f1.keywords:
  - NOCSH
ms.author: chrisda
author: MSFTBen
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
search.appverid: met150
ms.date: 04/14/2025
---

# Understanding Microsoft Defender for Office 365 “Tuning”

*Applies to: Microsoft Defender for Office 365 Plan 1 and Plan 2*

In this article

·         [Configuring Security Controls](#configuring-security-controls)

·         [Complex Routing and Dual Filtering Scenarios](#complex-routing-and-dual-filtering-scenarios)

·         [Security Control Thresholds](#security-control-thresholds)

·         [Customer Configured Allows and Blocks](#customer-configured-allows-and-blocks)

·         [Submissions and System Learning](#submissions-and-system-learning)


While Microsoft Defender for Office 365 will start protecting collaboration across Exchange Online, Teams, SharePoint, One Drive for Business, and M365 applications by default when a license containing Microsoft Defender for Office 365 is enabled, some “tuning” can help get the maximum benefit.

“Tuning” is a term that is often used to mean different things.  It can refer to [Configuring Security Controls](#configuring-security-controls) or configuring connectors [for Complex Routing and Dual Filtering Scenarios](#complex-routing-and-dual-filtering-scenarios) as part of initial setup.  It can refer to setting [Security Control Thresholds](#security-control-thresholds) on security controls like the bulk email slider and advanced filtering slider to determine how aggressively email will be blocked.  It can refer to adding and managing [Customer configured allows and blocks](#customer-configured-allows-and-blocks). Allows are a powerful tool for managing email deliverability but can let malicious or unwanted emails be delivered if not correctly managed.  Blocks will ensure unwanted emails are never delivered but can lead to user productivity loss.  Sometimes, it can even refer to [Submissions and System Learning](#submissions-and-system-learning), or how the filtering stack self corrects based on the false positive and false negative emails being submitted.

### Configuring Security Controls


The easiest and safest way to configure security controls is by onboarding to preset security policies.  By using preset security policies (Standard or Strict), you'll always have Microsoft's recommended, best practice, configuration for your users. Here are [Steps to set up the Standard or Strict preset security policies for Microsoft Defender for Office 365](/defender-office-365/step-by-step-guides/ensuring-you-always-have-the-optimal-security-controls-with-preset-security-policies).

Worried about attacks targeting your CEO, CIO, or CFO? You can [Protect your c-suite with Priority account protection in Microsoft Defender for Office 365 Plan 2](/defender-office-365/step-by-step-guides/protect-your-c-suite-with-priority-account-protection).

If custom security policies are being used, config analyzer will make recommendations to make sure Microsoft best practices are being followed.  You can [Optimize and correct security policies with configuration analyzer](/defender-office-365/step-by-step-guides/optimize-and-correct-security-policies-with-configuration-analyzer).

### Complex Routing and Dual Filtering Scenarios


Using a non-Microsoft email filtering solution in conjunction with Microsoft Defender for Office 365 requires some additional configuration to ensure you are getting the best from both filtering solutions.  Learn more about [Getting started with defense in-depth configuration for email security](/defender-office-365/step-by-step-guides/defense-in-depth-guide).  Care must be taken when using connectors to route mail to these solutions to ensure that Microsoft Defender for Office 365 has access to the original email sender information.  Configure [Enhanced filtering for connectors in Exchange Online](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors).

### Security Control Thresholds


The bulk email slider and the advanced phishing slider allow you to determine how aggressively each of those filters are applied.  To optimize the threshold where bulk mail is treated as spam you can [Assess and tune your filtering for bulk mail in Defender for Office 365](/defender-office-365/step-by-step-guides/tune-bulk-mail-filtering-walkthrough).  [Microsoft recommendations for EOP and Defender for Office 365 security settings](/defender-office-365/recommended-settings-for-eop-and-office365) contains best practices for choosing the right [Advanced phishing thresholds in anti-phishing policies in Microsoft Defender for Office 365](/defender-office-365/anti-phishing-policies-about) for your organization.

### Customer configured allows and blocks


Overrides are a powerful tool that can be used to deliver or block emails regardless of how Microsoft Defender for Office 365 dispositions the message.  [Understanding overrides within the email entity page in Microsoft Defender for Office 365](/defender-office-365/step-by-step-guides/understand-overrides-in-email-entity) provides a guide for leveraging the email entity page to understand why a message was allowed or blocked across all the different types of available overrides.

### Submissions and System Learning


The single most important thing you can do to improve the accuracy of email filtering for your users is to [Report spam, non-spam, phishing, suspicious emails and files to Microsoft](/defender-office-365/submissions-report-messages-files-to-microsoft).  This informs the Microsoft Security Analyst team what changes need to be made across the entire filtering stack to ensure your users have the best possible experience.  Here are some best practices for [How to handle malicious emails that are delivered to recipients using Microsoft Defender for Office 365](/defender-office-365/step-by-step-guides/how-to-handle-false-negatives-in-microsoft-defender-for-office-365) and [How to handle legitimate emails getting blocked from delivery using Microsoft Defender for Office 365](/defender-office-365/step-by-step-guides/how-to-handle-false-positives-in-microsoft-defender-for-office-365).

