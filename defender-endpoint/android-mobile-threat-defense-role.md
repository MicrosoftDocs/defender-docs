---
title: Android Mobile Threat Defense (MTD) Role for Microsoft Defender for Endpoint
description: Learn how the Android Mobile Threat Defense (MTD) Role gives Microsoft Defender for Endpoint anti-tampering and reliability protections on managed Android devices.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: smwasson
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-android
ms.topic: overview
ms.subservice: android
ms.date: 07/20/2026
appliesto:
   - Microsoft Defender for Endpoint Plan 1
   - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
#customer intent: As an Android administrator, I want to assign the Mobile Threat Defense Role to Microsoft Defender for Endpoint so that users can't tamper with the app and protection stays reliable on managed devices.
---

# Android Mobile Threat Defense (MTD) Role for Microsoft Defender for Endpoint

The Android **Mobile Threat Defense (MTD) Role** is a platform capability that Android Enterprise device management providers assign to a mobile security application. When the role is assigned, Android grants the application platform-level protections and privileges designed for security solutions. Only one application can hold the MTD Role per tenant.

<!--- Scope corrected from "on a device at a time" to "per tenant" per Intune source: "Only one MTD partner can hold MTD role permissions per tenant." https://learn.microsoft.com/intune/device-security/mobile-threat-defense/enable-connector#mobile-threat-defense-role --->

Organizations that deploy Microsoft Defender for Endpoint on managed Android devices can assign Defender as the device's MTD application through Microsoft Intune. When Defender holds the Android MTD Role, it gains platform-level protections that help maintain continuous protection, preserve Defender's onboarded state, and improve the reliability of Defender services on managed devices. Before you assign the role, review the prerequisites described later in this article.

> [!NOTE]
> The Android MTD Role is an Android Enterprise platform role. It's different from the Microsoft Defender for Endpoint mobile threat defense capability. For an overview of the Defender for Endpoint mobile solution, see [Microsoft Defender for Endpoint mobile threat defense on Android and iOS](mtd.md).

## Capabilities provided by the MTD Role

When Microsoft Defender for Endpoint holds the Android MTD Role, it gains platform-level capabilities that improve the reliability and resilience of Defender on managed Android devices:

- **Protection against force-stop actions**: By default, users can force stop applications from Android settings. The MTD Role prevents users from force stopping Defender through device settings, which helps keep Defender available to provide continuous protection.
- **Protection against app data clearing**: Users can normally clear application data from Android settings, which can remove app configuration and reset the application state. The MTD Role prevents users from clearing Defender app data, which helps preserve the Defender onboarded state and security configuration.
- **Automatic battery optimization exemption**: Android battery optimization can restrict background activity for applications. The MTD Role automatically exempts Defender from battery optimization restrictions on Android 14 and later, so users don't need to grant the permission manually and Defender continues running in the background. For more information, see [Limitations](#limitations).
- **Improved security posture**: These platform-enforced protections reduce the likelihood that Defender services are interrupted by user actions or device power management settings, which helps preserve Defender's onboarded state and maintain continuous protection.

## Prerequisites

Before an administrator assigns the Android MTD Role to Defender for Endpoint, make sure the following prerequisites are met:

