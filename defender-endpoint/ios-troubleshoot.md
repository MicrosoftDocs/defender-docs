---
title: Troubleshoot issues and find answers on FAQs related to Microsoft Defender for Endpoint on iOS
description: Troubleshooting and FAQ - Microsoft Defender for Endpoint on iOS
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-ios
ms.topic: conceptual
ms.subservice: ios
search.appverid: met150
ms.date: 01/22/2025
---

# Troubleshoot issues and find answers to FAQs on Microsoft Defender for Endpoint on iOS

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

This article provides troubleshooting information to help you address issues that might arise with Microsoft Defender for Endpoint on iOS.

> [!NOTE]
> - Defender for Endpoint on iOS requires configuring its VPN to activate the Web Protection feature and to send periodic status signals while the app operates in the background. This VPN is local and pass-through, meaning it does not route traffic through a remote VPN server.
> - Customers who opt not to set up a Defender for Endpoint VPN can disable Web Protection and still deploy Defender for Endpoint. In such cases, Defender for Endpoint will only send status signals to the Microsoft Defender portal when the user opens the app. If the app is not opened for seven days, the device may be marked as inactive in the Microsoft Defender portal.

## Apps don't work when VPN is turned on

There are some apps that stop functioning when an active VPN is detected. You can disable the VPN during the time you're using such apps.

By default, Defender for Endpoint on iOS includes and enables the web protection feature. [Web protection](web-protection-overview.md) helps to secure devices against web threats and protect users from phishing attacks. Defender for Endpoint on iOS uses a VPN in order to provide this protection. This is a local VPN and unlike traditional VPN, network traffic isn't sent outside the device.

While enabled by default, there might be some cases that require you to disable VPN. For example, you want to run some apps that don't work when a VPN is configured. In such cases, you can choose to disable the VPN directly from the Defender for Endpoint app or using the following steps:

1. On your iOS device, open the **Settings** app, select **General**, and then select **VPN**.

2. Select the **i** button for Defender for Endpoint.

3. Toggle off **Connect On Demand** to disable VPN.

   > [!div class="mx-imgBorder"]
   > :::image type="content" source="media/ios-vpn-config.png" alt-text="The Connect on demand option" lightbox="media/ios-vpn-config.png":::

> [!NOTE]
> Web Protection isn't available when VPN is disabled. To re-enable Web Protection, open the Defender for Endpoint app on the device and enable Web Protection.

## Coexistence with multiple VPN profiles

Apple iOS doesn't support multiple **device-wide** VPNs to be active simultaneously. While multiple VPN profiles can exist on the device, only one VPN can be active at a time. If you need to use another VPN on the device, you can disable Defender for Endpoint VPN while you're using the other VPN.

## Battery consumption

To help ensure protection from web-based threats is active, Defender for Endpoint needs to run in the background at all times. This might lead to a minor increase in overall battery consumption of your device. In case you're seeing significant battery drain, [send us feedback](ios-troubleshoot.md#send-in-app-feedback) and we'll investigate.

Also, in the **Settings** app, iOS only shows battery usage of apps that are visible to the user for a specific duration of time. The battery usage by apps shown on the screen is only for that time duration and is computed by iOS based on a multitude of factors, including CPU and Network usage. Microsoft Defender for Endpoint uses a local/loop-back VPN in the background to check web traffic for any malicious websites or connections. Network packets from any app go through this check and that causes the battery usage of Microsoft Defender for Endpoint to be computed inaccurately. The actual battery consumption of Microsoft Defender for Endpoint is lesser than what is shown on the Battery Settings page on the device.

The VPN used is a local VPN and unlike a traditional VPN, network traffic isn't sent outside the device.

## Data usage

Microsoft Defender for Endpoint uses a local/loopback VPN to check web traffic for any malicious websites or connections. Due to this reason, Microsoft Defender for Endpoint data usage can be inaccurately accounted for. We've also observed that if the device is on cellular network only, the data usage reported by service provider is very close to the actual consumption whereas in the Settings app, the numbers can be inaccurate.

