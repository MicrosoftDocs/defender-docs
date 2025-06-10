---
title: Deploy Microsoft Defender for Endpoint on iOS with Microsoft Intune
ms.reviewer:
description: Describes how to deploy Microsoft Defender for Endpoint on iOS using an app.
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
ms.topic: install-set-up-deploy
ms.subservice: ios
search.appverid: met150
ms.date: 03/28/2025
---

# Deploy Microsoft Defender for Endpoint on iOS with Microsoft Intune

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

This article describes deploying the Defender for Endpoint on iOS (using the Microsoft Defender app) with Microsoft Intune Company Portal enrolled devices. For more information about Microsoft Intune device enrollment, see [Enroll iOS/iPadOS devices in Intune](/mem/intune/enrollment/ios-enroll).

## Before you begin

- Ensure you have access to the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431) and the [Microsoft Defender portal](https://security.microsoft.com).

- Ensure iOS enrollment is done for your users. Users need to have a Defender for Endpoint license assigned in order to use the Microsoft Defender app. Refer to [Assign licenses to users](/azure/active-directory/users-groups-roles/licensing-groups-assign) for instructions on how to assign licenses.

- Ensure that end users have the Company Portal app installed, have signed in, and have completed enrollment.

> [!NOTE]
> The Microsoft Defender app is available in the [Apple App Store](https://aka.ms/mdatpiosappstore).

This section covers:

1. **Deployment steps** (applicable for both **Supervised** and **Unsupervised** devices)- Administrators can deploy Defender for Endpoint on iOS via Microsoft Intune Company Portal. This step isn't needed for VPP (volume purchase) apps.

1. **Complete deployment** (only for Supervised devices)- Administrators can select to deploy any one of the given profiles.

   - **Zero touch (Silent) Control Filter** - Provides Web Protection without the local loopback VPN and enables silent onboarding for users. The app is automatically installed and activated without the need for users to open the app.
   - **Control Filter** - Provides Web Protection without the local loopback VPN.
  
2. **Automated Onboarding setup** (only for **Unsupervised** devices) - Administrators can automate the Defender for Endpoint onboarding for users in two different ways:

   - **Zero touch (Silent) Onboarding** - The Microsoft Defender app is automatically installed and activated without the need for users to open the app.
   - **Auto Onboarding of VPN** - Defender for Endpoint VPN profile is automatically set up without having the user to do so during onboarding. This step isn't recommended in Zero touch configurations.

3. **User Enrollment setup** (only for Intune User Enrolled devices) - Administrators can deploy and configure the Defender for Endpoint app on the Intune User Enrolled devices also.

4. **Complete onboarding and check status** -  This step is applicable for all enrollment types to ensure app is installed on the device, onboarding is completed, and device is visible in the Microsoft Defender portal. It can be skipped for the zero touch (silent) onboarding.

## Deployment steps (applicable for both Supervised and Unsupervised devices)

Deploy Defender for Endpoint on iOS via Microsoft Intune Company Portal.

### Add iOS store app

1. In the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), go to **Apps** > **iOS/iPadOS** > **Add** > **iOS store app** and select **Select**.

   :::image type="content" source="media/ios-deploy-1.png" alt-text="The Add applications tab in the Microsoft Intune admin center" lightbox="media/ios-deploy-1.png":::

1. On the **Add app** page, select **Search the App Store** and type **Microsoft Defender** in the search bar. In the search results section, select *Microsoft Defender* and select **Select**.

1. Select **iOS 15.0** as the Minimum operating system. Review the rest of information about the app and select **Next**.

1. In the **Assignments** section, go to the **Required** section and select **Add group**. You can then choose the user groups that you would like to target Defender for Endpoint on iOS app. Select **Select**, and then select **Next**.

    > [!NOTE]
    > The selected user group should consist of Microsoft Intune enrolled users.

   :::image type="content" source="media/ios-deploy-2.png" alt-text="The Add group tab in the Microsoft Intune admin center" lightbox="media/ios-deploy-2.png":::

1. In the *Review + Create* section, verify that all the information entered is correct and then select **Create**. In a few moments, the Defender for Endpoint app should be created successfully, and a notification should show up at the top-right corner of the page.

1. In the app information page that is displayed, in the **Monitor** section, select **Device install status** to verify that the device installation completed successfully.

   :::image type="content" source="media/ios-deploy-3.png" alt-text="The Device install status page" lightbox="media/ios-deploy-3.png":::

## Complete deployment for supervised devices

The Microsoft Defender app offers enhanced capabilities on supervised iOS/iPadOS devices, using the advanced management features of the platform. It also delivers Web Protection without the need for a local VPN setup on the device. This ensures a seamless user experience while safeguarding against phishing and other web-based threats.

Administrators can use the following steps to configure supervised devices.

### Configure Supervised Mode via Microsoft Intune

Configure supervised mode for the Microsoft Defender app through an App configuration policy and a Device configuration profile.

#### App configuration policy

> [!NOTE]
> This app configuration policy for supervised devices is applicable only to managed devices and should be targeted for ALL managed iOS devices as a best practice.

1. Sign in to the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431) and go to **Apps** \> **App configuration policies** \> **Add**. Select **Managed devices**.

   :::image type="content" source="media/ios-deploy-4.png" alt-text="Image of Microsoft Intune admin center4." lightbox="media/ios-deploy-4.png":::