- Defender for Endpoint is deployed to managed Android devices.
- Microsoft Intune manages the target Android devices.
- The Defender for Endpoint and Intune integration (the mobile threat defense connector) is configured.
- Devices are enrolled through the [Android Management API](https://developers.google.com/android/management) with a supported Android Enterprise enrollment scenario.
- Defender for Endpoint is assigned to devices as a required application.

<!--- Android Management API requirement added per Intune source: "The Mobile Threat Defense role requires devices enrolled through the Android Management API." https://learn.microsoft.com/intune/device-security/mobile-threat-defense/enable-connector#mobile-threat-defense-role --->

For the enrollment scenarios that Defender for Endpoint supports on Android, see [Supported Android enrollment scenarios](mtd.md#supported-android-enrollment-scenarios).

## Supported enrollment scenarios

The Android MTD Role is currently supported for the following Android Enterprise enrollment scenarios:

- Corporate-owned fully managed (COBO)
- Corporate-owned work profile (COPE)

<!--- COBO/COPE descriptions aligned to Intune source terminology ("corporate-owned fully managed", "corporate-owned work profile"). https://learn.microsoft.com/intune/device-security/mobile-threat-defense/enable-connector#mobile-threat-defense-role --->

Android Enterprise personally owned work profile (BYOD) devices aren't supported.

## Limitations

- The automatic battery optimization exemption applies to Android 14 and later. On earlier Android versions, users grant battery optimization permission manually during onboarding.
- The MTD Role isn't supported on Android Enterprise personally owned work profile (BYOD) devices.
- Only one application can hold the Android MTD Role per tenant.
- The MTD Role doesn't replace Defender onboarding requirements that Android doesn't manage.

<!--- Scope corrected to "per tenant" per Intune source: "Only one MTD partner can hold MTD role permissions per tenant." https://learn.microsoft.com/intune/device-security/mobile-threat-defense/enable-connector#mobile-threat-defense-role --->

## User experience

After the MTD Role is assigned to Defender for Endpoint, users see the following changes:

- A simplified onboarding experience. Defender is automatically exempted from battery optimization permission on Android 14 and later. Administrators can also enable automatic launch of Defender during device setup, so Defender completes its initial configuration without the user opening the app.
- The **Force stop** option for Microsoft Defender is disabled.
- The **Clear data** option for Microsoft Defender is unavailable.

<!--- Automatic-launch capability added and onboarding claim softened per Intune source toggle "Automatically launch Defender for Endpoint during setup on Android COBO and COPE devices" (requires the Grant MTD role toggle). https://learn.microsoft.com/intune/device-security/mobile-threat-defense/enable-connector#mobile-threat-defense-role --->

These protections don't affect users' day-to-day device usage.

## Deploy the Android MTD Role

The Android MTD Role is assigned through your device management solution. In Microsoft Intune, you grant the role to Defender for Endpoint through the Defender for Endpoint mobile threat defense connector, and then target the configuration to supported Android Enterprise device groups. After the policy is deployed, the role is assigned automatically during device enrollment or through policy synchronization on existing managed devices.

For an overview of the role, see [Mobile Threat Defense role for Android](/intune/device-security/mobile-threat-defense/overview#mobile-threat-defense-role-for-android). For the connector toggle options that grant the role, see [Mobile Threat Defense role](/intune/device-security/mobile-threat-defense/enable-connector#mobile-threat-defense-role) in the Microsoft Intune documentation.

For the Defender for Endpoint connector, you can also turn on a separate toggle that automatically launches Defender during setup on COBO and COPE devices. This toggle requires that you grant the MTD Role permissions to Defender for Endpoint.

<!--- Aqutomatic-launch toggle added per Intune source: "Automatically launch Defender for Endpoint during setup on Android COBO and COPE devices... requires that the Grant MTD role permissions toggle is also turned on for Defender for Endpoint." https://learn.microsoft.com/intune/device-security/mobile-threat-defense/enable-connector#mobile-threat-defense-role --->

### Assign the role to existing deployments

You can assign the Android MTD Role to devices that are already enrolled and protected with Defender for Endpoint. When the MTD Role policy is applied, Android grants the role during the next policy synchronization cycle. Existing devices don't need to be re-enrolled to receive the platform protections that the MTD Role provides.

## Verify MTD Role protections

After the MTD Role is assigned to Defender for Endpoint, verify that the protections are active on a managed Android device:

1. On the device, go to **Settings** \> **Apps** \> **Microsoft Defender**.
1. Confirm that Microsoft Defender is exempt from Android battery optimization restrictions. On Android 14 and later, the battery optimization options in the app settings are unavailable and set to **Unrestricted**.
1. Verify that the **Force stop** option is unavailable.
1. Verify that the **Clear data** option is unavailable.
1. Confirm that Microsoft Defender continues to operate as expected in the background.

> [!NOTE]
> The exact path to the app settings can differ by device manufacturer.

## Related content

- [Microsoft Defender for Endpoint mobile threat defense on Android and iOS](mtd.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Overview of Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md)
- <a href="/intune/intune-service/protect/microsoft-defender-deploy-android" target="_blank" rel="noopener noreferrer">Microsoft Intune: Deploy and configure Microsoft Defender for Endpoint on Android</a>
