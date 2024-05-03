---
title: Configuring Microsoft Defender Experts app in Teams
ms.reviewer:
description: The Microsoft Defender Experts app may have restrictions that affect its permissions in Teams
ms.service: defender-experts
ms.subservice: dex-xdr
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
search.appverid: met150
ms.date: 05/03/2024
---

# Troubleshooting Microsoft Defender Experts app permissions in Microsoft Teams

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

The Microsoft Defender Experts app is available for Microsoft Teams by default, but some environments might have limitations that block the app's installation or affect its permissions in Teams.
When you join the Defender Experts Teams channel, you should be able to mention or tag the Defender Experts bot in the channel it's set up by typing @Defender Experts. If the bot doesn't show up in the list of suggestions, then it might be that the Teams permissions policies are preventing the app from functioning.

The following screenshot is an example of the missing bot:

<IMAGE: teams-app-bot>

## Check the Teams app permission policies

To verify if the Teams permission policies are preventing the Defender Experts app from working, follow these steps.

1. In Microsoft Teams, select **Apps** on the Teams workspace.

<IMAGE: apps-teams-workspace>

2. Type **Defender Experts** in the search pane and you'll be able to see the Defender Experts app.
3. Select **Request** to request for the Defender Experts service.
4. If you have the Teams app installed already, go to the Manage apps page for the Defender Experts app, and then to the User requests tab. Learn more about [Manage app - Microsoft Teams admin center](/microsoftteams/manage-admin-app.md).

If you see the following notification, then the Teams app permission policies are preventing you from using the Defender Experts app:

<pre><code class="language-plaintext">
This app is blocked in app permission policies. To approve a user's app request, review the app permission policies assigned to them and allow the app in any policies where it's blocked.
</code></pre>

<IMAGE- app-permissions-blocked>

### Fix the Teams app permission policies

You have two options to fix the Teams app permission policy that stops the Defender Experts app from running:

- Change the policy that blocks the Defender Experts app from running
- Add a new policy that lets the Defender Experts app run

Change the policy that blocks the Defender Experts app from running

1. Go to the App permission policies page. Read more about [App permission policies - Microsoft Teams admin center](/microsoftteams/manage-admin-app.md).
2. Look at each policy and see if **Microsoft apps** is set to **Allow specific apps and block all others**.

<IMAGE: allow-apps-teams>

3. Select **Add apps**. On the flyout panel, look for **Defender Experts**, and select **Allow**.

<IMAGE: add-dex-app>

The app should start working after 24 hours.

### Add a new policy that lets the Defender Experts app run

1. Go to the **App permission policies** page and then select **Add**. 
2. In the flyout panel on the right side, search for and select **Defender Experts**, and then select **Allow**.

<IMAGE: add-dex-app-run>

3. Complete the rest of the fields as needed then select **Save**. If this policy is for a group of users, make sure that all the members in the channel are assigned to the policy. The app should start working after 24 hours.

