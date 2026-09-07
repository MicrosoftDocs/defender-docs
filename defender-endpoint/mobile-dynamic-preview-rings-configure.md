---
title: Configure Dynamic Preview Rings for Microsoft Defender on mobile
description: Learn how to use Dynamic Preview Rings to enable preview features on the production Microsoft Defender mobile app for a selected group of users on Android and iOS.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: smwasson
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-android
- mde-ios
ms.topic: how-to
ms.subservice: ngp
ms.date: 07/21/2026
appliesto:
- Microsoft Defender for Endpoint Plan 1
- Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
#customer intent: As a security administrator, I want to enable preview features on the production Microsoft Defender mobile app for a pilot group so that I can evaluate new capabilities before I deploy them broadly.
---

# Configure Dynamic Preview Rings for Microsoft Defender on mobile

Dynamic Preview Rings let you evaluate upcoming Microsoft Defender mobile experiences without distributing separate preview builds of the app. By setting a configuration key in your existing Microsoft Intune app configuration policies, you enable preview functionality for a selected group of users while the rest of your organization continues to run the standard production version of the Microsoft Defender app. This approach simplifies preview testing and reduces the administrative effort of distributing prerelease mobile app builds.

## Why use Dynamic Preview Rings

Organizations often need to validate new experiences and capabilities before they deploy them broadly. Traditionally, this validation requires distributing separate preview builds of the app and managing more enrollment or distribution processes.

Dynamic Preview Rings simplify this experience. You enable preview functionality directly on production versions of the Microsoft Defender mobile app through policy configuration, so a pilot group can test new capabilities before you deploy them to the whole organization.

## How it works

- You use your existing Intune app configuration policies for Android and iOS, in both mobile device management (MDM) and mobile app management (MAM) scenarios.
- You add an opt-in key, `DefenderPreview`. Set the value to `1` to enable the dynamic preview, or `0` to turn it off.
- After you enable Dynamic Preview through policy, the users in scope receive preview functionality on the production version of the Microsoft Defender app without a separate preview build.
- You scope this configuration to specific user groups, the same way you scope any other policy.

> [!NOTE]
> Setting the `DefenderPreview` value to `0` or removing the key entirely reverts the app to production features instead of preview features.

> [!IMPORTANT]
> Dynamic Preview provides early access to preview features before they're generally available. Preview features are provided for evaluation purposes and might contain known or unknown issues, limitations, or incomplete functionality. As with other preview programs, preview features aren't intended for production use and might change before general availability.
>
> Support and response processes for issues that occur only in preview features might differ from the processes for generally available features. Standard incident management (ICM) service-level agreement (SLA) commitments might not apply unless the issue is reproducible in a generally available (production) feature.

## Requirements

To use Dynamic Preview Rings:

- Microsoft Defender for Endpoint must be deployed to your managed mobile devices.
- You must use Microsoft Intune to manage app configuration policies.
- You must identify the users or groups that participate in preview validation before you deploy.

## Supported platforms

Dynamic Preview Rings support Android and iOS. You deliver the configuration by using Microsoft Intune app management capabilities.

## Configure Dynamic Preview Rings on Android

You configure the `DefenderPreview` key for Android by using either a managed devices policy or a managed apps policy.

### Configure on Android using MDM

> [!NOTE]
> Before you create the policy, add and approve the Microsoft Defender app from the managed Google Play store and sync it to Intune. If no Android apps are synced from managed Google Play, the target app list is empty and you see the message "You have not added any Android apps from the managed Google Play store." For deployment steps, see [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](/intune/intune-service/protect/microsoft-defender-deploy-android).

To enable Dynamic Preview on enrolled Android devices, create a **Managed devices** app configuration policy. For the full procedure, see <a href="/intune/app-management/configuration/configure-managed-android#create-an-app-configuration-policy" target="_blank">Create an app configuration policy</a> (opens in a new tab in the Intune documentation). When you create the policy, use these settings:

- **Basics** tab: Configure the following settings:
  - **Platform**: Select **Android Enterprise**.
  - **Profile type**: Select one of the following values:
    - **All Profile Types**: Applies the policy to all supported enrollment types.
    - **Fully Managed, Dedicated, and Corporate-Owned Work Profile Only**: For corporate-owned, personally enabled (COPE) and corporate-owned, business only (COBO) devices.
    - **Personally-Owned Work Profile Only**: For bring-your-own-device (BYOD) devices.
  - **Target app**: Select **Select app**, find and select **Microsoft Defender Antivirus**, and then select **OK**.
