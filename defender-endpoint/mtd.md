---
title: Microsoft Defender for Endpoint - Mobile Threat Defense
ms.reviewer: tdoucette, sunasing
description: Overview of Mobile Threat Defense in Microsoft Defender for Endpoint
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
ms.date: 10/08/2024
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
|Web Protection|Anti-phishing, blocking unsafe network connections, and support for custom indicators for URLs and domains. (File and IP indicators are not currently supported.)|
|Malware Protection (Android-only)|Scanning for malicious apps.|
|Jailbreak Detection (iOS-only)|Detection of jailbroken devices.|
|Microsoft Defender Vulnerability Management (MDVM) |Vulnerability assessment of onboarded mobile devices. Includes OS and Apps vulnerabilities assessment for both Android and iOS. Visit this [page](/defender-vulnerability-management/defender-vulnerability-management) to learn more about Microsoft Defender Vulnerability Management in Microsoft Defender for Endpoint.|
|Network Protection | Protection against rogue Wi-Fi related threats and rogue certificates; ability to allow list the root CA and private root CA certificates in Intune; establish trust with endpoints.|
|Unified alerting|Alerts from all platforms in the unified M365 security console.|
|Conditional Access, Conditional launch|Blocking risky devices from accessing corporate resources. Defender for Endpoint risk signals can also be added to app protection policies (MAM).|
|Privacy Controls|Configure privacy in the threat reports by controlling the data sent by Microsoft Defender for Endpoint. Privacy controls are available for admin and end users. It's there for enrolled and unenrolled devices as well.|
|Integration with Microsoft Tunnel|Integration with Microsoft Tunnel, a VPN gateway solution to enable security and connectivity in a single app. Available on both Android and iOS.|

All these capabilities are available for Microsoft Defender for Endpoint license holders. For more information, see [Licensing requirements](minimum-requirements.md#licensing-requirements).

## Overview and Deploy

Deployment of Microsoft Defender for Endpoint on mobile can be done via Microsoft Intune. Watch this video for a quick overview of MTD capabilities and deployment:

<br/>

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWMpiC]

### Deploy

The following table summarizes how to deploy Microsoft Defender for Endpoint on Android and iOS. For detailed documentation, see 
- [Overview of Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md), and
- [Overview of Microsoft Defender for Endpoint on iOS](microsoft-defender-endpoint-ios.md)

**Android Enrollment Scenarios**

|Scenarios|Defender for Endpoint Supported?|Is the company portal app required on the device?|Protection Profile/Prerequisites|Steps|
| -------- | -------- | -------- | -------- | -------- |
|Android Enterprise personally owned devices using a work profile|Yes|Yes|1) It protects only the work profile section                                          2) To Know more about work profile [click here](/mem/intune/apps/android-deployment-scenarios-app-protection-work-profiles)|[Deployment steps](android-intune.md#deploy-on-android-enterprise-enrolled-devices)|
|Android Enterprise personally owned devices using a personal profile|Yes|Yes|1) It protects the personal profile. When a customer has a scenario with work profile as well then it protects the entire device.           2) **Prerequisites:**                          **A**. The company portal app needs to be enabled on personal profile. **B**. Microsoft Defender must be already installed and active in work profile to enable Microsoft Defender in personal profile.|[Deployment Steps](/defender-endpoint/android-intune)|
|Android Enterprise corporate owned work profile (COPE)|Yes|Yes|1) It protects only the work profile section.                                         2) Company Portal app and Microsoft Intune app both are auto installed| [Deployment Steps](/defender-endpoint/android-intune) |
|Android Enterprise corporate owned personal profile|No|-|-|-|
|Android Enterprise corporate owned fully managed - no work profile (COBO)|Yes|Yes|1) It protects the entire device. <BR> 2) Company Portal app and Microsoft Intune app both are auto installed.|[Deployment Steps](/defender-endpoint/android-intune)|
|Android Enterprise corporate owned dedicated devices (COSU)(Kiosk/Shared)|No|-|-|-|
|MAM|Yes|Yes, (Need to just install, setup is not required)|1) It protects only enrolled apps. 2) MAM supports with/without Device enrollment or enrolled with third party Enterprise Mobility Management.|[Deployment Steps](/defender-endpoint/android-configure-mam)|
|Device Administrator|Yes|Yes|1) Intune is ending support for android device administrator management on devices with access to Google Mobile Services (GMS) on December 31, 2024.|-|
|Android Open-Source Project (AOSP)|No|-|-|-|