We've similar observations with other VPN services as well.

In addition, it's critical for Microsoft Defender for Endpoint to be up to date with our backend services to provide better protection.

## Report unsafe site

Phishing websites impersonate trustworthy websites for obtaining your personal or financial information. Visit the [Provide feedback about network protection](https://www.microsoft.com/wdsi/support/report-unsafe-site) page to report a website that could be a phishing site.

## Malicious site detected

Microsoft Defender for Endpoint protects you against phishing or other web-based attacks. If a malicious site is detected, the connection is blocked and an alert is sent to the organization's Microsoft Defender portal. The alert includes the domain name of the connection, remote IP address and the device details.

In addition, a notification is shown on the iOS device. Tapping on the notification opens the following screen for the user to review the details.

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/ios-phish-alert.png" alt-text="The site reported as unsafe notification" lightbox="media/ios-phish-alert.png":::

## Device not seen in the Microsoft Defender portal after onboarding

After onboarding, it takes few hours for device to show up in the Device inventory in the Microsoft Defender portal. Also, ensure that device is registered correctly with Microsoft Entra ID and device has internet connectivity. For successful onboarding, the device has to be registered via Microsoft Authenticator or Intune Company Portal and the user needs to sign-in using the same account with which device is registered with Microsoft Entra ID.

> [!NOTE]
> Sometimes, the device name is not consistent with that in Microsoft Intune admin center. The device name in the Microsoft Defender portal is of the format <username_iPhone/iPad*>. You can also use your Microsoft Entra device ID to identify the device in the Microsoft Defender portal.

## Data and Privacy

For details about data collected and privacy, see [Privacy Information - Microsoft Defender for Endpoint on iOS](ios-privacy.md).

## Connectivity issue on cellular network

If you're facing internet connectivity issues on cellular network, check if Microsoft Defender for Endpoint has cellular data enabled: Open Settings app > MS Defender > ensure that "Cellular data" is enabled for MS Defender.

If you still have connectivity issues, check if turning on/off Airplane mode helps resolve the issue. If the issue persists, [send us logs](ios-troubleshoot.md#send-in-app-feedback).


## Issues during app updates from the app store

By default, apps that are downloaded from the app store are updated automatically. 

But if there's an issue, you can update the app manually. 

- On your iOS device, open the App Store.
- Tap on Menu (profile icon) on the top-left corner.
- Scroll to see any pending updates and release notes. Tap **Update** next to an app to update only that app, or tap **Update All**.

You can also choose to turn off automatic updates. On your iOS device, open the **Settings** app > go to **App Store** > toggle off **App Updates** to turn off automatic updates. 

If you observe issues when the app is updated through the app store (either automatic updates or manual updates), you might need to restart the device. If that doesn't resolve the issue, you can disable the Defender VPN and perform the app update. You can also provide an in-app feedback to report this issue.

## Send in-app feedback

If a user faces an issue that isn't already addressed in the above sections or is unable to resolve using the listed steps, the user can provide in-app feedback along with diagnostic data. Our team will then investigate the logs to provide the right solution. 

1. Users can use the following steps to send feedback if they are signed in to the app and can see the Send Feedback option:

   1. Open the MS Defender app on the iOS/iPadOS device.
   
   2. Select the menu (profile icon) on the top-left corner, and then select **Help and Feedback**.
   
   3. Choose from the given options. Under troubleshooting, select **Send Logs to Microsoft**.

   4. Share Incident ID to your support engineer.

2. Users can use the following steps to send feedback if they are having sign in issues or the **Send Feedback** option is disabled (example GCC customers):

   1. Sign out of the MS Defender app (applicable when Send Feedback option is disabled).

   2. Select **Sign in with a different account**.

   3. Select **Get help signing in**.

   4. Select **Report a problem**, and provide details about the issue you are facing. Don't include personal information, such as your email account.

   5. Select the toggle to include diagnostic data, and submit your feedback. 
   
   6. Sign back in to the app (applicable if user has signed out).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
