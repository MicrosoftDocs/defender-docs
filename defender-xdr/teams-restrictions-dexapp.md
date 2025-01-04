---
title: Configuring Microsoft Defender Experts app in Teams
ms.reviewer:
description: The Microsoft Defender Experts app might have restrictions that affect its permissions in Teams
ms.service: defender-experts-for-xdr
ms.author: vpattnaik
author: vpattnai
ms.localizationpriority: medium
manager: dolmont
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-manage
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-dex
search.appverid: met150
ms.date: 10/31/2024
---

# Troubleshooting issues with Microsoft Defender Experts app in Microsoft Teams

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

## App policy permissions

The Microsoft Defender Experts app is available for Microsoft Teams by default, but some environments might have limitations that block the app's installation because of app policy permissions in Teams. [Learn how to check Teams app permissions policies](#check-the-teams-app-permission-policies)

:::image type="content" source="/defender-xdr/media/teams-communication-issues.png" alt-text="Screenshot of Teams communication restrictions." lightbox="media/teams-communication-issues.png":::

When you join the Defender Experts Teams channel, you should be able to mention or tag the Defender Experts bot in the channel by typing _@Defender Experts_. If the bot doesn't show up in the list of suggestions, then it might be that the Teams permissions policies are preventing the app from functioning. Learn more about [communicating with Defender Experts for XDR](../defender-xdr/communicate-defender-experts-xdr.md)

The following screenshot is an example of the missing bot:

:::image type="content" source="/defender-xdr/media/teams-app-bot.png" alt-text="Screenshot of Teams app bot.":::

### Check the Teams app permission policies

**To verify if the Teams permission policies are preventing the Defender Experts app from working, follow these steps.**

1. In Microsoft Teams, select **Apps** on the Teams workspace.

   :::image type="content" source="/defender-xdr/media/apps-teams-workspace.png" alt-text="Screenshot of Apps options in Teams workspace.":::

2. Type **Defender Experts** in the search pane to see the Defender Experts app.
3. Select **Request** to request for the Defender Experts service.

   :::image type="content" source="/defender-xdr/media/request-defender-experts.png" alt-text="Screenshot to request Defender Experts app in Microsoft Teams.":::

**If you have the Teams app installed already, and you encounter a policy issue, do the following:**

- Go to the **Manage apps** page for the Defender Experts app, and then to the **User requests** tab. Learn more about [Manage app - Microsoft Teams admin center](https://admin.teams.microsoft.com/policies/manage-apps/81769126-d9ed-4a77-a1e8-2ab8107adf03/user-requests)

If you see the following notification, then the Teams app permission policies are preventing you from using the Defender Experts app:

```
This app is blocked in app permission policies. To approve a user's app request, review the app permission policies assigned to them and allow the app in any policies where it's blocked.
```

  :::image type="content" source="/defender-xdr/media/app-permissions-blocked.png" alt-text="Screenshot of Defender Experts app permissions blocked image in Teams.":::

### Fix the Teams app permission policies

You have two options to fix the Teams app permission policy that stops the Defender Experts app from running:

- [Change the policy that blocks the Defender Experts app from running](#change-the-policy-that-blocks-the-defender-experts-app-from-running)
- [Add a new policy that lets the Defender Experts app run](#add-a-new-policy-that-lets-the-defender-experts-app-run)

#### Change the policy that blocks the Defender Experts app from running

1. Go to the [App permission policies page](https://admin.teams.microsoft.com/policies/app-permission). Read more about [App permission policies - Microsoft Teams admin center](/microsoftteams/teams-app-permission-policies)
2. Look at each policy and see if **Microsoft apps** is set to **Allow specific apps and block all others**.

   :::image type="content" source="/defender-xdr/media/allow-apps-teams.png" alt-text="Screenshot of option to allow Teams app installation.":::

3. Select **Add apps**. On the flyout panel, look for **Defender Experts**, and select **Allow**.

   :::image type="content" source="/defender-xdr/media/add-dex-app.png" alt-text="Screenshot to allow Defender Experts app installation.":::

The app should start working after 24 hours.

#### Add a new policy that lets the Defender Experts app run

1. Go to the **App permission policies** page and then select **Add**.
2. In the flyout panel on the right side, search for and select **Defender Experts**, and then select **Allow**.

   :::image type="content" source="/defender-xdr/media/add-dex-app-run.png" alt-text="Screenshot to allow Defender Experts app flyout panel.":::

3. Complete the rest of the fields as needed then select **Save**. If this policy is for a group of users, make sure that all the members in the channel are assigned to the policy. The app should start working after 24 hours.

## Teams channel unavailable

You will not be able to receive updates or chat with Defender Experts if the Managed Response channel is archived or deleted. To learn more, see how to [archive](https://support.microsoft.com/office/archive-or-restore-a-channel-53c46491-a265-4391-a2a7-001c5026c9e5) or [restore a deleted channel](https://support.microsoft.com/office/delete-a-channel-in-microsoft-teams-973f9014-53db-4165-8ab4-365021fe36b7).

### See also

- [Communicating with Defender Experts for XDR](communicate-defender-experts-xdr.md)
- [Get started with Microsoft Defender Experts for XDR](get-started-xdr.md)
