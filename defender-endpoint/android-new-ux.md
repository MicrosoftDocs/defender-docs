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
ms.date: 11/06/2025
---

# User experiences in Microsoft Defender for Endpoint on Android

As part of our ongoing commitment to deliver exceptional user experiences, we're excited to announce a series of upcoming changes to the user interface and overall experience of our **Microsoft Defender for Endpoint** mobile app.

The new enhancements are designed to improve usability, streamline navigation, and ensure our app meets the evolving needs of our users.

## November 2025

In this release, we've made it easier for users to share feedback, including logs, to the Microsoft Defender team. The changes include:

- [A new bottom pane that makes it easier for users to share feedback and logs](#bottom-pane-experience)
- [A new **Send logs to Microsoft** option that enables users to quickly send logs to Microsoft](#one-click-send-logs-experience)

### Bottom pane experience

When users select **Help and Feedback** in the left navigation pane (Screen 1, accessible by tapping the profile picture), a new bottom feedback pane opens (Screen 2). This pane has been updated to improve readability and make it easier for users to share feedback.

The **Send feedback** option in the updated bottom pane enables users to share positive or negative feedback, along with Microsoft Defender and authenticator logs, which will be accessible to the Microsoft Defender team. When a user selects **Send feedback**, they are redirected to a new screen (Screen 3) where they can include logs along with their feedback submission.

:::image type="content" source="./media/android-new-ux/bottom-experience-android.png" alt-text="Screenshots showing how to send feedback and logs from the Microsoft Defender mobile app options menu." border="false":::

### One-click *Send Logs* experience

A new **Send logs to Microsoft** option has been added directly to the left navigation pane. This enables users to quickly send logs to Microsoft. It redirects them to the logs submission page (Screen 2). This option is particularly useful when a support case has been created and a support engineer is assigned, providing a convenient way for users to submit logs. Because this option doesn't allow users to include written feedback, the Defender team will not have access to the logs unless an incident ID is explicitly shared via mail or support request. This option collects logs from both the Defender and Authenticator apps.

:::image type="content" source="./media/android-new-ux/one-click-feedback-android.png" alt-text="Screenshots showing how to send logs directly to Microsoft from the Microsoft Defender mobile app options menu." border="false":::

## October 2025

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

## May 2025

### Alerts for activities related to open wireless connection and certificates are now detected as events

Starting May 19, 2025, security operations center (SOC) analysts can now view the following as events instead of alerts:

- Connecting or disconnecting to open wireless networks
- Download/installation/removal of self-signed certificates

These events can be viewed in the Timeline tab of a device page. For more information, see [Network protection](android-configure.md#network-protection).

## April 2025

### Deploy Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks

#### Set up a secure environment to test prerelease builds of Defender for Endpoint on Android

Learn the steps on how to set up your environment for prerelease testing of Defender for Endpoint on Android. These steps are for Android devices that are onboarded to Microsoft Defender for Endpoint through the following methods:

- Android Enterprise scenarios
- Mobile Application Management (MAM) enrollment scenarios

For more information, see [Deploy Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks](mobile-pretest-android.md).

## March 2025
 
We're pleased to introduce the Device Protection feature card for our enterprise users which includes **App Security**, **Web Protection**, **Security History** features are designed to be more user-friendly and accessible.

The updated **feature cards** also include recommendation cards, which prominently display any active alerts, ensuring you stay informed. Features are now displayed as tiles on L2 screens to improve user experience and navigation efficiency.

The primary changes are as follows:

- [Main dashboard changes](#main-dashboard-changes)
- [List the features inside one feature card](#list-the-features-inside-one-feature-card)
- [Detailed feature experience](#detailed-feature-experience)
- [Alerts](#alerts)

### Main dashboard changes

The following image shows the main Dashboard screen that appears to the enterprise's users as per our latest rollout of enhancements to the application. The following image illustrates the previous and new version of the main dashboard.

:::image type="content" source="media/android-new-ux/mde-android-dash-changes.png" alt-text="Screenshot showing the Microsoft Defender for Endpoint Mobile Dashboard on Android devices before the new update." lightbox="media/android-new-ux/mde-android-dash-changes.png":::

### List the features inside one Feature Card

The **App Security** and **Web Protection** features are now consolidated under a single feature card titled **Device Protection**. Previously, each functionality had its own separate card on the Dashboard screen. The following image displays the new version of the **Device Protection** feature card.

:::image type="content" source="media/android-new-ux/mde-android-list.png" alt-text="Screenshot showing the Microsoft Defender for Endpoint Feature Card before the new updates." lightbox="media/android-new-ux/mde-android-list.png":::

### Detailed feature experience

We updated all the subordinating screens associated with the feature

1. **Web Protection**:

   :::image type="content" source="media/android-new-ux/mde-android-web-protection-after.png" alt-text="Screenshot showing the web protection feature on the MDE Android app." lightbox="media/android-new-ux/mde-android-web-protection-after.png":::

1. **App Security** and **App Scanning**:

   :::image type="content" source="media/android-new-ux/mde-android-app-security-and-app-scanning.png" alt-text="Screenshot showing the app security feature on the MDE Android app." lightbox="media/android-new-ux/mde-android-app-security-and-app-scanning.png":::

1. **Threat found**:

   The following image highlights the 'Threat Found' feature, showcasing its functionality both before and after the recent update.

   :::image type="content" source="media/android-new-ux/mde-android-threat-found.png" alt-text="Screenshot showing the threat found feature on the MDE Android app." lightbox="media/android-new-ux/mde-android-threat-found.png":::
   
1. **Uninstall threat**:

   :::image type="content" source="media/android-new-ux/mde-android-uninstall.png" alt-text="Screenshot showing the new uninstall threat feature on the MDE Android app." lightbox="media/android-new-ux/mde-android-uninstall.png":::

1. **Security History**:

   :::image type="content" source="media/android-new-ux/mde-android-security-history.png" alt-text="Screenshot showing the security history feature on the MDE Android app." lightbox="media/android-new-ux/mde-android-security-history.png":::

### Alerts

We added a new section to show **multiple alerts** together on dashboard.

:::image type="content" source="media/android-new-ux/mde-android-alerts.png" alt-text="Screenshot showing the new updates to the alerts feature on the MDE Android app." lightbox="media/android-new-ux/mde-android-alerts.png":::

## February 2025

### Defender for Endpoint on Android now supports Android 10 as the minimum version

Defender for Endpoint is ending support for Android 8, 8.1, and 9 on April 30, 2025. Moving forward, only devices running Android 10 and later are supported.

How does this change affect your organization's users?

* **New Users**: The application will no longer be available for new installations on devices running below Android 10. When users with Android versions below 10 attempt to download the Microsoft Defender app, Google Play store will notify them that the device is incompatible.
* **Existing users**: The Microsoft Defender app continues to function for existing users on Android 8, 8.1, and 9 versions, but they don't receive updates from the Google Play store as they don't meet the minimum SDK version requirements. Therefore, any new updates on the app aren't available to users running an Android version prior to version 10.

After discontinuing support for deprecated versions, Microsoft no longer addresses bugs or provides maintenance for unsupported operating system versions. Any issues occurring on devices running Android version prior to version 10 won't be investigated.

## Key changes - January 2025

### Upgrading your experience: Upcoming enhancements you should know about

**Key changes**:

We're pleased to introduce the new dashboard for our enterprise users, which has been designed to be more user-friendly and accessible. The updated dashboard structure now includes recommendation cards for alerts and feature tiles.

Recommendation cards prominently display any active alerts, ensuring you stay informed. Additionally, features are now presented in the form of tiles, enhancing ease of use and navigation.

The following screenshot is an example of what the user sees in their dashboard:

:::image type="content" source="media/android-new-ux/mde-android-dash-changes.png" alt-text="Screenshot of the new dashboard structure - tiles and recommendation cards.":::

**Recommendation cards for alerts**:

The structure of the dashboard has been updated to include a recommendation card that contains active alerts (if any). In case there are multiple alerts, resolving the top alert brings forward the next one. Recommendation cards have been implemented to provide a more cohesive user experience. These cards are designed to display important alerts and notifications prominently on the dashboard, as shown in the following table:

| Card | Description |
|---|---|
| :::image type="content" source="media/android-new-ux/android-connection-unsecured.png" alt-text="Screenshot of recommendation to connect to a secure network."::: | **Network protection** <br/>The user is advised to switch to a secure network. |
| :::image type="content" source="media/android-new-ux/android-allow-vpn.png" alt-text="Screenshot showing a recommendation to set up a VPN connection."::: | **VPN option** <br/>The user is prompted to set up a VPN connection on their device. |
| :::image type="content" source="media/android-new-ux/android-threat-found.png" alt-text="Screenshot showing a recommendation to take action on a detected threat."::: | **Malware detection** <br/>The user is prompted to take action on a detected threat. |

**Feature tiles**:

The current enterprise dashboard experience now features a tile view for your security team. The following table describes tiles your security team might see.

| Tile | Description |
|---|---|
| :::image type="content" source="media/android-new-ux/android-tile-networkprotection.png" alt-text="Screenshot showing the network protection tile for security administrators."::: | **Network protection** <br/>The user can see whether a connection is secured or unsecured. |
| :::image type="content" source="media/android-new-ux/android-tile-webprotection.png" alt-text="Screenshot of a tile that shows whether web protection is enabled on a device."::: | **Web protection** <br/>The user can see whether web protection is enabled on a user's device. |
| :::image type="content" source="media/android-new-ux/android-tile-appsecurity.png" alt-text="Screenshot showing the app security tile."::: | **App security** <br/>The user can see whether any threats were found in apps installed on a user's device. |