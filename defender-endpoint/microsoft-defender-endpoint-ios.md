---
title: Microsoft Defender for Endpoint on iOS
ms.reviewer: 
description: Describes how to install and use Microsoft Defender for Endpoint on iOS
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-ios
ms.topic: how-to
ms.subservice: ios
search.appverid: met150
ms.date: 06/10/2025
---

# Microsoft Defender for Endpoint on iOS

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

**Microsoft Defender for Endpoint on iOS** offers protection against phishing and unsafe network connections from websites, emails, and apps. All alerts are available through a single pane of glass in the Microsoft Defender portal. The portal gives security teams a centralized view of threats on iOS devices along with other platforms.

> [!CAUTION]
> Running other non-Microsoft endpoint protection products alongside Defender for Endpoint on iOS is likely to cause performance problems and unpredictable system errors.

## Prerequisites

### For End Users

- Microsoft Defender for Endpoint license assigned to the end users of the app. See [Microsoft Defender for Endpoint licensing requirements](minimum-requirements.md#licensing-requirements).

- **For enrolled devices**: Devices are [enrolled](/mem/intune/user-help/enroll-your-device-in-intune-ios) via the Intune Company Portal app to enforce Intune device compliance policies. This configuration requires the end user to be assigned a Microsoft Intune license. The Intune Company Portal app can be downloaded from the [Apple App Store](https://apps.apple.com/us/app/intune-company-portal/id719171358).

   > [!NOTE]
   > Apple doesn't permit redirecting users to download other apps (Company Portal/Authenticator) from the App Store. Therefore, users need to complete this step themselves before onboarding to the Microsoft Defender for Endpoint app.
   > Due to iOS platform restrictions, the MDE app allows onboarding without device registration, enabling MDE protections but leaving the device invisible on the security portal. For enrolled scenarios (MDM), the Company Portal or Authenticator app handles registration. For unenrolled scenarios (MAM), this is managed via the Authenticator app.
   > If a user has a valid Defender for Endpoint license and is registered in the Authenticator App or Company Portal App, signing in to the Defender App allows the device appear in the Microsoft Defender portal.
  
- Devices are registered with Microsoft Entra ID. This configuration requires the end user to be signed in through [Microsoft Authenticator app](https://apps.apple.com/app/microsoft-authenticator/id983156458).
  
- **For unenrolled devices**: Devices are registered with Microsoft Entra ID. This requires the end user to be signed in through [Microsoft Authenticator app](https://apps.apple.com/app/microsoft-authenticator/id983156458).

- For more information on how to assign licenses, see [Assign licenses to users](/azure/active-directory/users-groups-roles/licensing-groups-assign).

> [!NOTE]
> When a user undergoes a Microsoft account password reset, it is expected that the associated mobile device will lose corporate access if the user does not reauthenticate. Once the user reauthenticates, the device resumes communication with the Microsoft Defender portal. This policy ensures the security of the user's account and helps prevent unauthorized access.
>
> - Defender for Endpoint on iOS requires configuring its VPN to activate the Web Protection feature and to send periodic status signals while the app operates in the background. This VPN is local and pass-through, meaning it doesn't route traffic through a remote VPN server.
> 
> Customers who opt not to set up a Defender for Endpoint VPN can disable Web Protection and still deploy Defender for Endpoint. In such cases, Defender for Endpoint will only send status signals to the Microsoft Defender portal when the user opens the app. If the app isn't opened for seven days, the device might be marked as inactive in the Microsoft Defender Portal.

### For Administrators

- Access to the Microsoft Defender portal.

- Access to the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), to:

  - Deploy the app to enrolled user groups in your organization.
  - Configure Microsoft Defender for Endpoint risk signals in app protection policy (MAM)

> [!NOTE]
>
> - Microsoft Defender for Endpoint now extends protection to an organization's data within a managed application for those who aren't using mobile device management (MDM) but are using Intune to manage mobile applications. It also extends this support to customers who use other enterprise mobility management solutions, while still using Intune for [mobile application management (MAM)](/mem/intune/apps/mam-faq).
> - In addition, Microsoft Defender for Endpoint already supports devices that are enrolled using Intune mobile device management (MDM).

### System Requirements

- Device running iOS/iPadOS 16.0 and later.

- The device should be either enrolled with the [Intune Company Portal app](https://apps.apple.com/us/app/intune-company-portal/id719171358) or is registered with Microsoft Entra ID through [Microsoft Authenticator](https://apps.apple.com/app/microsoft-authenticator/id983156458) with the same account to seamlessly onboard the device.

> [!IMPORTANT]
> Microsoft Defender for Endpoint is ending support for devices running iOS/iPadOS 15 on January 31, 2025. Only devices running iOS/iPadOS 16 and later are supported.

> [!NOTE]
> - Microsoft Defender for Endpoint on iOS isn't supported on user-less or shared devices.

## Installation instructions

Deployment of Microsoft Defender for Endpoint on iOS can be done via Microsoft Intune and both supervised and unsupervised devices are supported. End-users can also directly install the app from the [Apple app store](https://aka.ms/mdatpiosappstore).

- For information on deploying on enrolled devices through Microsoft Configuration Manager or Intune, see [Deploy Microsoft Defender for Endpoint on iOS](ios-install.md).
- For information on using Defender for Endpoint in app protection policy (MAM), see [Configure app protection policy to include Defender for Endpoint risk signals (MAM)](ios-install-unmanaged.md). 

## Resources

- Stay informed about upcoming releases by visiting [What's new in Microsoft Defender for Endpoint on iOS](ios-whatsnew.md) or our [blog](https://techcommunity.microsoft.com/t5/microsoft-defender-atp/bg-p/MicrosoftDefenderATPBlog/label-name/iOS).

- Provide feedback through in-app feedback system or through the [Microsoft Defender portal](https://security.microsoft.com)

## Next steps

- [Deploy Microsoft Defender for Endpoint on iOS through Intune for enrolled devices](ios-install.md)
- [Configure app protection policy to include Defender for Endpoint risk signals (MAM)](ios-install-unmanaged.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
- [Configure Conditional Access policy based on device risk score from Microsoft Defender for Endpoint](ios-configure-features.md#conditional-access-with-defender-for-endpoint-on-ios)
- [Mobile Application Management (MAM) basics](/mem/intune/apps/app-management#mobile-application-management-mam-basics)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
