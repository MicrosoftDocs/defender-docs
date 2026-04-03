---
title: Quickly configure Microsoft Teams protection in Microsoft Defender for Office 365
f1.keywords:
  - NOCSH
author: chrisda
ms.author: chrisda
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
ms.date: 04/02/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
---

# Quickly configure Microsoft Teams protection in Microsoft Defender for Office 365

Even if you aren't using Microsoft Defender for Office 365 for email protection, you can still use it for Microsoft Teams protection.

This article contains the quick steps to turn on and configure Defender for Office 365 protection for Microsoft Teams.

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>.

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Authorization and settings/Security settings/Core Security settings (manage)**.
  - [Email & collaboration permissions in the Microsoft Defender portal](mdo-portal-permissions.md) and [Exchange Online permissions](/exchange/permissions-exo/permissions-exo):
    - Membership in the **Organization Management** or **Security Administrator** role groups in Email & collaboration permissions <u>and</u> membership in the **Organization Management** role group in Exchange Online permissions.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup> or **Security Administrator** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

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

> [!IMPORTANT]
> Teams integration is on in the [Built-in protection preset security policy](preset-security-policies.md), but any other Safe Links policies [take precedence](preset-security-policies.md#order-of-precedence-for-preset-security-policies-and-other-threat-policies) over the Built-in protection preset security policy (as shown in the order they're listed on the **Safe Links** page). So, ensure that Teams protection is enabled in these policies.

<a name="step-3-verify-warnings-for-unsafe-links-are-shown-in-microsoft-teams-messages"></a>

## Step 3: Verify unsafe link warnings in Microsoft Teams messages

> [!NOTE]
> Currently, this feature is in Preview, isn't available in all organizations, and is subject to change.

You need to be assigned permissions before you can do the following procedure. Specifically, you need to be a member of the **Teams Administrator** or **Global Administrator**<sup>\*</sup> roles in [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal).

> [!IMPORTANT]
> <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you typically limit to emergency scenarios or when you can't use a different role.

For more information about near real-time warning messages on known bad links in Microsoft Teams messages, see [Microsoft Defender for Office 365 support for Microsoft Teams](mdo-support-teams-about.md).

1. In the Microsoft Teams admin center, go to the **Message settings** page at <https://admin.teams.microsoft.com/messaging/settings>.

2. On the **Message settings** page, go to the **Messaging safety** section and verify the **Scan messages for unsafe links** toggle is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

:::image type="content" source="media/teams-message-url-warning-on-off.png" alt-text="Screenshot of the Scan messages for unsafe links toggle in the Microsoft Teams admin center." lightbox="media/teams-message-url-warning-on-off.png":::

## Step 4: Defender for Office 365: Verify Zero-hour auto purge (ZAP) for Microsoft Teams

For complete instructions, see [Configure ZAP for Teams protection in Defender for Office 365](mdo-support-teams-about.md#configure-zap-for-teams-protection-in-defender-for-office-365).

1. In the Microsoft Defender portal, go to the **Microsoft Teams protection** page at <https://security.microsoft.com/securitysettings/teamsProtectionPolicy>.

2. On the **Microsoft Teams protection** page, verify the toggle in the **Zero-hour auto purge (ZAP)** section is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

> [!TIP]
> When ZAP for Microsoft Teams is turned on, you can use **Exclude these participants** on the **Microsoft Teams protection** page to exclude users from Teams protection. For more information, see [Configure ZAP for Teams protection in Defender for Office 365](mdo-support-teams-about.md#configure-zap-for-teams-protection-in-defender-for-office-365).

## Step 5: Defender for Office 365: Configure user reported settings for Microsoft Teams

For complete instructions, see [User reported message settings in Microsoft Teams](submissions-teams.md).

1. In the Teams admin center, go to the **Settings & policies** page at <https://admin.teams.microsoft.com/one-policy/settings>.

2. On the **Settings & policies** page, select either the **Global (Org-wide) default settings** tab for all users or **Custom policies for users & groups** for specific users.

3. On the tab, go to the **Messaging** section and select **Messaging**. If you selected the **Custom policies for users & groups** tab in the previous step, do one of the following steps to edit the specific policy:
   - Click on the policy name in the **Name** column.
   - Click anywhere in the row other than the **Name** column, and then select the :::image type="icon" source="media/m365-cc-sc-edit-icon.png" border="false"::: **Edit** action that appears.

4. In the policy details page that opens, find the **Report a security concern** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-security-risk.png" alt-text="Screenshot of the 'Report a security concern' toggle in Messaging policies in the Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-security-risk.png":::

5. In the Teams admin center, go to the **Messaging settings** page at <https://admin.teams.microsoft.com/messaging/settings>.

6. On the **Messaging settings** page, go to the **Messaging safety** section, find the **Report incorrect security detections** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-not-security-risk.png" alt-text="Screenshot of the Report incorrect security detections toggle on the Messaging settings page in the Microsoft Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-not-security-risk.png":::

7. In the Teams admin center, go to the **Calling settings** page at <https://admin.teams.microsoft.com/one-policy/settings/calling>.

8. On the **Calling settings** page, go to the **General** section, find the **Report a call** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-security-risk-call.png" alt-text="Screenshot of the 'Report a call toggle on the Call settings page in the Microsoft Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-security-risk-call.png":::

9. In the Microsoft Defender portal, go to the **User reported settings** page at <https://security.microsoft.com/securitysettings/userSubmission>.

10. On the **User reported settings** page, go to the **Microsoft Teams** section, and verify **Monitor reported items in Microsoft Teams** is selected.

   If it's not selected, select the check box, and then select **Save**.
