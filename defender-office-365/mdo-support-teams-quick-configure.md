---
title: Quickly configure Microsoft Teams protection in Microsoft Defender for Office 365 Plan 2
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
description: Admins who aren't using Microsoft Defender for Office 365 can learn how to quickly set up protection in Microsoft Teams.
ms.service: defender-office-365
ms.date: 04/15/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
---

# Quickly configure Microsoft Teams protection in Microsoft Defender for Office 365 Plan 2

Even if you aren't using Microsoft Defender for Office 365 Plan 2 for email protection, you can still use it for Microsoft Teams protection.

This article contains the quick steps to turn on and configure Defender for Office 365 protection for Microsoft Teams.

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>.

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Authorization and settings/Security settings/Core Security settings (manage)**.
  - [Email & collaboration permissions in the Microsoft Defender portal](mdo-portal-permissions.md) and [Exchange Online permissions](/exchange/permissions-exo/permissions-exo):
    - Membership in the **Organization Management** or **Security Administrator** role groups in Email & collaboration permissions <u>and</u> membership in the **Organization Management** role group in Exchange Online permissions.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup> or **Security Administrator** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

- Allow up to 30 minutes for a new or updated policy to be applied.

- For more information about licensing requirements, see [Licensing terms](/office365/servicedescriptions/office-365-advanced-threat-protection-service-description#licensing-terms).

- Teams integration deployment is part of the overall deployment process of Defender for Office 365. For more information, see [Pilot and deploy Defender for Office 365](/defender-xdr/pilot-deploy-defender-office-365?toc=%2Fdefender-office-365%2FTOC.json&bc=%2Fdefender-office-365%2Fbreadcrumb%2Ftoc.json).

## Step 1: Verify Safe Attachments integration for Microsoft Teams

For complete instructions, see [Turn on Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](safe-attachments-for-spo-odfb-teams-configure.md).

1. In the Microsoft Defender portal, go to the **Safe Attachments** page at <https://security.microsoft.com/safeattachmentv2>.
2. On the **Safe Attachments** page, select :::image type="icon" source="media/m365-cc-sc-gear-icon.png" border="false"::: **Global settings**.
3. In the **Global settings** flyout that opens, go to the **Protect files in SharePoint, OneDrive, and Microsoft Teams** section to verify **Turn on Defender for Office 365 for SharePoint, OneDrive, and Microsoft Teams** is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

> [!TIP]
>
> - You can't restrict Safe Attachments for SharePoint, OneDrive, and Microsoft Teams to Microsoft Teams only.
> - You can't scope Safe Attachments for SharePoint, OneDrive, and Microsoft Teams to specific users. It's on or off for everyone.

## Step 2: Verify Safe Links integration for Microsoft Teams

For complete instructions, see [Use the Microsoft Defender portal to modify custom Safe Links policies](safe-links-policies-configure.md#use-the-microsoft-defender-portal-to-modify-custom-safe-links-policies).

1. In the Microsoft Defender portal, go to the **Safe Links** page at <https://security.microsoft.com/safelinksv2>.
2. On the **Safe Links** page, verify Teams integration is turned on in any custom policies (policies with a numerical **Priority** value) by doing the following steps:
   1. Select the policy by clicking anywhere in the row other than the check box next to the first column.
   2. In the **Teams** section of the **Protection settings** section in the details flyout that opens, verify the value is **On: Safe Links checks a list of known, malicious links when users click links in Microsoft Teams. URLs are not rewritten**.

      If the value is **Off**, select **Edit protection settings** at the bottom of the **Protection settings** section. In the **URL & click protection settings** flyout that opens, select the check box in the **Teams** section, select **Save**, and then select **Close**.

   Repeat these steps on every custom Safe Links policy.

> [!TIP]
> Teams integration is on in the [Built-in protection preset security policy](preset-security-policies.md), but any other Safe Links policies [take precedence](preset-security-policies.md#order-of-precedence-for-preset-security-policies-and-other-threat-policies) over the Built-in protection preset security policy (as shown in the order they're listed on the **Safe Links** page).

## Step 3: Verify Zero-hour auto purge (ZAP) for Microsoft Teams

For complete instructions, see [Configure ZAP for Teams protection in Defender for Office 365 Plan 2](mdo-support-teams-about.md#configure-zap-for-teams-protection-in-defender-for-office-365-plan-2).

1. In the Microsoft Defender portal, go to the **Microsoft Teams protection** page at <https://security.microsoft.com/securitysettings/teamsProtectionPolicy>.

2. On the **Microsoft Teams protection** page, verify the toggle in the **Zero-hour auto purge (ZAP)** section is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

> [!TIP]
> When ZAP for Microsoft Teams is turned on, you can use **Exclude these participants** on the **Microsoft Teams protection** page to exclude users from Teams protection. For more information, see [Configure ZAP for Teams protection in Defender for Office 365 Plan 2](mdo-support-teams-about.md#configure-zap-for-teams-protection-in-defender-for-office-365-plan-2).

## Step 4: Configure user reported settings for Microsoft Teams

For complete instructions, see [User reported message settings in Microsoft Teams](submissions-teams.md).

1. In the Teams admin center, go to the **Messaging policies** page at <https://admin.teams.microsoft.com/policies/messaging>.

2. On the **Manage policies** tab of the **Messaging policies** page, verify that the **Manage policies** tab is selected, and do either of the following actions to edit the appropriate policy (the **Global (Org-wide) default** policy for all users or a custom policy for specific users):
   - Select the link in the **Name** column.
   - Select the policy by clicking anywhere in the row other than the **Name** column, and then select :::image type="icon" source="media/m365-cc-sc-edit-icon.png" border="false"::: **Edit**.

3. In the policy details page that opens, find the **Report a security concern** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

4. In the Microsoft Defender portal, go to the **User reported settings** page at <https://security.microsoft.com/securitysettings/userSubmission>.

5. On the **User reported settings** page, go to the **Microsoft Teams** section, and verify **Monitor reported messages in Microsoft Teams** is selected.

   If it's not selected, select the check box, and then select **Save**.
