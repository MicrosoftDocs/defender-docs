---
title: Configure Microsoft Defender for Endpoint on Android risk and protection settings
description: Learn how to configure web protection, network protection, privacy controls, custom indicators, and device tagging for Microsoft Defender for Endpoint on Android using Microsoft Intune.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: mchakraborty
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-android
ms.topic: how-to
ms.subservice: android
ms.date: 07/28/2026
appliesto:
   - Microsoft Defender for Endpoint Plan 1
   - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Configure Defender for Endpoint on Android features

## Conditional Access with Defender for Endpoint on Android

Microsoft Defender for Endpoint on Android, along with Microsoft Intune and Microsoft Entra ID, enables enforcing Device compliance and Conditional Access policies based on device risk levels. Defender for Endpoint is a Mobile Threat Defense (MTD) solution that you can deploy through Intune.

For more information about how to set up Defender for Endpoint on Android and Conditional Access, see [Defender for Endpoint and Intune](/intune/intune-service/protect/advanced-threat-protection).

## Configure custom indicators

Defender for Endpoint on Android enables admins to configure custom indicators to support Android devices, with some platform-specific limitations.

> [!NOTE]
> Defender for Endpoint on Android supports creating custom indicators only for URLs and domains. IP-based custom indicators aren't supported on Android.
>
> IP `245.245.0.1` is an internal Defender IP and should not be included in custom indicators by customers to avoid any functionality issues.
> Also, alerts for custom indicators are currently not supported for Defender for Endpoint on Android.

Defender for Endpoint on Android enables admins to configure custom indicators to support Android devices as well. For more information on how to configure custom indicators, see [Overview of indicators](indicators-overview.md).

## Configure web protection

> [!NOTE]
> Defender for Endpoint on Android would use a VPN in order to provide the Web Protection feature. This VPN isn't a regular VPN. Instead, it's a local/self-looping VPN that doesn't take traffic outside the device.
>
> For more information, see [Configure web protection on devices that run Android](/intune/intune-service/protect/advanced-threat-protection-manage-android).

Defender for Endpoint on Android allows IT Administrators the ability to configure the web protection feature. This capability is available within the Microsoft Intune admin center.

[Web protection](web-protection-overview.md) helps to secure devices against web threats and protect users from phishing attacks. Anti-phishing and custom indicators (URL and IP addresses) are supported as part of web protection. Web content filtering is currently not supported on mobile platforms.

<a name="network-protection"></a>

## Configure network protection

Network protection provides protection against rogue Wi-Fi related threats and rogue certificates, which are the primary attack vector for Wi-Fi networks. Admins can list the root Certificate Authority (CA) and private root CA certificates in Microsoft Intune admin center and establish trust with endpoints. Network protection provides the user a guided experience to connect to secure networks and also notifies them if a related threat is detected.

