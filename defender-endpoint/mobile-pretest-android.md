---
title: Deploy Microsoft Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks
description: Deploy Microsoft Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks.
ms.service: defender-endpoint
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-android
ms.custom: partner-contribution
ms.topic: how-to
ms.subservice: android
search.appverid: met150
ms.date: 04/16/2025
#customer intent: As a customer, I want to know how to set up my Android devices for prerelease testing using Google Play preproduction tracks so that I can test the app before mainstream release.
---

# Deploy Microsoft Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

Learn how to setup a secure environment to safely test prerelease versions of Microsoft Defender for Endpoint on Android using Google Play preproduction tracks. This guide is useful for deploying prerelease builds or custom .APK files to a limited number of users before fully deploying them to all users in your organization. 

This article provides step-by-step instructions on how to set up your environment for prerelease testing or custom APK deployment. These steps are for Android devices that are onboarded to Microsoft Defender for Endpoint through the following methods:

- Android Enterprise scenarios
- Mobile Application Mangement (MAM) enrollment scenarios

## Know before you begin

If you're new to Google Play preproduction tracks, see the following Play Console Help articles for more information:

- [Set up an open, closed, or internal test](https://support.google.com/googleplay/android-developer/answer/9845334)
- [Prepare and roll out a release](https://support.google.com/googleplay/android-developer/answer/9859348)

## Set up your testing environment in the Android Enterprise scenario

You must first contact Microsoft Support to provide the Google Play Store Organization ID for your organization. This ID is required to add your information to an inclusion list and make the prerelease build available for testing. You can find the Organization ID from the Microsoft Intune Admin center under **Apps > Android > Add - > App type > Managed Google Play** then selecting the icon on the top right corner.  Here's an example.

:::image type="content" source="/defender-endpoint/media/mobile-pretest-android/icon-select-small.png" alt-text="Screenshot of Microsoft Intune admin center highlighting the org ID" lightbox="/defender-endpoint/media/mobile-pretest-android/icon-select.png":::

You'll receive a confirmation email from Microsoft Support once your Organization ID is added to the inclusion list. After you receive the confirmation email, you can proceed with the steps below to continue the setup.

Then, you need to sync the prerelease build of the app with Microsoft Intune and assign it to a user group. To do this, To do these, see [Sync a Managed Google Play app with Intune](/intune/intune-service/apps/apps-add-android-for-work#sync-a-managed-google-play-app-with-intune). This step is required to publish a custom .APK file to the managed Google Play Store.

Then, follow these steps:

1. Sign in to the [Microsoft Intune Admin Center](https://intune.microsoft.com/) then navigate to **Apps > All apps** and search for *Microsoft Defender: Antivirus*.
2. Select the app and click **Properties**.
3. In the **Properties** pane, select **Edit** beside **Assignments** and then add the user group under *Available for enrolled devices*.
   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/assignments-edit.png" alt-text="Screenshot highlighting the Microsoft Defender Antivirus properties":::
4. In the **Edit application** list, select the added group to open the **Edit assignment** pane.
   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/mdav-properties.png" alt-text="Screenshot of the Edit assignment pane":::
5. In the Edit assignment pane, select **Included** as the mode. Then select the test track in the **Tracks** dropdown list. Then select default under **Update priority**.
   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/edit-assign-settings.png" alt-text="Screenshot of the required Edit assignment settings":::
6. Select **Review + save** to review and save the details.

After the app is synced and assigned to a user group, the following steps are required for the members of the user group to test the prerelease build on the Android device:

1. Open the Microsoft Intune Company Portal on the Android device and sign in with the user account that is part of the user group assigned to the prerelease build.
2. In the device's work profile, open the **Play Store** app and search for *Microsoft Defender: Antivirus*.
3. Select the app and click **Install** to install the prerelease build on the device.
4. Open the app and sign in with the user account that is part of the user group assigned to the prerelease build.
5. Follow the prompts to complete the onboarding process.

## Set up your testing environment in the MAM enrollment scenario

You must first create a Google group for your organization. This group is required to add your information to an inclusion list and make the prerelease build available for testing. To create a Google group, see [Create a group and choose group settings](https://support.google.com/groups/answer/2464926).

Then contact Microsoft Support to provide the Google group name for your organization. You'll receive a confirmation email from Microsoft Support once your Google group is added to the inclusion list. After you receive the confirmation email, ensure that the group is provided the test link where they can download the prerelease build.

The following steps are for the members of the Google group to proceed with the steps below to continue the setup:

1. Sign in to the Google Play Store with the Google account that is part of the Google group assigned to the prerelease build.
2. Search and download the prerelease build using the test link provided by the administrator. Here's an example.
   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/beta-app.png" alt-text="Screenshot of a prerelease version of Microsoft Defender Antivirus in the Google Play Store":::
3. Follow the steps from the test link to install **Microsoft Defender: Antivirus (Beta)**.
4. Follow the prompts to complete the onboarding process. Once successfully onboarded, the app will show a *Preview build* label on top. Here's an example.
   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/preview-build.png" alt-text="Screenshot of a prerelease version of Microsoft Defender Antivirus installed on a device":::

> [!TIP]
> If users in the Google group are unable to see or download the correct prerelease build, ensure that the user is a member of the Google group assigned to the prerelease build. You can also try syncing Google Play apps from the Microsoft Intune Admin center. Users can also try clearing the cache and data of the Google Play Store app on their Android device.