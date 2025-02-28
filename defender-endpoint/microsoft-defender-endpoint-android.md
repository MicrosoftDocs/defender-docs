---
title: Microsoft Defender for Endpoint on Android
ms.reviewer: denishdonga
description: Describes how to install and use Microsoft Defender for Endpoint on Android
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-android
ms.topic: conceptual
ms.subservice: android
search.appverid: met150
ms.date: 02/28/2025
---

# Microsoft Defender for Endpoint on Android

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

This article describes how to install, configure, update, and use Defender for Endpoint on Android.

> [!CAUTION]
> Running other non-Microsoft endpoint protection products alongside Defender for Endpoint on Android is likely to cause performance problems and unpredictable system errors.

## How to install Microsoft Defender for Endpoint on Android

### Prerequisites

- **For end users**:
   - The end user must be assigned a Microsoft Intune license. For more information on how to assign licenses, see [Assign licenses to users](/azure/active-directory/users-groups-roles/licensing-groups-assign).
   - The users of the app must be assigned a Microsoft Defender for Endpoint license. For more information on how to assign licenses, see [Microsoft Defender for Endpoint licensing requirements](minimum-requirements.md#licensing-requirements).
   - Intune Company Portal app can be downloaded from [Google Play](https://play.google.com/store/apps/details?id=com.microsoft.windowsintune.companyportal) and is available on the Android device.
   - Additionally, devices can be [enrolled](/mem/intune/user-help/enroll-device-android-company-portal) via the Intune Company Portal app to enforce Intune device compliance policies. 

- **For Administrators**:
   - Access to the [Microsoft Defender portal](https://security.microsoft.com).
   - Access to the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431) to:
      - Deploy the app to enrolled user groups in your organization.
      - Configure Microsoft Defender for Endpoint risk signals in app protection policy.
  
> [!NOTE]
> - Microsoft Defender for Endpoint now extends protection to organizational data within a managed application (MAM) for devices that aren't enrolled using mobile device management (MDM), but are using Intune to manage mobile applications. It also extends this support to customers who use other enterprise mobility management solutions, while still using Intune for [mobile application management (MAM)](/mem/intune/apps/mam-faq).
> - In addition, Microsoft Defender for Endpoint already supports devices that are enrolled using Intune mobile device management (MDM).

### Network Requirements

- For Microsoft Defender for Endpoint on Android to function when connected to a network, the firewall/proxy must be configured to [enable access to Microsoft Defender for Endpoint service URLs](configure-environment.md#enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server).

### System Requirements

- Intune Company Portal app should be downloaded from [Google Play](https://play.google.com/store/apps/details?id=com.microsoft.windowsintune.companyportal) and installed for seamless onboarding. Device enrollment is required for Intune device compliance policies to be enforced.

- Mobile phones and tablets running Android 8.0 and above. **(Note: Microsoft Defender is ending support for Android 8, 8.1 and 9 versions on April 30, 2025, after that device running on Android version < 10 won't be supported)**

**What does it mean devices running on unsupported Android version?** 

**New users**: The application is longer available for new installations on devices running on unsupported versions. When users with unsupported versions attempt to download the Microsoft Defender app, the Google Play store notifies them that the device is incompatible.

**Existing users**: The Microsoft Defender app continues to function for existing users on unsupported versions, but they don't receive updates from the Google Play store because they don't meet the minimum SDK version requirements. Therefore, any new updates on the app aren't available to devices running unsupported versions. Microsoft no longer addresses bugs or provides maintenance for unsupported operating system versions. Any issues occurring on devices running on unsupported versions aren't investigated. 

 > [!NOTE]
 > Microsoft Defender for Endpoint on Android isn't supported on userless or shared devices.

### Installation instructions

Microsoft Defender for Endpoint on Android supports installation on both modes of enrolled devices - the legacy Device Administrator and Android Enterprise modes. **Currently, Personally-owned devices with work profile, Corporate-owned devices with work profile, and Corporate-owned fully managed user device enrollments are supported in Android Enterprise. Support for other Android Enterprise modes will be announced when ready.**

- Deployment of Microsoft Defender for Endpoint on Android is via Microsoft Intune (MDM). For more information, see [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md).
- Installation of Microsoft Defender for Endpoint on devices that aren't enrolled using Intune mobile device management (MDM), see [Configure Microsoft Defender for Endpoint risk signals in app protection policy (MAM)](android-configure-mam.md).

> [!NOTE]
> **Microsoft Defender for Endpoint on Android is available on [Google Play](https://play.google.com/store/apps/details?id=com.microsoft.scmx) now.**
>
> You can connect to Google Play from Intune to deploy Microsoft Defender for Endpoint app, across Device Administrator and Android Enterprise enrollment modes.

### Required Permissions

To ensure optimal protection for your device, Microsoft Defender requests access to the following permissions during the device onboarding process:

- **Storage Access**: This permission enables Microsoft Defender to access your device's storage in order to detect and remove any malicious or unwanted apps.

- **VPN Setup**: Microsoft Defender sets up a local VPN to provide web protection. Microsoft respects your privacy and doesn't view your browsing content.

- **Display Over Other Apps**: This permission enables Microsoft Defender to alert you when malicious network activity is blocked.

- **Accessibility**: This feature enhances your browsing experience by providing added security.

- **Permanent Protection**: To ensure continuous protection, Microsoft recommends keeping the Microsoft Defender app active while running in the background. This helps prevent Android from stopping the app to improve battery life, thereby ensuring your device remains well protected.

- **Location Access**: The Microsoft Defender app uses your location to help secure your Wi-Fi network and enhance device protection.

#### How to resolve the non-compliance state due to silent auth failures
:::image type="content" source="media/microsoft-defender-endpoint-android/mfa-not-cong-user-flow.jpeg" alt-text="":::
Microsoft Defender for Endpoint has a feature to let the user sign-in according to a set of policies called [Conditional Access policies](/defender-endpoint/configure-conditional-access). If a policy is violated, the Microsoft Defender app auto-signs out and starts failing in silent auth (sign-in attempts in background). This results in the devices being shown as non-compliant on Intune portal.  A user can get the device to compliant by signing in again.

The user receives a notification (as shown in the following scenarios) asking them to sign in. The user can tap the notification or open the Microsoft Defender app and sign in. Signing in results in a successful, interactive authentication and causes the Intune portal to show the device as compliant.

**Scenario 1:** The following experience occurs when MFA is configured by the admin through a Conditional Access policy:

:::image type="content" source="media/microsoft-defender-endpoint-android/ca-policy-user-flow.jpeg" alt-text="Series of images showing the user flow when a Conditional Access policy is configured by the security team." lightbox="media/microsoft-defender-endpoint-android/ca-policy-user-flow.jpeg":::

**Scenario 2:** The following experience occurs when **MFA is not configured** by the admin through a Conditional Access policy:

:::image type="content" source="media/microsoft-defender-endpoint-android/mfa-not-cong-user-flow.jpeg" alt-text="Screenshot showing the user flow when MFA is not configured by your security team." lightbox="media/microsoft-defender-endpoint-android/mfa-not-cong-user-flow.jpeg":::

## How to Configure Microsoft Defender for Endpoint on Android

For information on how to configure Defender for Endpoint on Android features, see [Configure Microsoft Defender for Endpoint on Android features](android-configure.md).

## Related articles

- [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md)

- [Configure Microsoft Defender for Endpoint on Android features](android-configure.md)

- [Mobile Application Management (MAM) basics](/mem/intune/apps/app-management#mobile-application-management-mam-basics)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