1. In the **Create app configuration policy** page, provide the following information:

   - Policy Name
   - Platform: Select iOS/iPadOS
   - Targeted app: Select **Microsoft Defender for Endpoint** from the list

   :::image type="content" source="media/ios-deploy-5.png" alt-text="Image of Microsoft Intune admin center5." lightbox="media/ios-deploy-5.png":::

1. In the next screen, select **Use configuration designer** as the format. Specify the following properties:
   
   - Configuration Key: `issupervised`
   - Value type: String
   - Configuration Value: `{{issupervised}}`

   :::image type="content" source="media/ios-deploy-6.png" alt-text="Image of Microsoft Intune admin center6." lightbox="media/ios-deploy-6.png":::

1. Select **Next** to open the **Scope tags** page. Scope tags are optional. Select **Next** to continue.

1. On the **Assignments** page, select the groups that receive this profile. For this scenario, it's best practice to target **All Devices**. For more information on assigning profiles, see [Assign user and device profiles](/mem/intune/configuration/device-profile-assign).

   When deploying to user groups, users must sign in to their devices before the policy is applied.

   Select **Next**.

1. On the **Review + create** page, when you're done, choose **Create**. The new profile is displayed in the list of configuration profiles.

#### Device configuration profile (Control Filter)

> [!NOTE]
> For devices that run iOS/iPadOS (in Supervised Mode), there's a custom `.mobileconfig` profile available, called the **ControlFilter** profile. This profile enables Web Protection **without setting up the local loopback VPN on the device**. This gives end users a seamless experience while still being protected from phishing and other web-based attacks.
>
> However, the **ControlFilter** profile doesn't work with Always-On VPN (AOVPN) due to platform restrictions.

Administrators deploy any one of the given profiles.

