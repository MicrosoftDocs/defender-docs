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
ms.date: 04/18/2025
#customer intent: As a customer, I want to know how to set up my Android devices for prerelease testing using Google Play preproduction tracks so that I can test the app before mainstream release.
---

# Deploy Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

Learn how to setup a secure environment to safely test prerelease versions of Microsoft Defender for Endpoint on Android using Google Play preproduction tracks. This guide is useful for deploying prerelease builds or custom Defender for Endpoint .APK files to a limited number of users before fully deploying them to all users in your organization. 

This article provides step-by-step instructions on how to set up your environment for prerelease testing or custom APK deployment. These steps are for Android devices that are onboarded to Microsoft Defender for Endpoint through the following methods:

- Android Enterprise scenarios
- Mobile Application Mangement (MAM) enrollment scenarios

## Set up your testing environment in the Android Enterprise scenario

To set up your environment for prerelease testing, follow these steps:

1. Contact Microsoft Support to provide the Google Play Store Organization ID for your organization and wait for confirmation. The ID is required to add your information to an inclusion list and make the prerelease build available for testing. You can find the Organization ID from the Microsoft Intune Admin center under **Apps > Android > Add - > App type > Managed Google Play** then selecting the icon on the top right corner. Here's an example.

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/icon-select-small.png" alt-text="Screenshot of Microsoft Intune admin center highlighting the org ID" lightbox="/defender-endpoint/media/mobile-pretest-android/icon-select.png":::

2. Sync the managed Google Play app with Intune. See [Sync a Managed Google Play app with Intune](/intune/intune-service/apps/apps-add-android-for-work#sync-a-managed-google-play-app-with-intune) for more information. The sync steps look like the following:

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/intune-sync.png" alt-text="Screenshot selecting an app for managed Play in the Microsoft Intune admin center":::

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/manage-sync.png" alt-text="Screenshot highlighting the Sync option in the Managed Play store":::

3. Create a group in [Microsoft Intune Admin Center](https://intune.microsoft.com/).

4. In the portal, navigate to **Apps > All apps** and search for *Microsoft Defender: Antivirus*.

5. In the **Properties** pane, select **Edit** beside **Assignments** and then add the user group under *Available for enrolled devices*.

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/assignments-edit.png" alt-text="Screenshot highlighting the Microsoft Defender Antivirus properties":::

6. In the **Edit application** list, select the added group to open the **Edit assignment** pane.

7. In the Edit assignment pane, select **Included** as the mode. Then select **Custom testing track (number)** in the **Tracks** dropdown list. Then select default under **Update priority**.

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/edit-assign-settings.png" alt-text="Screenshot of the required Edit assignment settings":::

8. Select **Review + save** to review and save the details.

After the app is synced and assigned to a user group, the following steps are required for the members of the user group to test the prerelease build on the Android device:

1. Open the Microsoft Intune Company Portal on the Android device and sign in with the user account that is part of the user group assigned to the prerelease build.
2. In the device's managed section, open the **Play Store** app and search for *Microsoft Defender: Antivirus*.
3. Select the app and then **Install** to install the prerelease build on the device.
4. Open the app and sign in with the user account that is part of the user group assigned to the prerelease build.
5. Follow the prompts to complete the onboarding process.

## Set up your testing environment in the MAM enrollment scenario

To set up your environment for prerelease testing, follow these steps:

1. Create a Google group for your organization, which is required to add your information to an inclusion list and make the prerelease build available to your group. To create a Google group, see [Create a group and choose group settings](https://support.google.com/groups/answer/2464926). The group you create appears in the Google Groups list. Here's an example.

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/group-name.png" alt-text="Screenshot of highlighting the Google group added to the list":::

2. Contact Microsoft Support to provide the Google group name for your organization then wait for confirmation. Then, provide the [test link](https://play.google.com/apps/testing/com.microsoft.scmx?pli=1) where they can download the prerelease build to the members of the Google group.

3. Users testing the prerelease build must sign in to the Google Play Store using the Google account that's part of the Google group.

4. Search and download the prerelease build from the [test link](https://play.google.com/apps/testing/com.microsoft.scmx?pli=1). Users are then redirected to a *Welcome to the testing program* page and an install page for Microsoft Defender: Antivirus. Here are examples.

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/welcome-test.png" alt-text="Screenshot of a Welcome page to test the prelease build of Microsoft Defender Antivirus":::

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/beta-app.png" alt-text="Screenshot of a prerelease version of Microsoft Defender Antivirus in the Google Play Store":::

6. Sign in to the Defender app using the work/corporate account. Then follow the prompts to complete the onboarding process.

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/defender-signin.png" alt-text="Screenshot of the Microsoft Defender Antivirus sign in page":::

7. Once successfully onboarded, the app shows a label on top to indicate that the prerelease version is running. Here's an example.

   :::image type="content" source="/defender-endpoint/media/mobile-pretest-android/preview-build.png" alt-text="Screenshot of a prerelease version of Microsoft Defender Antivirus installed on a device":::

> [!TIP]
> If users in the Google group are unable to see or download the correct prerelease build, ensure that the user is a member of the Google group assigned to the prerelease build. You can also try syncing Google Play apps from the Microsoft Intune Admin center. Users can also try clearing the cache and data of the Google Play Store app on their Android device.