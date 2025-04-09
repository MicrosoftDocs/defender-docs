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
ms.date: 04/14/2025
#customer intent: As a customer, I want to know how to set up my Android devices for prerelease testing using Google Play preproduction tracks so that I can test the app before mainstream release.
---

# Deploy Microsoft Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

Learn how to setup your environment for Microsoft Defender for Endpoint prerelease tests or deployment of custom .APK files using Google Play preproduction tracks. This guide is useful for testing prerelease builds or custom .APK files before deploying them to users in your organization. The preproduction track allows you to test a product build or an app with a limited number of users before making it available to everyone.

This article provides step-by-step instructions on how to set up their environment prior to prerelease testing or custom APK deployment. These steps are for Android devices that are onboarded to Microsoft Defender for Endpoint through the following methods:

- Android Enterprise scenarios
- Mobile Application Mangement (MAM) enrollment scenarios

## Know before you begin

If you're new to Google Play preproduction tracks, see the following Play Console Help articles for more information:

- [Set up an open, closed, or internal test](https://support.google.com/googleplay/android-developer/answer/9845334)
- [Prepare and roll out a release](https://support.google.com/googleplay/android-developer/answer/9859348)

## Set up your testing environment in the Android Enterprise scenario

You must first contact Microsoft Support to provide the Google Play Store Organization ID for your organization. This ID is required to add your information to an inclusion list and make the preproduction build available for testing. You can find the Organization ID from the Microsoft Intune Admin center under **Apps > Android > Add - > App type > Managed Google Play** then selecting the icon on the top right corner.  Here's an example.

[SCREENSHOT]

You'll receive a confirmation email from Microsoft Support once your Organization ID is added to the inclusion list. After you receive the confirmation email, you can proceed with the steps below to continue the setup.

You need to sync the preproduction app with Microsoft Intune and assign it to a user group next. To do these, follow these steps:

1. Sync a managed Google Play app with Microsoft Intune. To do this, see [Sync a Managed Google Play app with Intune](/intune/intune-service/apps/apps-add-android-for-work#sync-a-managed-google-play-app-with-intune). This step is required to publish the custom .APK file to the managed Google Play Store.
2. Sign in to the [Microsoft Intune Admin Center](https://intune.microsoft.com/) then navigate to **Apps > All apps** and search for *Microsoft Defender: Antivirus*.
3. Select the app and click **Properties**.
4. In the **Properties** pane, select **Edit** and then add the user group under *Available for enrolled devices*.
5. In the Edit application list, select the added group to open the **Edit assignment** pane.
6. Under **Assignment settings**, select **Included** as the mode.
7. Under **App settings**, select the test track in the **Tracks** dropdown list. Then select the **Update priority** as default.
8. Review the details then select **Save**.

After the app is synced and assigned to a user group, the following steps are required for the members of the user group to test the preproduction build on the Android device:

1. Open the Intune Company Portal on the Android device and sign in with the user account that is part of the user group assigned to the preproduction build.
2. In the device's work profile, open the **Play Store** app and search for *Microsoft Defender: Antivirus*.
3. Select the app and click **Install** to install the preproduction build on the device.
4. Open the app and sign in with the user account that is part of the user group assigned to the preproduction build.
5. Follow the prompts to complete the onboarding process.

## Set up your testing environment in the MAM enrollment scenario

You must first contact Microsoft Support to provide the Google group name for your organization. This group is required to add your information to an inclusion list and make the preproduction build available for testing. To create a Google group, see [Create a group and choose group settings](https://support.google.com/groups/answer/2464926).

[SCREENSHOT]

You'll receive a confirmation email from Microsoft Support once your Google group is added to the inclusion list. After you receive the confirmation email, ensure that the group is provided the test link where they can download the preproduction build.

The following steps are for the members of the Google group to proceed with the steps below to continue the setup:

1. Sign in to the Google Play Store with the Google account that is part of the Google group assigned to the preproduction build.
2. Download the preproduction build using the test link provided by the administrator.
3. Follow the steps from the test link to install *Microsoft Defender: Antivirus (Beta)*.
4. Follow the prompts to complete the onboarding process.

> [!TIP]
> If users in the Google group are unable to see or download the correct build, ensure that the user is a member of the Google group assigned to the preproduction build. You can also try syncing Google Play apps from the Microsoft Intune Admin center. Users can also try clearing the cache and data of the Google Play Store app on their Android device.