1. **Zero touch (Silent) Control Filter** - This profile enables silent onboarding for users. Download the config profile from [ControlFilterZeroTouch](https://download.microsoft.com/download/f/8/e/f8ed3484-b665-4c3c-9ae9-272c8a04159b/Microsoft_Defender_for_Endpoint_Control_Filter_Zerotouch.mobileconfig).

2. **Control Filter** - Download the config profile from [ControlFilter](https://download.microsoft.com/download/f/8/e/f8ed3484-b665-4c3c-9ae9-272c8a04159b/Microsoft_Defender_for_Endpoint_Control_Filter_1.mobileconfig).

Once the profile is downloaded, deploy the custom profile. Follow these steps:

1. Navigate to **Devices** > **iOS/iPadOS** > **Configuration profiles** > **Create Profile**.

1. Select **Profile Type** > **Templates** and **Template name** > **Custom**.

   :::image type="content" source="media/ios-deploy-7.png" alt-text="Image of Microsoft Intune admin center7." lightbox="media/ios-deploy-7.png":::

1. Provide a name of the profile. When prompted to import a Configuration profile file, select the one downloaded from the previous step.

1. In the **Assignment** section, select the device group to which you want to apply this profile. As a best practice, this should be applied to all managed iOS devices. Select **Next**.

   > [!NOTE]
   > Device Group creation is supported in both Defender for Endpoint Plan 1 and Plan 2.

1. On the **Review + create** page, when you're done, choose **Create**. The new profile is displayed in the list of configuration profiles.

## Automated Onboarding setup (only for Unsupervised devices)

Administrators can automate onboarding to Defender for Endpoint for users in two different ways with Zero touch (Silent) Onboarding or Auto Onboarding of VPN.

### Zero-touch (Silent) onboarding to Defender for Endpoint

> [!NOTE]
> Zero-touch can't be configured on iOS devices that are enrolled without user affinity (user-less devices or shared devices).

Administrators can set up Microsoft Defender for Endpoint for silent deployment and activation. In this process, the administrator creates a deployment profile, and the user is notified of the installation. Defender for Endpoint is then automatically installed without requiring the user to open the app. Follow the steps in this article to configure zero-touch or silent deployment of Defender for Endpoint on enrolled iOS devices:

1. In the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), go to **Devices** > **Configuration Profiles** > **Create Profile**.

1. Choose **Platform** as **iOS/iPadOS**, **Profile type** as **Templates** and **Template name** as **VPN**. Select **Create**.

1. Type a name for the profile and select **Next**.

1. Select **Custom VPN** for Connection Type and in the **Base VPN** section, enter the following:

   - Connection Name: Microsoft Defender for Endpoint
   - VPN server address: `127.0.0.1`
   - Auth method: "Username and password"
   - Split Tunneling: `Disable`
   - VPN identifier: `com.microsoft.scmx`
   - In the key-value pairs, enter the key `SilentOnboard` and set the value to `True`.
   - Type of Automatic VPN: `On-demand VPN`
   - Select **Add** for **On Demand Rules**, and then select **I want to do the following: Connect VPN**, and then set **I want to restrict to: All domains**.

   :::image type="content" source="media/ios-deploy-9.png" alt-text="The VPN profile Configuration page" lightbox="media/ios-deploy-9.png":::

   - To mandate that VPN can't be disabled in users device, administrators can select **Yes** from **Block users from disabling automatic VPN**. By default, it's not configured and users can disable VPN only in **Settings**.
   - To allow users to change the VPN toggle from within the app, add `EnableVPNToggleInApp = TRUE`, in the key-value pairs. By default, users can't change the toggle from within the app.

1. Select **Next** and assign the profile to targeted users.

1. In the **Review + Create** section, verify that all the information entered is correct, and then select **Create**.

After this configuration is done and synced with the device, the following actions take place on the targeted iOS devices:

- Defender for Endpoint is deployed and silently onboarded. The device is visible in the Microsoft Defender portal after it's onboarded.
- A provisional notification is sent to the user's device.
- Web Protection and other features are activated.

In some cases, for security reasons like password changes, multifactor authentication, and so on, zero-touch onboarding might require end user to manually sign-in in the Microsoft Defender app. 

**A: For first time onboarding scenarios, end users receive a silent notification**.

:::image type="content" source="media/mde-ios-notification.png" alt-text="Screenshot showing the MDE silent notification" lightbox="media/mde-ios-notification.png":::

End users should take the following steps:

1. Open the Microsoft Defender app or tap on the notification message.

1. Select the enrolled enterprise account from the account picker screen.

1. Sign in.

The device is onboarded and starts reporting to the Microsoft Defender portal.

**B: For already onboarded devices, end users see a silent notification**.

:::image type="content" source="media/mde-ios-notification-2.png" alt-text="Screenshot showing the MDE app silent notification" lightbox="media/mde-ios-notification-2.png":::

1. Open the Microsoft Defender app, or tap the notification.  

1. When prompted by the Microsoft Defender app, sign in.

After this, the device starts reporting to the Microsoft Defender portal again. 

> [!NOTE]
> - Zero touch setup can take up to 5 minutes to complete in the background. 
> - For supervised devices, administrators can set up Zero touch onboarding with the [ZeroTouch Control Filter Profile](#device-configuration-profile-control-filter). In this case, the Defender for Endpoint VPN Profile isn't installed on the device, and Web protection is provided by the Control Filter Profile.

### Auto-Onboarding of VPN profile (Simplified Onboarding)

> [!NOTE]
> This step simplifies the onboarding process by setting up the VPN profile. If you're using Zero touch, you don't need to perform this step. 

For unsupervised devices, a VPN is used to provide the Web Protection feature. This isn't a regular VPN and is a local/self-looping VPN that doesn't take traffic outside the device.

Administrators can configure autosetup of VPN profile. This automatically sets up the Defender for Endpoint VPN profile without having the user to do so while onboarding.

1. In the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), go to **Devices** > **Configuration Profiles** > **Create Profile**.

1. Choose **Platform** as **iOS/iPadOS** and **Profile type** as **VPN**. Select **Create**.

1. Type a name for the profile and select **Next**.

1. Select **Custom VPN** for Connection Type and in the **Base VPN** section, enter the following:

   - Connection Name: Microsoft Defender for Endpoint
   - VPN server address: `127.0.0.1`
   - Auth method: "Username and password"
   - Split Tunneling: `Disable`
   - VPN identifier: `com.microsoft.scmx`
   - In the key-value pairs, enter the key `AutoOnboard` and set the value to `True`.
   - Type of Automatic VPN: On-demand VPN
   - Select **Add** for **On Demand Rules** and select **I want to do the following: Connect VPN**, **I want to restrict to: All domains**.

   :::image type="content" source="media/ios-deploy-8.png" alt-text="The VPN profile Configuration settings tab." lightbox="media/ios-deploy-8.png":::

   - To ensure that the VPN can't be disabled on a users' device, administrators can select **Yes** from **Block users from disabling automatic VPN**. By default, this setting not configured and users can disable VPN only in **Settings**.
   - To allow users to change the VPN toggle from within the app, add `EnableVPNToggleInApp = TRUE`, in the key-value pairs. By default, users can't change the toggle from within the app.

1. Select **Next**, and assign the profile to targeted users.

1. In the **Review + Create** section, verify that all the information entered is correct, and then select **Create**.

##  **User Enrollment setup** (only for Intune User Enrolled devices)

Microsoft Defender app can be deployed to iOS devices with Intune User Enrolled devices using the following steps.

 ### Admin

1. Set up User Enrollment Profile in Intune. Intune supports account driven Apple User Enrollment and Apple User Enrollment with Company Portal. Read more about the [comparison](/mem/intune/enrollment/ios-user-enrollment-supported-actions#apple-user-enrollment-methods) of the two methods and select one.

   - [Set up user enrollment with Company Portal](/mem/intune/enrollment/apple-user-enrollment-with-company-portal)
   - [Set up account driven user enrollment](/mem/intune/enrollment/apple-account-driven-user-enrollment)

 1. Set up SSO Plugin. Authenticator app with SSO extension is a prerequisite for user enrollment in an iOS device.
   
    - Create a Device configuration Profile in Intune. See [Microsoft Enterprise SSO plug-in for Apple devices](/entra/identity-platform/apple-sso-plugin). 
    - Ensure to add these two keys in the device configuration profile:
      - App bundle ID: Include the Defender App bundle ID in this list `com.microsoft.scmx`
      - Another configuration: Key: `device_registration`; Type: `String`; Value: `{{DEVICEREGISTRATION}}`

 1. Set up the MDM Key for User Enrollment.
   
   1. In the [Intune admin center](https://intune.microsoft.com/#home), go to Go to **Apps** \> **App configuration policies** \> **Add** \> **Managed devices**.

   2. Give the policy a name, and then select **Platform** \> **iOS/iPadOS**.

   3. Select **Microsoft Defender for Endpoint** as the target app.

   4. On the **Settings** page, select **Use configuration designer**, and add `UserEnrollmentEnabled` as the key, with the value type as `String`, and the value set to `True`.

 1. Administrators can push the Microsoft Defender app as a required VPP app from Intune. 

### End User

The Microsoft Defender app is installed into the users' devices. Each user signs in and completes the onboarding process. Once the device is successfully onboarded, it's visible in the Microsoft Defender portal, under **Device Inventory**.

### Supported features and limitations

- Supports all the current capabilities of Defender for Endpoint on iOS. These capabilities include Web protection, Network Protection, Jailbreak detection, Vulnerabilities in OS and Apps, and Alerting in the Microsoft Defender portal.
- Zero touch (silent) deployment and auto onboarding of VPN isn't supported with User Enrollment since Administrators can't push a device wide VPN profile with User Enrollment.
- For vulnerability management of apps, only apps in the work profile will be visible.
- It can take up to 10 minutes for newly onboarded devices to become compliant if targeted by compliance policies.  
- For more information, see [User Enrollment limitations and capabilities](/mem/intune/enrollment/ios-user-enrollment-supported-actions#limitations-and-capabilities-not-supported).

## Complete onboarding and check status

1. Once Defender for Endpoint on iOS has been installed on the device, you see the app icon.

   :::image type="icon" source="media/41627a709700c324849bf7e13510c516.png":::

2. Tap the Defender for Endpoint app icon (Defender) and follow the on-screen instructions to complete the onboarding steps. The details include end users acceptance of iOS permissions required by the Microsoft Defender app.

> [!NOTE] 
> Skip this step if you configure zero touch (silent) onboarding. Manually launching application isn't necessary if zero touch (silent) onboarding is configured.

3. Upon successful onboarding, the device starts showing up on the Devices list in the Microsoft Defender portal.

   :::image type="content" source="media/device-inventory-screen.png" alt-text="The Device inventory page." lightbox="media/device-inventory-screen.png":::

## Next Steps

- [Configure app protection policy to include Defender for Endpoint risk signals (MAM)](ios-install-unmanaged.md)
- [Configure Defender for Endpoint on iOS features](ios-configure-features.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
