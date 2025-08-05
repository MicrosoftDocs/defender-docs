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
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Microsoft Defender for Office 365 tuning

When a relevant license is enabled, Microsoft Defender for Office 365 protects collaboration across Exchange Online, Teams, SharePoint, OneDrive, and Microsoft 365 applications by default. However, you can do some "tuning" for maximum benefit.

The term "tuning" is used often and can mean different things. For example:

- [Configuring security controls](#configuring-security-controls) or [configuring connectors for complex routing and dual filtering scenarios](#complex-routing-and-dual-filtering-scenarios) as part of initial setup.
- Setting [security control thresholds](#security-control-thresholds) (for example, the bulk email slider and the advanced filtering slider) to determine how aggressively email is blocked.
- Adding and managing [customer configured allows and blocks](#customer-configured-allows-and-blocks). Allows are a powerful tool for managing email deliverability but can let malicious or unwanted email be delivered if not correctly managed. Blocks ensure unwanted email isn't delivered but can lead to user productivity loss.
- [Submissions and system learning](#submissions-and-system-learning), or how the filtering stack self corrects based on the submission of false positive and false negative email.

## Configuring security controls

The easiest and safest way to configure security controls is by onboarding to [preset security policies](../preset-security-policies.md). By using the Standard or Strict preset security policies, you always have Microsoft's recommended, best practice configuration for users. For instructions, see [Steps to set up the Standard or Strict preset security policies for Microsoft Defender for Office 365](ensuring-you-always-have-the-optimal-security-controls-with-preset-security-policies.md).

Are you worried about attacks targeting your CEO, CIO, or CFO? You can [Protect your c-suite with Priority account protection in Microsoft Defender for Office 365 Plan 2](protect-your-c-suite-with-priority-account-protection.md).

If you use custom security policies, configuration analyzer gives recommendations to make sure you follow Microsoft's best practices. You can [Optimize and correct threat policies with configuration analyzer](optimize-and-correct-security-policies-with-configuration-analyzer.md).

## Complex routing and dual filtering scenarios

Using a non-Microsoft email filtering solution with Defender for Office 365 requires some extra configuration to ensure you're getting the best from both filtering solutions. For more information, see [Getting started with defense in-depth configuration for email security](defense-in-depth-guide.md). You need to be careful when using connectors to route mail to ensure that Defender for Office 365 has access to the original email sender information. To meet this requirement, configure [Enhanced filtering for connectors in Exchange Online](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors).

## Security control thresholds

The bulk email slider and the phishing email threshold slider allow you to determine how aggressively each of those filters is applied. To optimize the threshold where bulk mail is treated as spam, you can [Assess and tune your filtering for bulk mail in Defender for Office 365](tune-bulk-mail-filtering-walkthrough.md). [Recommended email and collaboration threat policy settings for cloud organizations](../recommended-settings-for-eop-and-office365.md#phishing-email-thresholds-in-anti-phishing-policies-in-microsoft-defender-for-office-365) contains best practices for choosing the right [Phishing email threshold](../anti-phishing-policies-about.md#phishing-email-thresholds-in-anti-phishing-policies-in-microsoft-defender-for-office-365) for your organization.

## Customer configured allows and blocks

Overrides are a powerful tool that can be used to deliver or block email regardless of how Defender for Office 365 evaluates the message. [Understanding overrides within the email entity page in Microsoft Defender for Office 365](understand-overrides-in-email-entity.md) provides a guide for using the email entity page to understand why a message was allowed or blocked across all the different types of available overrides.

### Submissions and system Learning

The single most important thing you can do to improve the accuracy of email filtering for users is to [Report spam, non-spam, phishing, suspicious email and files to Microsoft](../submissions-report-messages-files-to-microsoft.md). This information informs the Microsoft Security Analyst team what changes need to be made across the entire filtering stack to ensure users have the best possible experience. Here are some best practices for [How to handle malicious emails that are delivered to recipients using Microsoft Defender for Office 365](how-to-handle-false-negatives-in-microsoft-defender-for-office-365.md) and [How to handle legitimate emails getting blocked from delivery using Microsoft Defender for Office 365](how-to-handle-false-positives-in-microsoft-defender-for-office-365.md).