## Option 1: Supported Defender for Endpoint on Android enrollment scenarios
The following sections describe the different scenarios for how to onboard Android devices to Defender for Endpoint.

### Android Enterprise personally owned devices using a work profile  
#### Prerequisites
 - Company portal app required on the device

#### Protection mode
 - This mode only protects the work profile section Learn more: [Mobile Application Management (MAM) and Android Enterprise personally-owned work profiles in Microsoft Intune](/mem/intune/apps/android-deployment-scenarios-app-protection-work-profiles#android-enterprise-personally-owned-work-profiles)

#### How to deploy
- [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-android-enterprise-enrolled-devices)

### Android Enterprise personally owned devices using a personal profile  
#### Prerequisites
 - The Company portal needs to be enabled on personal profile.           
 - Microsoft Defender must be already installed and active in work profile to enable Microsoft Defender in personal profiles. 

#### Protection mode
- This mode protects the Android personal profile. When a customer has a scenario with work profile as well this mode protects the entire device.

#### How to deploy
- [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#set-up-microsoft-defender-in-personal-profile-on-android-enterprise-in-byod-mode)

### Android Enterprise corporate-owned work profile (COPE) 
#### Prerequisites
- The Company portal app and Microsoft Intune app both are automatically installed

#### Protection mode
- This mode protects only the work profile section. 

#### How to deploy
- [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-android-enterprise-enrolled-devices)

## Table Option 2
| Scenario | Prerequisites | Protection mode | How to deploy|
|---|---|---|---|
|Android Enterprise personally owned devices using a work profile  | Company portal app required on the device | This mode only protects the work profile section Learn more: [Mobile Application Management (MAM) and Android Enterprise personally-owned work profiles in Microsoft Intune](/mem/intune/apps/android-deployment-scenarios-app-protection-work-profiles#android-enterprise-personally-owned-work-profiles) | [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-android-enterprise-enrolled-devices) |
|Android Enterprise personally owned devices using a personal profile   | The Company portal needs to be enabled on personal profile and Microsoft Defender must be already installed and active in work profile to enable Microsoft Defender in personal profiles. | This mode protects the Android personal profile. When a customer has a scenario with work profile as well this mode protects the entire device. | [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#set-up-microsoft-defender-in-personal-profile-on-android-enterprise-in-byod-mode) |
|Android Enterprise corporate-owned work profile (COPE) | The Company portal app and Microsoft Intune app both are automatically installed | This mode protects only the work profile section. | [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](android-intune.md#deploy-on-android-enterprise-enrolled-devices) |
 
### Unsupported scenarios
These scenarios are not currently supported:
- **Android Enterprise corporate-owned Personal profile (COPE)**
- **Android Enterprise corporate owned dedicated devices (COSU) (Kiosk/Shared)**


**iOS Enrollment Scenarios**


|Scenarios|Is MDE supported?|Is company portal app required on device?|Protection Profile/Prerequisites|Steps|
| -------- | -------- | -------- | -------- | -------- |
|Supervised Devices (ADE and Apple Configurator Enrollment|Yes|Yes|1) It protects the entire device. In terms of ADE if they use Just in Time (JIT) registration - company portal app not required because app itself will enroll the device through connecting to Intune server| [Deployment Steps](/defender-endpoint/ios-install)   |
|Unsupervised Devices (Device Enrollment)|Yes|Yes|1) It protects the entire device. (In case of web-based device enrollment company portal app is not required because through this after managed app sign in it leads to download configuration policy and not the company portal app)|[Deployment Steps](/defender-endpoint/ios-install)|
|Unsupervised Devices (User Enrollment)|Yes|Yes|1) It protects work data only. (VPN has access to entire device so can scan all app traffic)|[Deployment Steps](/defender-endpoint/ios-install)|
|MAM|Yes|No|1) It protects only enrolled apps. (VPN has access to entire device so can scan all app traffic)|[Deployment Steps](/defender-endpoint/ios-install-unmanaged)|
|Dedicated/Shared/Kiosk Devices|No|-|-|-  |

**Android low touch onboarding supported scenarios**

1. Android Enterprise personally owned devices using a work profile

1. Android Enterprise corporate owned work profile (COPE)

1. Android Enterprise corporate owned fully managed - No work profile (COBO)

**iOS zero touch onboarding supported scenarios**

1. Supervised Devices (ADE and Apple Configurator Enrollment)

1. Unsupervised Devices (Device Enrollment)

### End-user onboarding

- [Configure Zero-touch onboard for iOS enrolled devices](ios-install.md#zero-touch-silent-onboarding-of-microsoft-defender-for-endpoint): Admins can configure zero-touch install to silently onboard Microsoft Defender for Endpoint on enrolled iOS devices without requiring the user to open the app. 

- [Configure Conditional Access to enforce user onboarding](android-configure.md#conditional-access-with-defender-for-endpoint-on-android): This can be applied to ensure end-users onboard to the Microsoft Defender for Endpoint app after deploying. Watch this video for a quick demo on configuring conditional access with Defender for Endpoint risk signals. 

  <br/>

  > [!VIDEO https://www.microsoft.com/videoplayer/embed/RWMwR1]

### Simplify Onboarding

- [iOS - Zero-Touch Onboard](ios-install.md#zero-touch-silent-onboarding-of-microsoft-defender-for-endpoint)
- [Android Enterprise - Setup Always-on VPN](android-intune.md#auto-setup-of-always-on-vpn).
- [iOS - Auto-setup of VPN profile](ios-install.md#auto-onboarding-of-vpn-profile-simplified-onboarding)

## Pilot evaluation

While evaluating mobile threat defense with Microsoft Defender for Endpoint, you can verify that certain criteria is met before proceeding to deploy the service to a larger set of devices. You can define the exit criteria and ensure that they're satisfied before deploying widely.

This helps reduce potential issues that could arise while rolling out the service. Here are some tests and exit criteria that might help:

- Devices show up in the device inventory list: After successful onboarding of Defender for Endpoint on the mobile device, verify that the device is listed in the Device Inventory in the [security console](https://security.microsoft.com).
<!---
- Run a malware detection test on an Android device: Install any test virus app from the Google play store and verify that it gets detected by Microsoft Defender for Endpoint. Here's an example app that can be used for this test: (We are working on new one, it will be updated soon). Note that on Android Enterprise with a work profile, only the work profile is supported. --->

- Run a phishing test: Browse to `https://smartscreentestratings2.net` and verify that it gets blocked by Microsoft Defender for Endpoint. Note that on Android Enterprise with a work profile, only the work profile is supported.

- Alerts appear in dashboard: Verify that alerts for above detection tests appear on the [security console](https://security.microsoft.com).

Need help in deploying or configuring Defender for Endpoint on Android & iOS? If you have at least 150 licenses for the product, use your [FastTrack benefits](/microsoft-365/fasttrack/introduction). Learn more about FastTrack at [Microsoft FastTrack](https://fasttrack.microsoft.com/).

## Configure

- [Configure Android features](android-configure.md)
- [Configure iOS features](ios-configure-features.md)
- [Configure Web Protection without VPN for supervised iOS devices](ios-install.md#complete-deployment-for-supervised-devices)

## Resources

- [Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md)
- [Microsoft Defender for Endpoint on iOS](microsoft-defender-endpoint-ios.md)
- Stay informed about upcoming releases by reading our [announcements](https://aka.ms/mdeblog).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
