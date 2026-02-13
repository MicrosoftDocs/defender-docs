---
title: Add users and assign licenses in Microsoft Defender for Business
description: Add users and assign Defender for Business licenses to protect their devices
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: bagol
audience: Admin
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 08/25/2025
ms.collection:
- m365-security
- tier1
ms.reviewer: efratka
f1.keywords: NOCSH
---

# Add users and assign licenses in Microsoft Defender for Business

After you sign up for Microsoft Defender for Business, your first step is to add users and assign licenses. This article describes how to add users and assign licenses, and how to verify multifactor authentication (MFA) is enabled for users.

:::image type="content" source="media/mdb-setup-step2.png" alt-text="Visual depicting step 2 - add users and assign licenses in Defender for Business.":::

## Add users and assign licenses

For complete instructions, see [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users).

<a name='make-sure-mfa-is-enabled'></a>)

## Verify MFA is enabled for users

All organizations created after October 2019 have _security defaults_ enabled by default, which requires MFA for all users. For more information, see [Multifactor authentication for Microsoft 365](/microsoft-365/admin/security-and-compliance/multi-factor-authentication-microsoft-365).

To verify that security defaults is enabled in your organization, see [Set up multifactor authentication for Microsoft 365](/microsoft-365/admin/security-and-compliance/set-up-multi-factor-authentication).

> [!TIP]
> Organizations with Microsoft Entra ID P1 (for example, Microsoft 365 Business Premium or an add-on subscription) also have access to Conditional Access to enforce MFA and other security requirements. For more information, see [Multifactor authentication for Microsoft 365](/microsoft-365/admin/security-and-compliance/multi-factor-authentication-microsoft-365).
   If you don't have any licenses available, you can still add a user and buy additional licenses. For more information about adding users, see [Add users and assign licenses at the same time](/Microsoft-365/admin/add-users/add-users).

## Next steps

- [Step 3: Assign security roles and permissions in Microsoft Defender for Business](mdb-roles-permissions.md).

- [Step 4: Set up email notifications for your security team](mdb-email-notifications.md).
