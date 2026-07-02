---
title: Set up the Standard or Strict preset security policies for Microsoft Defender for Office 365
description: Assign users to the Standard or Strict preset security policies in Microsoft Defender for Office 365. These recommended policies apply and maintain Microsoft's best-practice protection settings automatically.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Set up steps for the Standard or Strict preset security policies in Microsoft Defender for Office 365

When a best practice for a security control changes due to the evolving threat landscape, or as new controls are added, security control settings are automatically updated for accounts assigned to the Standard or Strict preset security policy.

Standard and Strict preset security policies apply predefined security control settings that reflect recommended best practices and are maintained by the service.

Use the steps below to assign accounts to a Standard or Strict preset security policy and allow Defender for Office 365 to manage ongoing security control updates.

<a name="what-you-will-need"></a>
## Prerequisites

- Microsoft Defender for Office 365 Plan 1 or higher (Included in E5)
- Sufficient permissions (Security Administrator role)
- 5 minutes to perform the steps below.

## Choose between Standard and Strict policies

Our Strict preset security policy has more aggressive limits and settings for security controls that result in more aggressive detections and involve the admin in making decisions on which blocked emails are released to end users.

- Collect the list of your users that require more aggressive detections even if it means more good mail gets flagged as suspicious. These are typically your executive staff, executive support staff, and historically highly targeted users.

- Ensure that the selected users have admin coverage to review and release emails if the end user thinks that the mail might be good and requests that the message be released to them.

- If the user requires more aggressive detections and has admin coverage to review and release blocked messages, place the user in the Strict preset security policy. Otherwise, place the user in the Standard preset security policy.

> [!TIP]
> For information on what Standard and Strict security policies are, see [Recommended settings for EOP and Microsoft Defender for Office 365 security](../recommended-settings-for-eop-and-office365.md).

## Enable Security Presets in Microsoft Defender for Office 365

Once you've chosen between the Standard and Strict security preset policies for your users, it takes a few further steps to assign users to each preset.

1. Identify the users, groups, or domains you would like to include in Standard and Strict security presets.
1. Sign in to the Microsoft Security portal at <https://security.microsoft.com>.
1. On the left nav, under **Email & collaboration**, select **Policies & rules**.
1. Select **Threat policies**.
1. Select **Preset Security Policies** underneath the **Templated policies** heading
1. Select **Manage** underneath the Standard protection preset.
1. Select **All Recipients** to apply [the built-in security features](../eop-about.md) to all recipients in the organization, or select **Specific recipients** to manually add users, groups, or domains you want to apply the preset security policy to. Click the **Next** button.
1. Select **All Recipients** to apply Defender for Office 365 Protection for all recipients in the organization, or select **Specific recipients** to manually add users, groups, or domains you want to apply the preset security policy to. Click the **Next** button.
1. On the **Impersonation Protection** section, add email addresses & domains to protect from impersonation attacks, then add any trusted senders and domains you don't want the impersonation protection to apply to, then press **Next**.
1. Click on the **Confirm** button.
1. Select the **Manage protection settings** link in the Strict protection preset.
1. Repeat steps 7-10 again, but for these users *strict* protection should be applied.
1. Click on the **Confirm** button.

> [!TIP]
> To learn more, see [Preset security policies in Microsoft Defender for Office 365](../preset-security-policies.md).

<a name="your-next-step-is-config-analyzer"></a>
## Next step: Use Config Analyzer

Use [Configuration analyzer](../configuration-analyzer-for-security-policies.md) to determine whether your users are configured according to Microsoft's best practices.

> [!TIP]
> Configuration analyzer allows admins to find and fix threat policies where the settings are below the Standard or Strict protection profile settings in preset security policies. For more information, see [Configuration analyzer for threat policies in cloud organizations](../configuration-analyzer-for-security-policies.md).

We recommend preset security policies because they *ensure* admins are exercising Microsoft best practices. However, customized configurations are required is some cases. Learn about the [reasons to use custom threat policies](../mdo-deployment-guide.md#determine-your-protection-policy-strategy).
