---
title: What's new in Microsoft Defender for Endpoint on iOS
description: Learn about the major changes for previous versions of Microsoft Defender for Endpoint on iOS.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.reviewer: sunasing; denishdonga
ms.localizationpriority: medium
ms.date: 02/11/2025
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-ios
ms.topic: reference
ms.subservice: ios
search.appverid: met150
---

# What's new in Microsoft Defender for Endpoint on iOS

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

#### Microsoft Defender for Mobile: Open Wi-Fi Detection Update

**February 2025:**

As part of our Microsoft Defender for Mobile application, we offer Open Wi-Fi detection within our Network Protection feature set. When enabled, this feature raises an alert in the Security portal. Currently, the alert is informational and doesn't require any action by the SOC analyst or admin. It serves as a key piece of information that helps with triaging incidents involving mobile devices.

**Current Behavior:**

- Every time the end user connects to an open Wi-Fi network, an alert is raised.

- If the user goes out of the open Wi-Fi range and reconnects to the same network, another alert is raised.

Based on our research insights and inputs from Microsoft and other SOC teams, we're implementing a caching behavior to ensure the value of the alerts remains and also doesn't cause fatigue to SOC teams due to sheer volume.

**New behavior:** 

- Every time the end user connects to an open Wi-Fi network, an alert is raised.

- If a user reconnects to the same open wi-fi in the next seven days, another alert won't be raised.

Note that if a user connects to a different open Wi-Fi network, an alert is immediately generated, and there's no change to that behavior.

## Upgrading your experience: UX enhancements you should know about

**January 2025**:

**Key changes**:

We're pleased to introduce the new dashboard for our enterprise users, which has been designed to be more user-friendly and accessible. The updated dashboard structure now includes recommendation cards for alerts and feature tiles.

Recommendation cards prominently display any active alerts, ensuring you stay informed. Additionally, features are now presented in the form of tiles, enhancing ease of use and navigation.

**Recommendation cards for alerts**:

The structure of the dashboard has been updated to include a recommendation card that contains active alerts (if any). In case there are multiple alerts, resolving the top alert brings forward the next one. Recommendation cards have been implemented to provide a more cohesive user experience. These cards are designed to display important alerts and notifications prominently on the dashboard, as shown in the following table.

| Card | Description |
|--|--|
| :::image type="content" source="media/ios-whatsnew/ios-network-protection-unsafe-connection.png" alt-text="Screenshot of a card indicating an unsafe network connection."::: | **Network protection** <br/>The user is prompted to connect to a secure network. |
| :::image type="content" source="media/ios-whatsnew/ios-web-protection.png" alt-text="Screenshot of a card prompting the user to turn on web protection."::: | **Web protection** <br/>The user is prompted to turn on web protection. |
| :::image type="content" source="media/ios-whatsnew/ios-update.png" alt-text="Screenshot of a card telling the user an iOS update is available."::: | **Device health** <br/>The user is prompted to update their device. |

**Feature tiles**:

We have enhanced the current enterprise dashboard experience, featuring a new tile view. The following table lists some examples of tiles:

| Tile | Description |
|--|--|
| :::image type="content" source="media/ios-whatsnew/ios-tile-network.png" alt-text="Screenshot of the network protection tile."::: | **Network protection** <br/>The user sees whether or not their connection is secure. |
| :::image type="content" source="media/ios-whatsnew/ios-tile-web-protection.png" alt-text="Screenshot of the web protection tile."::: | **Web protection** <br/>The user sees their current status of web protection. If it's not enabled, the tile indicates action is needed. |
| :::image type="content" source="media/ios-whatsnew/ios-tile-device-health.png" alt-text="Screenshot of the device health tile."::: | **Device health** <br/>The user sees their device health status. If an iOS update is available, the tile indicates that action is needed. |
| :::image type="content" source="media/ios-whatsnew/ios-tile-global-secure-access.png" alt-text="Screenshot of the Global Secure Access tile."::: | **Global Secure Access** <br/>The user sees their current status of Global Secure Access. |

## Defender for Endpoint on iOS now supports iOS/iPadOS 16.x as the minimum version

Defender for Endpoint is ending support for iOS/iPadOS 15 on January 31, 2025. Moving forward, only devices running iOS/iPadOS 16 and later are supported.

**How does this affect you or your users?**

