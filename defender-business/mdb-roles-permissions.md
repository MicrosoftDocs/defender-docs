---
title: Assign security roles and permissions in Microsoft Defender for Business
description: Assign roles to your cybersecurity team. Learn about these roles and permissions in Defender for Business.
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 09/11/2025
ms.reviewer: efratka, nehabha
ms.collection:
- SMB
- m365-security
- m365solution-mdb-setup
- highpri
- tier1
---

# Assign security roles and permissions in Microsoft Defender for Business

This article describes how to assign security roles and permissions in Defender for Business.

:::image type="content" source="media/mdb-setup-step3.png" alt-text="Visual depicting step 3 - assign security roles and permissions in Defender for Business.":::

Your organization's security team needs certain permissions to perform tasks, such as

- Configuring Defender for Business
- Onboarding (or removing) devices
- Viewing reports about devices and threat detections
- Viewing incidents and alerts
- Taking response actions on detected threats

Permissions are granted through certain roles in the [Microsoft Entra ID](/entra/identity/role-based-access-control/manage-roles-portal). These roles can be assigned in the Microsoft 365 admin center or in the Microsoft Entra admin center.

## What to do

1. [Learn about roles in Defender for Business](#roles-in-defender-for-business).
2. [View or edit role assignments for your security team](#view-and-edit-role-assignments).
3. [Proceed to your next steps](#next-steps).

## Roles in Defender for Business

The following table describes the main roles that are assigned in Defender for Business.

|Permission level|Description|
|---|---|
|**Security Administrator**|Security Administrators can perform the following tasks: <ul><li>View and manage security policies</li><li>View, respond to, and manage alerts</li><li>Take response actions on devices with detected threats</li><li>View security information and reports</li></ul> <br/> In general, security admins use the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) to perform security tasks.|
|**Security Reader**|Security Readers can perform the following tasks: <ul><li>View a list of onboarded devices</li><li>View security policies</li><li>View alerts and detected threats</li><li>View security information and reports </li></ul> <br/> Security readers can't add or edit security policies, nor can they onboard devices.|

For more information about roles, see the following articles:

- [About admin roles](/microsoft-365/admin/add-users/about-admin-roles)
- [Security guidelines for assigning roles](/microsoft-365/admin/add-users/about-admin-roles#security-guidelines-for-assigning-roles)

## View and edit role assignments

> [!IMPORTANT]
> Microsoft recommends that you grant people access to only what they need to perform their tasks. We call this concept *least privilege* for permissions. To learn more, see [Best practices for least-privileged access for applications](/entra/identity-platform/secure-least-privileged-access).

You can use the Microsoft 365 admin center or the Microsoft Entra admin center to view and edit role assignments.

## [**Microsoft 365 admin center**](#tab/M365Admin)

1. Go to the Microsoft 365 admin center ([https://admin.microsoft.com](https://admin.microsoft.com)) and sign in.

2. In the navigation pane, go to **Users** \> **Active users**.

3. Select a user account to open their flyout pane.

4. On the **Account** tab, under **Roles**, select **Manage roles**.

5. To add or remove a role, use one of the following procedures:

   |Task|Procedure|
   |---|---|
   |Add a role to a user account|<ol><li>Select **Admin center access**, scroll down, and then expand **Show all by category**.</li><li>Select one of the following roles: <ul><li>Security Administrator (listed under **Security & Compliance**)</li><li>Security Reader (listed under **Read-only**)</li>/ul></li><li>Select **Save changes**.</li></ol>|
   |Remove a role from a user account|<ol><li>Either select **User (no admin center access)** to remove *all* admin roles, or clear the checkbox next to one or more of the assigned roles.</li><li>Select **Save changes**.</li></ol>|

## [**Microsoft Entra admin center**](#tab/Entra)

1. Go to the Microsoft Entra admin center ([https://entra.microsoft.com](https://entra.microsoft.com/)) and sign in.

2. In the navigation pane, go to **Users** \> **All users**.

3. Open a user profile by selecting the user account.

4. To add or remove a role, use one of the following procedures:

   |Task|Procedure|
   |---|---|
   |Add a role to a user account|1. Under **Manage**, select **Assigned roles**, and then choose **+ Add assignments**.<br/><br/>2. Search for one of the following roles, select it, and then choose **Add** to assign that role to the user account.<br/><br/>- Security Administrator<br/>- Security Reader|
   |Remove a role from a user account|1. Under **Manage**, select **Assigned roles**.<br/><br/>2. Select one or more administrative roles, and then select **X Remove assignments**.|

---

## Next steps

- Proceed to [Step 4: Set up email notifications for your security team](mdb-email-notifications.md).
- [Step 5: Onboard devices to Microsoft Defender for Business](mdb-onboard-devices.md)