Network protection includes several admin controls to offer flexibility, such as the ability to configure the feature from within the Microsoft Intune admin center and add trusted certificates. Admins can enable [privacy controls](android-configure.md#privacy-controls) to configure the data sent to Defender for Endpoint from Android devices.

Network protection in Microsoft Defender for endpoint is enabled by default. Admins can use the following steps to **configure Network protection in Android devices.**

In the Microsoft Intune admin center, navigate to Apps > App configuration policies. Create a new App configuration policy.

1. Provide a name and description to uniquely identify the policy. Select **'Android Enterprise'** as the platform and **'Personally-owned work profile only'** as the profile type and **'Microsoft Defender'** as the Targeted app.

1. In Settings page, select **'Use configuration designer'** and add **'Enable Network Protection in Microsoft Defender'** as the key and value as **'0'** to disable Network Protection. (Network protection is enabled by default)

1. If your organization uses root CAs that are private, you must establish explicit trust between Intune (MDM solution) and user devices. Establishing trust helps prevent Defender from flagging root CAs as rogue certificates.

   To establish trust for the root CAs, use **'Trusted CA certificate list for Network Protection'** as the key. In the value, add the **'comma separated list of certificate thumbprints (SHA 1)'**.

   **Example of Thumbprint format to add**: `50 30 06 09 1d 97 d4 f5 ae 39 f7 cb e7 92 7d 7d 65 2d 34 31, 503006091d97d4f5ae39f7cbe7927d7d652d3431`

   > [!IMPORTANT]
   > Certificate SHA-1 Thumbprint characters should be with either white space separated, or non separated.
   >
   > This format is invalid: `50:30:06:09:1d:97:d4:f5:ae:39:f7:cb:e7:92:7d:7d:65:2d:34:31`

   Any other separation characters are invalid.

1. For other configurations related to Network protection, add the following keys and appropriate corresponding value.

   |Configuration Key|Description|
   |---|---|
   |Trusted CA certificate list for Network Protection|Security admins manage this setting to establish trust for root CA and self-signed certificates.|
   |Enable Network protection in Microsoft Defender|1: Enable (default)<br/> 0: Disable<br/><br/> This setting is used by the IT admin to enable or disable the network protection capabilities in the Defender app.|
   |Enable Network Protection Privacy|1: Enable (default) <br/> 0: Disable <br/><br/> Security admins manage this setting to enable or disable privacy in network protection.|
   |Enable Users to Trust Networks and Certificates|1: Enable <br/>0: Disable (default) <br/><br/> This setting is used by IT admins to enable or disable the end user in-app experience to trust and untrust the unsecure networks and malicious certificates.|
   |Automatic Remediation of Network Protection Alerts|1: Enable (default) <br/> 0: Disable <br/><br/> This setting is used by IT admins to enable or disable the remediation alerts that are sent when a user does remediation activities. For example, the user switches to a safer Wi-Fi access point or deletes suspicious certificates that were detected by Defender. This setting only applies to alerts and does not affect device timeline events. As such, it does not apply to the detection of open Wi-Fi networks or self-signed certificates |
   |Manage Network Protection detection for Open Networks| 2:  Enable (default)<br/> 1: Audit Mode <br/> 0: Disable <br/><br/>Security admins manage this setting to enable or disable open network detection. |
   |Manage Network protection Detection for Certificates|2: Enable <br/> 1: Audit mode<br/> 0: Disable (default)<br/><br/>In audit mode, events are sent to SOC admins, but no end user notifications are shown when Defender detects a bad certificate. Admins can enable full feature functionality by setting the value 2. When the value is 2, end user notifications are sent to users and events are sent to SOC admins when Defender detects a bad certificate.|

1. Add the required groups to which the policy has to be applied. Review and create the policy.

> [!NOTE]
>
> - The other config keys of Network Protection will only work if the parent key '**Enable Network Protection in Microsoft Defender'** is enabled.
> - To ensure comprehensive protection against Wi-Fi threats, users should enable location permission and select the "Allow All the Time" option. This permission is optional but highly recommended, even when the app is not actively in use. If location permission is denied, Defender for Endpoint will only offer limited protection against network threats and will only safeguard users from rogue certificates.

> [!IMPORTANT]
> Starting in May 2025, alerts are no longer generated in the Microsoft Defender portal for mobile devices connecting or disconnecting to an open wireless network and for downloading/installing/deleting self-signed certificates. Instead, these activities are now generated as events and are viewable in the device timeline.
> Here are key changes about this new experience:
>
> - For these changes to take effect, end-users must update to the latest version of Defender for Endpoint on Android available on mid-May 2025. Otherwise, the previous experience of generating alerts will still be in place. If auto-remediation key is enabled by the admin, old alerts are resolved automatically after the changes take effect.
> - When an end-user connects or disconnects to an open wireless network multiple times within the same 24-hour period, only one event each for the connection and disconnection is generated in that 24-hour period and sent to the device timeline.
> - Enable Users to Trust Networks: After the update, connection and disconnection events to open wireless networks, including trusted networks, are sent to the device timeline as events.
> - Users allow-listed certificates: After the update, downloading/installing/deleting self-signed certificates events, including user-trusted certificates, are sent to the device timeline as events.
> - The previous experience of generating alerts for these activities still continue to apply to GCC tenants.

<a name="privacy-controls"></a>

## Configure privacy controls

Privacy controls are settings that let admins limit which threat details Defender for Endpoint sends in alert reports from Android devices. The following privacy controls are available:

|Threat Report|Details|
|---|---|
|Malware report|Admins can set up privacy control for malware report. If privacy is enabled, then Defender for Endpoint won't send the malware app name and other app details as part of the malware alert report.|
|Phish report|Admins can set up privacy control for phishing reports. If privacy is enabled, then Defender for Endpoint won't send the domain name and details of the unsafe website as part of the phishing alert report.|
|Vulnerability assessment of apps|By default only information about apps installed in the work profile is sent for vulnerability assessment. Admins can disable privacy to include personal apps|
|Network Protection|Admins can enable or disable privacy in network protection. If enabled, then Defender won't send network details.|

**Prerequisite**:

- Company portal must be installed, and version must be >=5.0.6621.0

### Configure privacy alert report

Admins can now enable privacy control for the phishing report, malware report, and network report sent by Microsoft Defender for Endpoint on Android. This configuration ensures that the domain name, app details, and network details, respectively, aren't sent as part of the alert whenever a corresponding threat is detected.

Admin Privacy Controls (MDM) Use the following steps to enable privacy.

1. In Microsoft Intune admin center, go to **Apps > App configuration policies > Add > Managed devices**.

1. Give the policy a **name, Platform > Android enterprise, select the profile type**.

1. Select **Microsoft Defender for Endpoint** as the target app.

1. On the Settings page, select **Use configuration designer** and then select **Add**.

1. Select the required privacy setting
    - Hide URLs in report
    - Hide URLs in report for personal profile
    - Hide app details in report
    - Hide app details in report for personal profile
    - Enable Network Protection Privacy

1. To enable privacy, enter integer value as 1 and assign this policy to users. By default, this value is set to 0 for MDE in work profile and 1 for MDE on personal profile.

1. Review and assign this profile to targeted devices/users.

### End user privacy controls

The end-user privacy controls help the end user to configure the information shared to their organization.

1. For **Android Enterprise work profile**, end user controls won't be visible. Admins control these settings.
1. For **Android Enterprise personal profile**, the control is displayed under **Settings> Privacy**.
1. Users see a toggle for Unsafe Site Info, malicious application, and network protection.

The Unsafe Site Info, malicious application, and network protection toggles are only visible if enabled by the admin. Users can decide if they want to send the information to their organization or not.

Enabling/disabling the above privacy controls won't affect the device compliance check or conditional access.

## Configure vulnerability assessment of apps for BYOD devices

From version 1.0.3425.0303 of Microsoft Defender for Endpoint on Android, you're able to run vulnerability assessments of the OS and apps installed on the onboarded mobile devices.

> [!NOTE]
> Vulnerability assessment is part of [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) in Microsoft Defender for Endpoint.

**Notes about privacy related to apps from personal devices (BYOD):**

- For Android Enterprise with a work profile, only apps installed on the work profile are supported.
- For other BYOD modes, by default, vulnerability assessment of apps will **not** be enabled. However, when the device is on administrator mode, admins can explicitly enable this feature through Microsoft Intune to get the list of apps installed on the device. For more information, see [Configure privacy for Android Enterprise work profile](#configure-privacy-for-android-enterprise-work-profile).

### Configure privacy for Android Enterprise work profile

Defender for Endpoint supports vulnerability assessment of apps in the work profile. However, in case you want to turn off this feature for targeted users, you can use the following steps:

1. In [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), go to **Apps** \> **App configuration policies** \\> **Add** > **Managed devices**.
1. Give the policy a name; **Platform \> Android Enterprise**; select the profile type.
1. Select **Microsoft Defender for Endpoint** as the target app.
1. In Settings page, select **Use configuration designer** and add **Enable TVM Privacy** as the key and value type as **Integer**.
   - To disable vulnerability of apps in the work profile, enter value as `1` and assign this policy to users. By default, this value is set to `0`.
   - For users with key set as `0`, Defender for Endpoint sends the list of apps from the work profile to the backend service for vulnerability assessment.
1. Select **Next** and assign this profile to targeted devices/users.

Turning the above privacy controls on or off won't affect the device compliance check or conditional access.

## Configure non-APK file scanning

Beyond scanning Android application packages (APK files), Defender for Endpoint on Android can scan non-APK files, such as documents, compressed archives, and scripts, that users download, receive, or store on the device. This scanning extends malware protection to more file types on the device.

Non-APK file scanning is supported on enrolled devices in the following management scenarios:

- Personally owned devices with a work profile (BYOD)
- Corporate-owned devices with a work profile (COPE)
- Corporate-owned, fully managed devices (COBO)

> [!NOTE]
> Defender for Endpoint respects Android profile boundaries. On a device with a work profile, Defender scans only files in the work profile. It can't access or scan files in the user's personal profile.

To enable non-APK file scanning, create a **Managed devices** app configuration policy.

> [!NOTE]
> Before you create the policy, add and approve the Microsoft Defender Antivirus app from the managed Google Play store and sync it to Intune. If no Android apps are synced from managed Google Play, the target app list is empty and you see the message "You have not added any Android apps from the managed Google Play store." For deployment steps, see [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](/intune/intune-service/protect/microsoft-defender-deploy-android).

For the full procedure, see <a href="/intune/app-management/configuration/configure-managed-android#create-an-app-configuration-policy" target="_blank">Create an app configuration policy</a> (opens in a new tab in the Intune documentation). When you create the policy, use these settings:

- **Basics** tab: Configure the following settings:
  - **Platform**: Select **Android Enterprise**.
  - **Profile type**: Select one of the following values:
    - **All Profile Types**: Applies the policy to all supported enrollment types.
    - **Fully Managed, Dedicated, and Corporate-Owned Work Profile Only**: For COPE and COBO devices.
    - **Personally-Owned Work Profile Only**: For BYOD devices.
  - **Target app**: Select **Select app**, find and select **Microsoft Defender Antivirus**, and then select **OK**.
- **Settings** tab: Configure the following settings in the **Configuration settings** section:
  1. **Configuration settings format**: Select **Use configuration designer**, and then select **Add**.
  1. In the flyout that opens, use the search box to find **APK**, select **\[Preview\] Enable non-APK file scan in Microsoft Defender** from the results, and then select **OK**.
  1. Back on the **Settings** tab, hover over **Configuration value** in the **\[Preview\] Enable non-APK file scan in Microsoft Defender** entry, and set **Configuration value** to `1` (the default value is `0`).

To confirm the policy is applied, verify that **EnableNonAPKFileScan** is present and set to `1` on the target device.

When Defender for Endpoint detects malware in a non-APK file, the user receives a notification that the device is at risk, and an alert appears in the [Microsoft Defender portal](https://security.microsoft.com). Security teams investigate and remediate the threat by using the same malware alert experience as other Defender for Endpoint detections.

## Configure privacy for phishing alert report

Privacy control for phish report can be used to disable the collection of domain name or website information in the phish threat report. This setting gives organizations the flexibility to choose whether they want to collect the domain name when a malicious or phish website is detected and blocked by Defender for Endpoint.

### Configure privacy for phishing alert report on Android Enterprise work profile

Use the following steps to turn on privacy for targeted users in the work profile:

1. In [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431) and go to **Apps** > **App configuration policies** > **Add** > **Managed devices**.
1. Give the policy a name, **Platform > Android Enterprise**, select the profile type.
1. Select **Microsoft Defender for Endpoint** as the target app.
1. In Settings page, select **Use configuration designer** and add **DefenderExcludeURLInReport** as the key and value type as **Integer**.

   Enter **1 to enable privacy**. The default value is 0.

1. Select **Next** and assign this profile to targeted devices/users.

Turning the above privacy controls on or off won't affect the device compliance check or conditional access.

## Configure privacy for malware threat report

Privacy control for malware threat report can be used to disable the collection of app details (name and package information) from the malware threat report. This setting gives organizations the flexibility to choose whether they want to collect the app name when a malicious app is detected.

### Configure privacy for malware alert report on Android Enterprise work profile

Use the following steps to turn on privacy for targeted users in the work profile:

1. In [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431) and go to **Apps** > **App configuration policies** > **Add** > **Managed devices**.
1. Give the policy a name, **Platform > Android Enterprise**, select the profile type.
1. Select **Microsoft Defender for Endpoint** as the target app.
1. In Settings page, select **Use configuration designer** and add **DefenderExcludeAppInReport** as the key and value type as **Integer**

   Enter **1 to enable privacy**. The default value is 0.

1. Select **Next** and assign this profile to targeted devices/users.

Using this privacy control won't affect the device compliance check or conditional access. For example, devices with a malicious app will always have a risk level of "Medium".

## Disable sign out

Defender for Endpoint supports deployment without the sign out button in the app to prevent users from signing out of the Defender app. This is important to prevent users from tampering with the device.
Use the following steps to configure Disable out sign:

1. In [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), go to **Apps** > **App configuration policies** > **Add** > **Managed devices**.
1. Give the policy a name, select **Platform > Android Enterprise**, and select the profile type.
1. Select **Microsoft Defender for Endpoint** as the target app.
1. In the Settings page, select **Use configuration designer** and add **Disable Sign Out** as the key and **Integer** as the value type.

   - By default, Disable Sign Out = 1 for Android Enterprise personally owned work profiles, fully managed, company owned personally enabled profiles.

   - Admins need to make Disable Sign Out = 0 to enable the sign out button in the app. Users are able to see the sign out button once the policy is pushed.

1. Select **Next** and assign this profile to targeted devices and users.

<a name="device-tagging"></a>

## Configure device tagging

Defender for Endpoint on Android enables bulk tagging the mobile devices during onboarding by allowing the admins to set up tags via Intune. Admin can configure the device tags through Intune via configuration policies and push them to user's devices. Once the User installs and activates Defender, the client app passes the device tags to the Security Portal. The Device tags appear against the devices in the Device Inventory. 

Use the following steps to configure the Device tags:

1. In [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), go to **Apps** > **App configuration policies** > **Add** > **Managed devices**.
1. Give the policy a name, select **Platform > Android Enterprise**, and select the profile type.
1. Select **Microsoft Defender for Endpoint** as the target app.
1. In Settings page, select Use configuration designer and add **DefenderDeviceTag** as the key and value type as **String**.

   - Admin can assign a new tag by adding the key **DefenderDeviceTag** and setting a value for device tag.
   - Admin can edit an existing tag by modifying the value of the key **DefenderDeviceTag**.
   - Admin can delete an existing tag by removing the key **DefenderDeviceTag**.

1. Select Next and assign this policy to targeted devices and users.

> [!NOTE]
> The Defender app needs to be opened for tags to be synced with Intune and passed to Security Portal. It might take up to 18 hours for tags to reflect in the portal.

<a name="related-articles"></a>
## Related content

- [Overview of Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md)
- [Configure Dynamic Preview Rings for Microsoft Defender on mobile](mobile-dynamic-preview-rings-configure.md)
- [Android Mobile Threat Defense (MTD) Role for Microsoft Defender for Endpoint](android-mobile-threat-defense-role.md)
- <a href="/intune/intune-service/protect/microsoft-defender-deploy-android" target="_blank" rel="noopener noreferrer">Microsoft Intune: Deploy and configure Microsoft Defender for Endpoint on Android</a>
