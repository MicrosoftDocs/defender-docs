---
title: Configuring Microsoft Defender Experts app in Teams
ms.reviewer: pauloliveria
description: "Microsoft Defender Experts Teams troubleshooting: Resolve app installation, permission, and channel availability problems quickly."
#customer intent: As an IT admin, I want to troubleshoot issues with the Microsoft Defender Experts app in Teams so that my organization can use its security features without interruption.
ms.service: defender-experts
ms.subservice: dex-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
audience: ITPro
ms.collection:
 - m365-security
 - tier1
 - essentials-manage
ms.topic: troubleshooting-general
ms.custom: 
- cx-ti
- cx-dex
search.appverid: met150
ms.date: 04/21/2026
---

# Troubleshooting issues with Microsoft Defender Experts app in Microsoft Teams

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

This article discusses common issues you might encounter when setting up and using the Microsoft Defender Experts app in Microsoft Teams. It provides step-by-step guidance for diagnosing and resolving these issues.

## App policy permissions

The Microsoft Defender Experts app is available for Microsoft Teams by default. However, some environments might have limitations that block the app's installation because of app policy permissions in Teams. [Learn how to check Teams app permissions policies](#check-the-teams-app-permission-policies).

:::image type="content" source="media/teams-restrictions-dexapp/teams-communication-issues.png" alt-text="Screenshot of Teams communication restrictions." lightbox="media/teams-restrictions-dexapp/teams-communication-issues.png":::

When you join the Defender Experts Teams channel, you can mention or tag the Defender Experts bot in the channel by typing _@Defender Experts_. If the bot doesn't show up in the list of suggestions, Teams permissions policies might prevent the app from functioning. To learn more, see [communicating with Defender Experts for XDR](../defender-xdr/communicate-defender-experts-xdr.md).

The following screenshot is an example of the missing bot:

:::image type="content" source="media/teams-restrictions-dexapp/teams-app-bot.png" alt-text="Screenshot of Teams app bot.":::

### Check the Teams app permission policies

**To verify if the Teams permission policies are preventing the Defender Experts app from working, follow these steps.**

1. In Microsoft Teams, select **Apps** on the Teams workspace.

   :::image type="content" source="media/teams-restrictions-dexapp/apps-teams-workspace.png" alt-text="Screenshot of Apps options in Teams workspace.":::

1. Type **Defender Experts** in the search pane to see the Defender Experts app.
1. Select **Request** to request the Defender Experts service.

   :::image type="content" source="media/teams-restrictions-dexapp/request-defender-experts.png" alt-text="Screenshot to request Defender Experts app in Microsoft Teams.":::

**If you already have the Teams app installed and you encounter a policy issue, follow these steps:**

- Go to the **Manage apps** page for the Defender Experts app, and then go to the **User requests** tab. Learn more about [Manage app - Microsoft Teams admin center](https://admin.teams.microsoft.com/policies/manage-apps/81769126-d9ed-4a77-a1e8-2ab8107adf03/user-requests).

If you see the following notification, the Teams app permission policies prevent you from using the Defender Experts app:

```
This app is blocked in app permission policies. To approve a user's app request, review the app permission policies assigned to them and allow the app in any policies where it's blocked.
```

  :::image type="content" source="media/teams-restrictions-dexapp/app-permissions-blocked.png" alt-text="Screenshot of Defender Experts app permissions blocked image in Teams.":::

### Fix the Teams app permission policies

To fix the Teams app permission policy that stops the Defender Experts app from running, use one of the following options:

- [Change the policy that blocks the Defender Experts app from running](#change-the-policy-that-blocks-the-defender-experts-app-from-running)
- [Add a new policy that lets the Defender Experts app run](#add-a-new-policy-that-lets-the-defender-experts-app-run)

#### Change the policy that blocks the Defender Experts app from running

1. Go to the [App permission policies page](https://admin.teams.microsoft.com/policies/app-permission). For more information, see [App permission policies - Microsoft Teams admin center](/microsoftteams/teams-app-permission-policies).
1. Check each policy to see if **Microsoft apps** is set to **Allow specific apps and block all others**.

   :::image type="content" source="media/teams-restrictions-dexapp/allow-apps-teams.png" alt-text="Screenshot of option to allow Teams app installation.":::

1. Select **Add apps**. On the panel, look for **Defender Experts**, and select **Allow**.

   :::image type="content" source="media/teams-restrictions-dexapp/add-dex-app.png" alt-text="Screenshot to allow Defender Experts app installation.":::

The app starts working after 24 hours.

#### Add a new policy that lets the Defender Experts app run

1. Go to the **App permission policies** page and then select **Add**.
1. In the panel, search for and select **Defender Experts**, and then select **Allow**.

   :::image type="content" source="media/teams-restrictions-dexapp/add-dex-app-run.png" alt-text="Screenshot to allow Defender Experts app flyout panel.":::

1. Complete the rest of the fields as needed, and then select **Save**. If this policy is for a group of users, make sure that all the members in the channel are assigned to the policy. The app starts working after 24 hours.

## Teams channel unavailable

You can't receive updates or chat with Defender Experts if the Managed Response channel is archived or deleted. To learn more, see how to [archive](https://support.microsoft.com/office/archive-or-restore-a-channel-53c46491-a265-4391-a2a7-001c5026c9e5) or [restore a deleted channel](https://support.microsoft.com/office/delete-a-channel-in-microsoft-teams-973f9014-53db-4165-8ab4-365021fe36b7).

## Disabled Unified Group creation 

Teams channel creation might fail if Microsoft 365 Unified Group creation is disabled in your organization.

The Defender Experts teams onboarding flow requires the creation of Microsoft 365 Unified Group during Teams provisioning on-behalf-of user performing the onboarding. If Unified group creation (`EnableGroupCreation`) is disabled in the tenant, the Teams team can't be created.

To verify your organization’s group settings, use one of the following options:

1. **Using Graph Explorer:** Use [List group settings Graph API](https://developer.microsoft.com/en-us/graph/graph-explorer?request=groupSettings&method=GET&version=v1.0&GraphUrl=https://graph.microsoft.com) to review Microsoft 365 Group settings and determine whether the `EnableGroupCreation` setting is set to `false`.
1. **Using PowerShell:** Use the [Microsoft Graph PowerShell module](/previous-versions/microsoft-365/solutions/manage-creation-of-groups#step-2-run-powershell-commands) to view and update your tenant configurations and allow the onboarding user to create Unified Groups before retrying setup.


### See also

- [Communicating with Defender Experts for XDR](communicate-defender-experts-xdr.md)
- [Get started with Microsoft Defender Experts for XDR](get-started-xdr.md)