New users won't be able to install the Microsoft Defender app on devices running iOS/iPadOS 15 and earlier versions. Similarly, existing users won't be to upgrade to the latest version of the app.

To check which devices support iOS 16 or iPadOS 16 (if applicable), see the following Apple documentation:

- [Supported iPhone Models](https://support.apple.com/guide/iphone/iphe3fa5df43/16.0/ios/16.0)
- [Supported iPad Models](https://support.apple.com/guide/ipad/ipad213a25b2/16.0/ipados/16.0)

## User enrollment

Microsoft Defender for Endpoint iOS can now be deployed on Intune User Enrolled devices. This new feature offers security and IT teams the flexibility to deploy Defender for Endpoint for iOS to user-enrolled devices so that work data and applications are protected, while end-user privacy is upheld on those devices. For more information, see [User Enrollment setup](ios-install.md#user-enrollment-setup-only-for-intune-user-enrolled-devices).  

## Device tagging

Mobile Device Tagging is now generally available. This feature enables bulk tagging the mobile devices by allowing the administrators to set up tags via Intune. Admin can configure the device tags through Intune via configuration policies and push them to user's devices. Once the User installs and activates Defender, the client app passes the device tags to the Security Portal. The Device tags appear against the devices in the Device Inventory. For more information, read [Configure Device Tagging](ios-configure-features.md#device-tagging).

## Vulnerability assessment of apps

Vulnerability assessment of apps on Microsoft Defender for Endpoint for iOS is now generally available. Defender for Endpoint on iOS supports vulnerability assessments of apps only for enrolled (MDM) devices. For more information, see [Configure vulnerability assessment of apps](ios-configure-features.md#configure-vulnerability-assessment-of-apps).

## Network protection

Network Protection on Microsoft Defender for Endpoint is now generally available. Network protection provides protection against rogue Wi-Fi related threats, rogue hardware like pineapple devices and notifies the user if a related threat is detected. Users also see a guided experience to connect to secure networks and change networks when they're connected to an unsecure connection.

**This feature is now enabled by default for all users.** As a result, users are able to see the Network Protection Card in the Defender for Endpoint iOS app along with App Protection and Web Protection. Users are also required to provide **Local Network** permission. This permission is needed to enhance the existing rogue wifi detection. Administrators can change the default value for the Network Protection feature if they decide not to use it via the Intune App Configuration policies. 

There are also several admin controls to offer flexibility, including privacy controls to configure the data that's sent by Defender for Endpoint from iOS devices. For more information, read [Configure Network Protection](ios-configure-features.md#configure-network-protection).

## Privacy Controls

Microsoft Defender for Endpoint on iOS enables Privacy Controls for both administrators and end users. These controls include the controls for enrolled (MDM) and unenrolled (MAM) devices. Administrators can configure the privacy in the phish alert report, and end users can configure the information shared to their organization.

## Optional permissions and Disable Web Protection

Microsoft Defender for Endpoint on iOS enables **Optional Permissions** in the onboarding flow. Currently the permissions required by Defender for Endpoint are mandatory in the onboarding flow. With this feature, admin can deploy Defender for Endpoint on BYOD devices without enforcing the mandatory **VPN Permission** during onboarding. End users can onboard the app without the mandatory permissions and can later review these permissions. This feature is currently present only for enrolled devices (MDM).

With **Disable Web Protection**, customers who don't want to set up a VPN can configure to disable **Web Protection** and deploy Defender for Endpoint without that feature. Other Defender for Endpoint features continues to work. This configuration is available for both the enrolled (MDM) devices and unenrolled (MAM) devices.

## Integration with Tunnel

Microsoft Defender for Endpoint on iOS can now integrate with Microsoft Tunnel, a VPN gateway solution to enable security and connectivity in a single app. Integration with Tunnel provides a simpler, secure VPN experience on iOS with just one app. This feature was earlier available only on Android. For more information, see [Tech Community: What's new in Microsoft Endpoint Manager - 2204 (April) edition](https://techcommunity.microsoft.com/t5/microsoft-endpoint-manager-blog/what-s-new-in-microsoft-endpoint-manager-2204-april-edition/ba-p/3297995).

## Improved experience on supervised iOS devices

Microsoft Defender for Endpoint on iOS now has specialized ability on supervised iOS/iPadOS devices, given the increased management capabilities provided by the platform on these types of devices. It can also provide Web Protection **without setting up a local VPN on the device**. This gives end-users a seamless experience while still being protected from phishing and other web-based attacks. For more information, see [Complete deployment for supervised devices](ios-install.md#complete-deployment-for-supervised-devices).

## Microsoft Defender for Endpoint is now Microsoft Defender in the App store

Microsoft Defender for Endpoint is now available as **Microsoft Defender** in the app store. With this update, the app is available as preview for **Consumers in the US region**. Based on how you log into the app with your work or personal account, you'll have access to features for Microsoft Defender for Endpoint or to features for Microsoft Defender for individuals. For more information, see [Microsoft Defender](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals).

## Vulnerability Management

On January 25, 2022, we announced the general availability of Vulnerability management on Android and iOS. For more information, see [Tech Community: Announcing general availability of vulnerability management support for Android and iOS](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-general-availability-of-vulnerability-management/ba-p/3071663).

## 1.1.28250101

- **Integration with Tunnel** - Microsoft Defender for Endpoint on iOS can now integrate with Microsoft Tunnel, a VPN gateway solution to enable security and connectivity in a single app. For more information, see [Microsoft Tunnel Overview](/mem/intune/protect/microsoft-tunnel-overview).
- **Zero-touch onboard for enrolled iOS devices** enrolled through Microsoft Intune is generally available. For more information, see [Zero touch onboarding of Microsoft Defender for Endpoint](ios-install.md#zero-touch-silent-onboarding-of-microsoft-defender-for-endpoint).
- Bug fixes.

## 1.1.24210103

- Resolved internet connectivity issues on supervised devices. For more information, see [Deploy Defender for Endpoint on enrolled iOS devices](ios-install.md).
- Bug fixes.

## 1.1.23250104

- Performance optimizations - Test battery performance with this version and let us know your feedback.
- **Zero-touch onboard for enrolled iOS devices** - With this version, the preview of Zero-touch onboards for devices enrolled through Microsoft Intune has been added. For more information, see this [Zero-touch (Silent) onboarding of Microsoft Defender for Endpoint](ios-install.md#zero-touch-silent-onboarding-of-microsoft-defender-for-endpoint).
- **Privacy Controls** - Configure privacy controls for phish alert report. For more information, see [Configure iOS features](ios-configure-features.md).

## 1.1.23010101

- Bug fixes and performance improvements
- Performance optimizations were made in this release. Test battery performance with this version and let us know your feedback.

## 1.1.20240103

- Device Health card - Device Health card notifies end-users about any pending software updates.
- Usability enhancements - End-users can now disable the Defender for Endpoint VPN from the Microsoft Defender app itself. Prior to this update, end-users had to disable VPN only from the Settings app.
- Bug fixes.

## 1.1.20020101

- UX Enhancements - Microsoft Defender for Endpoint has a new look.
- Bug fixes.

## 1.1.17240101

- Support for Mobile Application Management (MAM) via Intune is generally available with this version. For more information, see [Microsoft Defender for Endpoint risk signals available for your App protection policies](https://techcommunity.microsoft.com/t5/intune-customer-success/microsoft-defender-for-endpoint-risk-signals-available-for-your/ba-p/2186322)
- **Jailbreak Detection** is generally available. For more information, see [Setup Conditional Access Policy based on device risk signals](ios-configure-features.md#conditional-access-with-defender-for-endpoint-on-ios).
- **Auto-setup of VPN profile** for enrolled devices via Microsoft Intune is generally available. For more information, see [Auto-Setup VPN profile for enrolled iOS devices](ios-install.md#auto-onboarding-of-vpn-profile-simplified-onboarding).
- Bug fixes.

## 1.1.15140101

- **Jailbreak Detection** is in preview. For more information, see [Setup Conditional Access Policy based on device risk signals](ios-configure-features.md#conditional-access-with-defender-for-endpoint-on-ios).
- **Auto-setup of VPN profile** is in preview for enrolled devices via Microsoft Intune. For more information, see [Auto-Setup VPN profile for enrolled iOS devices](ios-install.md#auto-onboarding-of-vpn-profile-simplified-onboarding).
- The Microsoft Defender ATP product name has now been updated to Microsoft Defender for Endpoint in the app store.
- Improved sign-in experience.
- Bug fixes.

## 1.1.15010101

- With this version, we're announcing support for iPadOS/iPad devices.
- Bug fixes.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
