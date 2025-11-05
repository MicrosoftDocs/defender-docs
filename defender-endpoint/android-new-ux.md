---
title: User experiences in Microsoft Defender for Endpoint on Android
description: Learn about the newest updates to Microsoft Defender for Endpoint on Android.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: bagol
ms.reviewer: denishdonga
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-android
ms.topic: reference
ms.subservice: android
search.appverid: met150
ms.date: 11/05/2025
---

# User experiences in Microsoft Defender for Endpoint on Android

As part of our ongoing commitment to deliver exceptional user experiences, we're excited to announce a series of upcoming changes to the user interface and overall experience of our **Microsoft Defender for Endpoint** mobile app.

The new enhancements are designed to improve usability, streamline navigation, and ensure our app meets the evolving needs of our users.

## Key changes - November 2025

Experience change:

### Bottom Pane Experience

When users select **Help and Feedback** in the left navigation pane (Screen 1, accessible by tapping the profile picture), a new bottom feedback pane opens (Screen 2). This pane has been updated to improve readability and make it easier for users to share feedback.

The **Send feedback** option in the updated bottom pane enables users to share positive or negative feedback, along with Microsoft Defender and authenticator logs, which will be accessible to the Microsoft Defender team. When a user selects **Send feedback**, they are redirected to a new screen (Screen 3) where they can include logs along with their feedback submission.

:::image type="content" source="./media/android-new-ux/bottom-experience-android.png" alt-text="Screenshots showing how to send feedback and logs from the Microsoft Defender mobile app options menu." border="false":::

### One-Click *Send Logs* Experience

A new **Send logs to Microsoft** option has been added directly to the left navigation pane. This enables users to quickly send logs to Microsoft. It redirects them to the logs submission page (Screen 4). This option is particularly useful when a support case has been created and a support engineer is assigned, providing a convenient way for users to submit logs. Because this option doesn't allow users to include written feedback, the Defender team will not have access to the logs unless an incident ID is explicitly shared via mail or support request. This option collects logs from both the Defender and Authenticator apps.

:::image type="content" source="./media/android-new-ux/one-click-feedback-android.png" alt-text="Screenshots showing how to send logs directly to Microsoft from the Microsoft Defender mobile app options menu." border="false":::

 ## Key changes - September 2025

We're pleased to introduce the new Onboarding screens that come up when the user starts onboarding after sign-in.

The primary changes are as follows:

-  [EULA screen revamp](#eula-screen-revamp)
-  [Permission consolidation screen changes](#permission-consolidation-screen-changes)
-  [Intermediate screens during permission flow](#intermediate-screens-that-come-up-during-the-permission-flow)

### EULA screen revamp

:::image type="content" source="media/android-new-ux/eula-screen-light.png" alt-text="Screenshot showing EULA screen after redesign in light mode." border="false":::

### Permission consolidation screen changes

:::image type="content" source="media/android-new-ux/permissions-consolidation-light.png" alt-text="Permission consolidation screen after redesign in light mode." border="false":::

#### New bottom sheet for permission information

:::image type="content" source="media/android-new-ux/permissions-information.png" alt-text="Permissions information bottom sheet." border="false":::

### Optional VPN consent screen

:::image type="content" source="media/android-new-ux/vpn-consent-screen-light.png" alt-text="Optional VPN consent screen in light mode." border="false":::

### Intermediate screens that come up during the permission flow

These are the following screens that have been shifted from old Enterprise screen to new look and feel screens similar to the consumer screens.

#### Network Protection consent screen

:::image type="content" source="media/android-new-ux/np-consent-screen-light.png" alt-text="NP consent screen in light mode." border="false":::

#### Microsoft Defender Vulnerability Management consent screen

:::image type="content" source="media/android-new-ux/discover-vulnerable-apps-consent-screen-light.png" alt-text="Discover vulnerable apps consent screen in light mode." border="false":::

## Key changes - March 2025
 
We're pleased to introduce the Device Protection feature card for our enterprise users which includes **App Security**, **Web Protection**, **Security History** features are designed to be more user-friendly and accessible.

The updated **feature cards** also include recommendation cards, which prominently display any active alerts, ensuring you stay informed. Features are now displayed as tiles on L2 screens to improve user experience and navigation efficiency.

The primary changes are as follows:

- [Main dashboard changes](#main-dashboard-changes)
- [List the features inside one feature card](#list-the-features-inside-one-feature-card)
- [Detailed feature experience](#detailed-feature-experience)
- [Alerts](#alerts)

### Main dashboard changes

The following image shows the main Dashboard screen that appears to the enterprise's users as per our latest rollout of enhancements to the application. The following image illustrates the previous and new version of the main dashboard.

:::image type="content" source="media/mde-android-dash-changes.png" alt-text="Screensot showing the Microsoft Defender for Endpoint Mobile Dashboard on Android devices before the new update." lightbox="media/mde-android-dash-changes.png":::

### List the features inside one Feature Card

The **App Security** and **Web Protection** features are now consolidated under a single feature card titled **Device Protection**. Previously, each functionality had its own separate card on the Dashboard screen. The following image displays the new version of the **Device Protection** feature card.

:::image type="content" source="media/mde-android-list.png" alt-text="Screensot showing the Microsoft Defender for Endpoint Feature Card before the new updates." lightbox="media/mde-android-list.png":::

### Detailed feature experience

We updated all the subordinating screens associated with the feature

1. **Web Protection**:

   :::image type="content" source="media/mde-android-web-protection-after.png" alt-text="Screensot showing the web protection feature on the MDE Android app." lightbox="media/mde-android-web-protection-after.png":::

2. **App Security** and **App Scanning**:
    
   :::image type="content" source="media/mde-android-app-security-and-app-scanning.png" alt-text="Screensot showing the app security feature on the MDE Android app." lightbox="media/mde-android-app-security-and-app-scanning.png":::

3. **Threat found**:

   The following image highlights the 'Threat Found' feature, showcasing its functionality both before and after the recent update.

   :::image type="content" source="media/mde-android-threat-found.png" alt-text="Screensot showing the threat found feature on the MDE Android app." lightbox="media/mde-android-threat-found.png":::
   
4. **Uninstall threat**:

   :::image type="content" source="media/mde-android-uninstall.png" alt-text="Screensot showing the new uninstall threat feature on the MDE Android app." lightbox="media/mde-android-uninstall.png":::

5. **Security History**:

   :::image type="content" source="media/mde-android-security-history.png" alt-text="Screensot showing the uninstall threat feature on the MDE Android app." lightbox="media/mde-android-security-history.png":::

### Alerts

We added a new section to show **multiple alerts** together on dashboard.

:::image type="content" source="media/mde-android-alerts.png" alt-text="Screensot showing the new updates to the alerts feature on the MDE Android app." lightbox="media/mde-android-alerts.png":::