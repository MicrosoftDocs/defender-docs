---
title: Microsoft Defender for Endpoint - Mobile Threat Defense
ms.reviewer: tdoucette, sunasing, denishdonga
description: Overview of Mobile Threat Defense in Microsoft Defender for Endpoint
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: deniseb
author: denisebmsft  
ms.localizationpriority: medium
ms.date: 12/02/2024
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
search.appverid: met150
---

# Microsoft Defender for Endpoint - Mobile Threat Defense

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

Microsoft Defender for Endpoint on Android and iOS is our **mobile threat defense solution (MTD)**. Typically, companies are proactive in protecting PCs from vulnerabilities and attack while mobile devices often go unmonitored and unprotected. Where mobile platforms have built-in protection such as app isolation and vetted consumer app stores, these platforms remain vulnerable to web-based or other sophisticated attacks. As more employees use devices for work and to access sensitive information, it's imperative that companies deploy an MTD solution to protect devices and your resources from increasingly sophisticated attacks on mobiles.

## Key capabilities

Microsoft Defender for Endpoint on Android and iOS provides the below key capabilities, For information about the latest features and benefits, read our [announcements](https://aka.ms/mdeblog).

|Capability|Description|
|---|---|
|Web Protection|Anti-phishing, blocking unsafe network connections, and support for custom indicators for URLs and domains. (File and IP indicators aren't currently supported.)|
|Malware Protection (Android-only)|Scanning for malicious apps and APK Files.|
|Jailbreak Detection (iOS-only)|Detection of jailbroken devices.|
|Microsoft Defender Vulnerability Management (MDVM) |Vulnerability assessment of onboarded mobile devices. Includes OS and Apps vulnerabilities assessment for both Android and iOS. Visit this [page](/defender-vulnerability-management/defender-vulnerability-management) to learn more about Microsoft Defender Vulnerability Management in Microsoft Defender for Endpoint.|
|Network Protection | Protection against rogue Wi-Fi related threats and rogue certificates; ability to add to the "allow" list the root CA and private root CA certificates in Intune; establish trust with endpoints.|
|Unified alerting|Alerts from all platforms in the unified Microsoft Defender portal.|
|Conditional Access, Conditional launch|Blocking risky devices from accessing corporate resources. Defender for Endpoint risk signals can also be added to app protection policies (MAM).|
|Privacy Controls|Configure privacy in the threat reports by controlling the data sent by Microsoft Defender for Endpoint. Privacy controls are available for admin and end users. It's there for enrolled and unenrolled devices as well.|
|Integration with Microsoft Tunnel|Integration with Microsoft Tunnel, a VPN gateway solution to enable security and connectivity in a single app. Available on both Android and iOS.|

All these capabilities are available for Microsoft Defender for Endpoint license holders. For more information, see [Licensing requirements](minimum-requirements.md#licensing-requirements).

## Overview and Deploy

Deployment of Microsoft Defender for Endpoint on mobile can be done via Microsoft Intune. Watch this video for a quick overview of MTD capabilities and deployment:

<br/>

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=c944a31c-0017-4707-a1bc-afff9e2f2e00]

### Deploy

The following table summarizes how to deploy Microsoft Defender for Endpoint on Android and iOS. For detailed documentation, see the following articles:

- [Overview of Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md), and
- [Overview of Microsoft Defender for Endpoint on iOS](microsoft-defender-endpoint-ios.md)

## Supported Android enrollment Scenarios

|Scenarios|Company portal app required on the device?|Protection Profile/Prerequisites|How to deploy|
| -------- | -------- | -------- | -------- |
|Android Enterprise personally owned devices using a work profile|Yes| Protects only the work profile section. [Learn more about the work profile](/mem/intune/apps/android-deployment-scenarios-app-protection-work-profiles)|[Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-android-enterprise-enrolled-devices) |
|Android Enterprise personally owned devices using a personal profile|Yes| Protects the personal profile. When a customer has a scenario with work profile as well then it protects the entire device. Note the following: The company portal app must be enabled on personal profile and the Microsoft Defender must be already installed and active in work profile to enable Microsoft Defender in personal profile.|[Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#set-up-microsoft-defender-in-personal-profile-on-android-enterprise-in-byod-mode)|
|Android Enterprise corporate owned work profile (COPE)|Yes|Protects only the work profile section. The Company Portal app and Microsoft Intune app both are automatically installed. | [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-android-enterprise-enrolled-devices) |
|Android Enterprise corporate owned fully managed - no work profile (COBO)|Yes|Protects the entire device. The Company Portal app and Microsoft Intune app both are automatically installed.|[Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-android-enterprise-enrolled-devices)|
|MAM|Yes, (need to just install, setup isn't required) | Protects only enrolled apps. MAM supports with/without Device enrollment or enrolled with non-Microsoft Enterprise Mobility Management.|[Configure Microsoft Defender for Endpoint on Android risk signals using App Protection Policies (MAM)](android-configure-mam.md)|
|Device Administrator|Yes|Intune and MDE is ending support for android device administrator management on devices with access to Google Mobile Services (GMS) on December 31, 2024.|[Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-device-administrator-enrolled-devices)|


### Unsupported Android enrollment scenarios

These scenarios aren't currently supported:

- **Android Enterprise corporate-owned Personal profile**
- **Android Enterprise corporate owned dedicated devices (COSU) (Kiosk/Shared)**
- **Android Open-Source Project (AOSP)**

## Supported iOS enrollment Scenarios

|Scenarios|Company portal app required on the device?|Protection Profile/Prerequisites|How to deploy|
| -------- | -------- | -------- | -------- |
|Supervised Devices (ADE and Apple Configurator Enrollment|Yes|Protects the entire device. For ADE, if users who use Just in Time (JIT) registration, the Company portal app isn't required because app enrolls the device automatically by connecting to Intune server| [Deploy Microsoft Defender for Endpoint on iOS with Microsoft Intune](ios-install.md#deployment-steps-applicable-for-both-supervised-and-unsupervised-devices)   |
|Unsupervised Devices (Device Enrollment)|Yes|Protects the entire device. For web-based device enrollment, the company portal app isn't required because after the managed app signs in, the app downloads configuration policies directly and not the company portal app)|[Deploy Microsoft Defender for Endpoint on iOS with Microsoft Intune](ios-install.md#deployment-steps-applicable-for-both-supervised-and-unsupervised-devices)|
|Unsupervised Devices (User Enrollment)|Yes|Protects work data only. The VPN has access to entire device, and the VPN can scan all app traffic|[Deploy Microsoft Defender for Endpoint on iOS with Microsoft Intune](ios-install.md#user-enrollment-setup-only-for-intune-user-enrolled-devices)|
|MAM|No|Protects only enrolled apps. The VPN has access to entire device and can scan all app traffic)|[Deploy Microsoft Defender for Endpoint on iOS with Mobile Application Management](ios-install-unmanaged.md)|

### Unsupported iOS enrollment scenarios

iOS Dedicated/shared/kiosk device enrollment isn't supported.

### Android low touch onboarding supported scenarios

- Android Enterprise personally owned devices using a work profile
- Android Enterprise corporate owned work profile (COPE)
- Android Enterprise corporate owned fully managed - No work profile (COBO)

### iOS zero touch onboarding supported scenarios

- Supervised devices (ADE and Apple Configurator Enrollment)
- Unsupervised devices (Device Enrollment)

### End-user onboarding

- [Configure Zero-touch onboard for iOS enrolled devices](ios-install.md#zero-touch-silent-onboarding-of-microsoft-defender-for-endpoint): Admins can configure zero-touch install to silently onboard Microsoft Defender for Endpoint on enrolled iOS devices without requiring the user to open the app. 

- [Configure Conditional Access to enforce user onboarding](android-configure.md#conditional-access-with-defender-for-endpoint-on-android): This can be applied to ensure end-users onboard to the Microsoft Defender for Endpoint app after deploying. Watch this video for a quick demo on configuring conditional access with Defender for Endpoint risk signals. 

  <br/>

  > [!VIDEO https://learn-video.azurefd.net/vod/player?id=eac95cd5-17b0-47ca-8819-41d7d5247af9]

### Simplify Onboarding

- [iOS - Zero-Touch Onboard](ios-install.md#zero-touch-silent-onboarding-of-microsoft-defender-for-endpoint)
- [Android Enterprise - Setup Always-on VPN](android-intune.md#auto-setup-of-always-on-vpn).
- [iOS - Auto-setup of VPN profile](ios-install.md#auto-onboarding-of-vpn-profile-simplified-onboarding)

## Pilot evaluation

While evaluating mobile threat defense with Microsoft Defender for Endpoint, you can verify that certain criteria is met before proceeding to deploy the service to a larger set of devices. You can define the exit criteria and ensure that they're satisfied before deploying widely.

This helps reduce potential issues that could arise while rolling out the service. Here are some tests and exit criteria that might help:

- Devices show up in the device inventory list: After successful onboarding of Defender for Endpoint on the mobile device, verify that the device is listed in the Device Inventory in the [Microsoft Defender portal](https://security.microsoft.com).
<!---
- Run a malware detection test on an Android device: Install any test virus app from the Google play store and verify that it gets detected by Microsoft Defender for Endpoint. Here's an example app that can be used for this test: (We are working on new one, it will be updated soon). Note that on Android Enterprise with a work profile, only the work profile is supported. --->

- Run a phishing test: Browse to `https://smartscreentestratings2.net` and verify that it gets blocked by Microsoft Defender for Endpoint. On Android Enterprise with a work profile, only the work profile is supported.

- Alerts appear in dashboard: Verify that alerts for the detection tests mentioned earlier appear in the [Microsoft Defender portal](https://security.microsoft.com).

Need help with deploying or configuring Defender for Endpoint on Android & iOS? If you have at least 150 licenses for the product, use your [FastTrack benefits](/microsoft-365/fasttrack/introduction). Learn more about FastTrack at [Microsoft FastTrack](https://fasttrack.microsoft.com/).

## Configure

- [Configure Android features](android-configure.md)
- [Configure iOS features](ios-configure-features.md)
- [Configure Web Protection without VPN for supervised iOS devices](ios-install.md#complete-deployment-for-supervised-devices)

## Resources

- [Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md)
- [Microsoft Defender for Endpoint on iOS](microsoft-defender-endpoint-ios.md)
- Stay informed about upcoming releases by reading our [announcements](https://aka.ms/mdeblog).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