- **Settings** tab: Configure the following settings in the **Configuration settings** section:
  1. **Configuration settings format**: Select **Use configuration designer**, and then select **Add**.
  1. In the flyout that opens, use the search box to find **Defender Preview**, select **\[Preview\] Defender Preview** from the results, and then select **OK**.
  1. Back on the **Settings** tab, hover over **Configuration value** in the **\[Preview\] Defender Preview** entry, and set **Configuration value** to `1` (the default value is `0`).

To confirm the policy is applied, verify that **DefenderPreview** is present and set to `1` on the target device.

### Configure on Android using MAM

To enable Dynamic Preview on unenrolled Android devices, create a **Managed apps** app configuration policy. For the full procedure, see <a href="/intune/app-management/configuration/configure-managed-apps#add-an-app-configuration-policy-for-managed-apps-on-iosipados-and-android-devices" target="_blank">Add an app configuration policy for managed apps</a> (opens in a new tab in the Intune documentation). When you create the policy, use these settings:

- **Basics** tab: Configure the following settings:
  - **Target policy to**: Verify **Selected apps** is selected.
  - **Public apps**: Select **Select public apps**, find and select **Microsoft Defender Endpoint Android**, and then select **Select**.
- **Settings** tab: Configure the following settings in the **General configuration settings** section:
  - **Name**: Enter `DefenderPreview`.
  - **Value**: Enter `1`.

## Configure Dynamic Preview Rings on iOS

You configure the `DefenderPreview` key for iOS by using either a managed devices policy or a managed apps policy.

### Configure on iOS using MDM

> [!NOTE]
> Before you create the policy, add the Microsoft Defender app from the Apple App Store to Intune so it appears in the target app list. If no iOS store apps are added to Intune, the target app list is empty and you can't select the app. For deployment steps, see [Deploy Microsoft Defender for Endpoint on iOS with Microsoft Intune](ios-install.md).

To enable Dynamic Preview on enrolled iOS devices, create a **Managed devices** app configuration policy. For the full procedure, see <a href="/intune/app-management/configuration/configure-managed-ios#create-an-app-configuration-policy" target="_blank">Create an app configuration policy</a> (opens in a new tab in the Intune documentation). When you create the policy, use these settings:

- **Basics** tab: Configure the following settings:
  - **Platform**: Select **iOS/iPadOS**.
  - **Target app**: Select **Select app**, find and select **Microsoft Defender: Security**, and then select **OK**.
- **Settings** tab: Configure the following settings:
  1. **Configuration settings format**: Select **Use configuration designer**.
  1. In the section that appears, configure the following settings:
     - **Configuration key**: Enter `DefenderPreview`.
     - **Value type**: Select **Integer**.
     - **Configuration value**: Enter `1`.

To confirm the policy is applied, verify that **DefenderPreview** is present and set to `1` on the target device.

### Configure on iOS using MAM

To enable Dynamic Preview on unenrolled iOS devices, create a **Managed apps** app configuration policy. For the full procedure, see <a href="/intune/app-management/configuration/configure-managed-apps#add-an-app-configuration-policy-for-managed-apps-on-iosipados-and-android-devices" target="_blank">Add an app configuration policy for managed apps</a> (opens in a new tab in the Intune documentation). When you create the policy, use these settings:

- **Basics** tab: Configure the following settings:
  - **Target policy to**: Verify **Selected apps** is selected.
  - **Public apps**: Select **Select public apps**, find and select **Microsoft Defender Endpoint iOS/iPadOS**, and then select **Select**.
- **Settings** tab: Configure the following settings in the **General configuration settings** section:
  - **Name**: Enter `DefenderPreview`.
  - **Value**: Enter `1`.

## End-user experience

- Users continue to use the production Microsoft Defender app.
- Devices in scope for Dynamic Preview Rings receive preview functionality through policy configuration.
- A yellow banner at the top of the screen indicates that preview features are active, which matches the behavior in the nonproduction build.
- Preview features might change before general availability.

## Benefits

- Eliminates the need to distribute nonproduction builds for preview testing.
- Removes the requirement to collect personal Gmail IDs for Android testing in non-MDM scenarios, which addresses privacy concerns.
- Accelerates testing by using your existing configuration policy workflows.

## Limitations

Consider the following limitations when you use Dynamic Preview Rings:

- Dynamic Preview Rings don't currently support enabling or disabling individual preview features independently. Preview participation is assigned at the preview audience level.
- Preview functionality is intended for testing and evaluation, and might change before general availability.
- On Android, Dynamic Preview Rings don't work if you use Microsoft Tunnel features. Dynamic Preview Rings don't apply to Tunnel-only customers or to Tunnel and Defender customers.

## Features available for preview

The set of preview features available through Dynamic Preview changes over time. Preview features are provided for evaluation and might change before general availability.

## Related content

- [Resources for Microsoft Defender for Endpoint for mobile devices](mobile-resources-defender-endpoint.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
