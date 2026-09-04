---
title: Configure Microsoft Defender for Endpoint on Android
description: Learn how to configure protection, privacy, file scanning, and device tagging for Microsoft Defender for Endpoint on Android by using Microsoft Intune.
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
ms.date: 08/26/2026
appliesto:
   - Microsoft Defender for Endpoint Plan 1
   - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#customer intent: As a security administrator, I want to configure Defender for Endpoint features on Android devices so that I can protect devices and control the security data they report.
---

# Configure Microsoft Defender for Endpoint features on Android

Security administrators can use Microsoft Intune to configure risk-based Conditional Access, custom indicators, web and network protection, privacy controls, vulnerability assessment, file scanning, sign-out controls, and device tags for Microsoft Defender for Endpoint on Android. Before you configure these features, deploy and onboard Defender for Endpoint on the Android devices you manage.

Microsoft Intune is a separate product that isn't included with every Defender for Endpoint subscription. You need a subscription that includes Intune, or you can buy Intune as a standalone subscription or add-on. For more information, see [Microsoft Intune licensing](/intune/intune-service/fundamentals/licenses).

## Conditional Access with Defender for Endpoint on Android

Microsoft Defender for Endpoint on Android works with Microsoft Intune and Microsoft Entra ID to enforce device compliance and Conditional Access policies based on device risk levels. Defender for Endpoint is a mobile threat defense (MTD) solution that you can deploy through Intune.

For more information about how to set up Defender for Endpoint on Android and Conditional Access, see [Defender for Endpoint and Intune](/intune/intune-service/protect/advanced-threat-protection).

## Configure custom indicators

Defender for Endpoint on Android supports custom indicators with some platform-specific limitations.

> [!NOTE]
> Defender for Endpoint on Android supports creating custom indicators only for URLs and domains. IP-based custom indicators aren't supported on Android.
>
> IP address `245.245.0.1` is an internal Defender IP address. Don't include it in custom indicators because doing so can cause functionality issues.
>
> Alerts for custom indicators are currently not supported for Defender for Endpoint on Android.

For information about configuring custom indicators, see [Overview of indicators](indicators-overview.md).

## Configure web protection

> [!NOTE]
> Defender for Endpoint on Android uses a local loopback virtual private network (VPN) to provide web protection. The VPN doesn't route traffic outside the device.
>
> For more information, see [Configure web protection on devices that run Android](/intune/intune-service/protect/advanced-threat-protection-manage-android).

IT administrators can configure web protection in the Microsoft Intune admin center.

[Web protection](web-protection-overview.md) helps secure devices against web threats and protect users from phishing attacks. Web content filtering, which is a separate web protection capability, is currently not supported on mobile platforms.

## Create a Managed devices app configuration policy

The Defender settings in the following sections use an Android Enterprise **Managed devices** app configuration policy in Intune. You can add multiple Defender configuration keys to one policy when the keys apply to the same profile type and assignments. Create separate policies when you need to target different profiles, users, or devices.

Before you create the policy, add and approve **Defender: Antivirus** from Managed Google Play, and then sync it to Intune. After the sync, the app appears in Intune as **Microsoft Defender: Antivirus**. For deployment instructions, see [Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune](/intune/device-security/microsoft-defender/deploy-android).

For the complete procedure to create a **Managed devices** app configuration policy in Intune, see <a href="/intune/app-management/configuration/configure-managed-android#create-an-app-configuration-policy" target="_blank">Create an app configuration policy</a> (opens in a new tab in the Intune documentation). When creating the policy, always start with these settings:

- **Basics** tab: Configure the following settings:
  - **Platform**: Select **Android Enterprise**.
  - **Profile type**: Select one of the following values:
    - **All Profile Types**: Applies the policy to all supported enrollment types. You can't associate an Intune certificate profile with the app configuration policy.
    - **Fully Managed, Dedicated, and Corporate-Owned Work Profile Only**: Applies the policy to corporate-owned, personally enabled (COPE) and corporate-owned, business-only (COBO) devices.
    - **Personally-Owned Work Profile Only**: Applies the policy to bring-your-own-device (BYOD) work profiles.
  - **Targeted app**: Select **Select app**, select **Microsoft Defender: Antivirus**, and then select **OK**.
- **Settings** tab: Select **Use configuration designer** for **Configuration settings format**, and then select **Add**.
  - In the flyout that opens, select the configuration keys specified in the applicable sections of this article, and then select **OK**.
  - Configure the value for each key, and then complete the assignments and create the policy as described in the Intune procedure.

<a name="network-protection"></a>

## Configure network protection

Network protection detects threats from rogue Wi-Fi networks and certificates. Security administrators can list trusted root certification authority (CA) and self-signed certificates in the Microsoft Intune admin center to establish trust with endpoints. Network protection guides users to connect to secure networks and notifies them when it detects a related threat.

Network protection includes controls for configuring the feature and adding trusted certificates in the Microsoft Intune admin center. Security administrators can enable [privacy controls](#privacy-controls-overview) to configure the data sent to Defender for Endpoint from Android devices.

Network protection in Defender for Endpoint is enabled by default. Use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy), and add the following configuration keys:

- **Enable Network Protection in Microsoft Defender**: When you add this key, its default **Configuration value** is `0`, which disables network protection. To enable network protection, change the value to `1`.

  > [!IMPORTANT]
  > The remaining network protection configuration keys in this section take effect only when **Enable Network Protection in Microsoft Defender** is added to the policy and set to `1`.

- **Trusted CA certificate list for Network Protection**: If your organization uses private root certification authorities (CAs), establish explicit trust between Intune, the mobile device management (MDM) solution, and user devices. Establishing trust helps prevent Defender from flagging the root CAs as rogue certificates.
  - **Value type**: Keep the default value **String** to enter the certificate thumbprints directly.
  - **Configuration value**: Add a comma-separated list of Secure Hash Algorithm 1 (SHA-1) certificate thumbprints in one of the following formats:
    - `50 30 06 09 1d 97 d4 f5 ae 39 f7 cb e7 92 7d 7d 65 2d 34 31`
    - `503006091d97d4f5ae39f7cbe7927d7d652d3431`

    For example, `50 30 06 09 1d 97 d4 f5 ae 39 f7 cb e7 92 7d 7d 65 2d 34 31, 503006091d97d4f5ae39f7cbe7927d7d652d3431`. Any other separation characters in the certificate thumbprint (for example, `:`) are invalid.

- **Enable Network Protection Privacy**: Enables or disables privacy in network protection.
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Enable (default)
    - `0`: Disable

- **Enable Users to Trust Networks and Certificates**: Allows or prevents users from trusting or removing trust from unsecured networks and malicious certificates in the app.
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Enable
    - `0`: Disable (default)

- **Automatic Remediation of Network Protection Alerts**: Enables or disables remediation alerts when users take remediation actions. For example, a user switches to a safer Wi-Fi access point or deletes a suspicious certificate detected by Defender. This setting applies only to alerts and doesn't affect device timeline events. It doesn't apply to the detection of open Wi-Fi networks or self-signed certificates.
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Enable (default)
    - `0`: Disable

- **Manage Network Protection detection for Open Networks**: Enables or disables open network detection.
  - **Value type**: Integer
  - **Configuration values**:
    - `2`: Enable (default)
    - `1`: Audit mode
    - `0`: Disable

- **Manage Network protection Detection for Certificates**: In audit mode, events are sent to security operations center (SOC) administrators, but users don't receive notifications when Defender detects a malicious certificate. Set the value to `2` to enable full functionality. When the value is `2`, users receive notifications, and events are sent to SOC administrators when Defender detects a malicious certificate.
  - **Value type**: Integer
  - **Configuration values**:
    - `2`: Enable
    - `1`: Audit mode
    - `0`: Disable (default)

> [!NOTE]
>
> - For comprehensive protection against Wi-Fi threats, users should grant location permission and select **Allow all the time** during onboarding. If users select **While using the app** or deny permission, Defender for Endpoint protects against rogue certificates but can't detect threats on open or suspicious Wi-Fi networks. For more information, see [Complete device onboarding](/intune/device-security/microsoft-defender/deploy-android#complete-device-onboarding).
>
> - Starting in May 2025, the Microsoft Defender portal no longer generates alerts when mobile devices connect to or disconnect from an open wireless network, or when users download, install, or delete self-signed certificates. Instead, these activities generate events that are available in the device timeline. The updated experience includes the following changes:
>   - For these changes to take effect, users must update to the version of Defender for Endpoint on Android released in mid-May 2025 or later. Otherwise, the previous alert experience remains in place. If an administrator enables the automatic remediation key, old alerts are resolved automatically after the changes take effect.
>   - When a user connects to or disconnects from an open wireless network multiple times in the same 24-hour period, only one connection event and one disconnection event are generated during that period and sent to the device timeline.
>   - **Enable Users to Trust Networks**: After the update, connection and disconnection events for open wireless networks, including trusted networks, are sent to the device timeline.
>   - **User allowlisted certificates**: After the update, events for downloading, installing, or deleting self-signed certificates, including user-trusted certificates, are sent to the device timeline.
>   - The previous alert experience for these activities continues to apply to GCC tenants.

<a name="privacy-controls"></a>

<a name="configure-privacy-controls"></a>

## Privacy controls overview

Privacy controls let security administrators limit which threat details Defender for Endpoint sends from Android devices:

- **Malware reports**: When privacy is enabled, Defender for Endpoint doesn't send the malicious app name or other app details in malware alert reports. For configuration instructions, see [Configure privacy for malware threat reports](#configure-privacy-for-malware-threat-report).
- **Phishing reports**: When privacy is enabled, Defender for Endpoint doesn't send the domain name or unsafe website details in phishing alert reports. For configuration instructions, see [Configure privacy for phishing alert reports](#configure-privacy-for-phishing-alert-report).
- **Vulnerability assessment of apps**: By default, Defender for Endpoint sends the list of apps installed in the work profile for vulnerability assessment. Security administrators can enable privacy to prevent this app inventory from being sent. For configuration instructions, see [Configure app inventory privacy for an Android Enterprise work profile](#configure-app-inventory-privacy-for-an-android-enterprise-work-profile).
- **Network protection**: When privacy is enabled, Defender for Endpoint doesn't send network details. For configuration instructions, see [Configure privacy alert reports](#configure-privacy-alert-report).

**Prerequisite**: Install Company Portal version 5.0.6621.0 (June 2025) or later.

### Configure privacy alert report

Security administrators can enable privacy controls for phishing and malware reports sent by Defender for Endpoint on Android. When Defender detects a corresponding threat, these controls prevent domain or app details from being sent in the alert.

Use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy), and add one or both of the following configuration keys:

- **Hide URLs in report**:
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Hide domain and website details in phishing alert reports.
    - `0`: Include domain and website details in phishing alert reports (default).

- **Hide app details in report**:
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Hide app names and package information in malware alert reports.
    - `0`: Include app names and package information in malware alert reports (default).

### End-user privacy controls

End-user privacy controls let users choose which threat details Defender for Endpoint shares with their organization. Availability depends on the Android Enterprise profile:

- **Work profile**: End-user privacy controls aren't available. Security administrators control the information shared from the work profile.
- **Personal profile**: End-user privacy controls appear under **Settings** \> **Privacy** in the Defender app. For information about supported work and personal profile configurations, see [Supported Android enrollment scenarios](mtd.md#supported-android-enrollment-scenarios).

When a security administrator enables the corresponding privacy setting, users can configure the following controls:

- **Unsafe site information**: Controls whether Defender sends domain and website details in phishing alert reports. For the administrator setting, see [Configure privacy for phishing alert reports](#configure-privacy-for-phishing-alert-report).
- **Malicious applications**: Controls whether Defender sends app names and package information in malware alert reports. For the administrator setting, see [Configure privacy for malware threat reports](#configure-privacy-for-malware-threat-report).
- **Network protection**: Controls whether Defender sends network and certificate details in network protection reports. For the administrator setting, see [Configure network protection](#configure-network-protection).

Changing these privacy controls doesn't affect device compliance checks or [Conditional Access](#conditional-access-with-defender-for-endpoint-on-android).

<a name="configure-vulnerability-assessment-of-apps-for-byod-devices"></a>

## Configure app vulnerability assessment for personally owned devices

Starting with Defender for Endpoint on Android version 1.0.3425.0303 (October 2021), Microsoft Defender Vulnerability Management can assess the operating system (OS) and apps installed on onboarded mobile devices.

> [!NOTE]
> Vulnerability assessment is part of [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) in Microsoft Defender for Endpoint.

The apps included in vulnerability assessment depend on how the personally owned device is managed:

- **Android Enterprise personally owned devices with a work profile**: Defender for Endpoint assesses only apps installed in the work profile. It can't access apps in the personal profile.
- **Device administrator mode**: Vulnerability assessment of apps isn't enabled by default. Security administrators can enable the feature through Microsoft Intune to collect the list of apps installed on the device.

For more information about the Android Enterprise management modes that Defender for Endpoint supports, see [Supported Android enrollment scenarios](mtd.md#supported-android-enrollment-scenarios).

<a name="configure-privacy-for-android-enterprise-work-profile"></a>

<a name="configure-app-inventory-privacy-for-an-android-enterprise-work-profile"></a>

By default, Defender for Endpoint sends the list of apps in the work profile to Microsoft Defender Vulnerability Management for assessment. To prevent this app inventory from being sent for targeted users, use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy) with **Personally-Owned Work Profile Only** as the profile type. Add the following configuration key:

- **Enable TVM Privacy**:
  - **Value type**: Integer
  - **Configuration values**:
    - `0`: Send the work profile app inventory for vulnerability assessment (default).
    - `1`: Don't send the work profile app inventory for vulnerability assessment.

This privacy setting doesn't affect device compliance checks or Conditional Access.

## Configure non-APK file scanning

In addition to scanning Android application packages (APK files), Defender for Endpoint on Android can scan non-APK files, such as documents, compressed archives, and scripts, that users download, receive, or store on the device. This capability extends malware protection to more file types.

Non-APK file scanning is supported on enrolled devices in the following management scenarios:

- Personally owned devices with a work profile (BYOD)
- Corporate-owned devices with a work profile (COPE)
- Corporate-owned, fully managed devices (COBO)

> [!NOTE]
> Defender for Endpoint respects Android profile boundaries. On a device with a work profile, Defender scans only files in the work profile. It can't access or scan files in the user's personal profile.

To enable non-APK file scanning, use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy), and add the following configuration key:

- **\[Preview\] Enable non-APK file scan in Microsoft Defender**:
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Enable non-APK file scanning.
    - `0`: Disable non-APK file scanning (default).

To confirm the policy is applied, verify that **EnableNonAPKFileScan** is present and set to `1` on the target device.

When Defender for Endpoint detects malware in a non-APK file, the user receives a notification that the device is at risk, and an alert appears in the [Microsoft Defender portal](https://security.microsoft.com). Security teams investigate and remediate the threat by using the same malware alert experience as other Defender for Endpoint detections.

## Configure privacy for phishing alert report

The privacy control for phishing reports can disable the collection of domain names and website information in phishing threat reports. Use this setting to choose whether Defender for Endpoint collects the domain name when it detects and blocks a malicious or phishing website.

<a name="configure-privacy-for-phishing-alert-report-on-android-enterprise-work-profile"></a>

To turn on privacy for targeted users in the work profile, use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy), and add the following configuration key:

- **DefenderExcludeURLInReport**:
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Enable privacy.
    - `0`: Disable privacy (default).

Turning this privacy control on or off doesn't affect the device compliance check or Conditional Access.

## Configure privacy for malware threat report

The privacy control for malware threat reports can disable the collection of app details, including name and package information, from malware threat reports. Use this setting to choose whether Defender for Endpoint collects the app name when it detects a malicious app.

<a name="configure-privacy-for-malware-alert-report-on-android-enterprise-work-profile"></a>

To turn on privacy for targeted users in the work profile, use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy), and add the following configuration key:

- **DefenderExcludeAppInReport**:
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Enable privacy.
    - `0`: Disable privacy (default).

Using this privacy control doesn't affect the device compliance check or Conditional Access. For example, devices with a malicious app always have a risk level of **Medium**.

## Disable sign out

Defender for Endpoint supports deployment without the sign out button in the app. Hiding the button helps prevent users from tampering with the device. Use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy), and add the following configuration key:

- **Disable Sign Out**:
  - **Value type**: Integer
  - **Configuration values**:
    - `1`: Hide the sign out button. This value is the default for Android Enterprise personally owned work profiles, fully managed devices, and corporate-owned devices with a work profile.
    - `0`: Show the sign out button.

<a name="device-tagging"></a>

## Configure device tagging

Defender for Endpoint on Android supports bulk tagging of mobile devices during onboarding. Security administrators configure device tags through Intune app configuration policies and deploy them to users' devices. After users install and activate Defender, the client app sends the device tags to the Microsoft Defender portal. The tags appear with the devices in the device inventory.

To configure device tags, use the [Managed devices app configuration policy procedure](#create-a-managed-devices-app-configuration-policy), and add the following configuration key:

- **DefenderDeviceTag**:
  - **Value type**: String
  - **Configuration value**:
    - To assign a new tag, enter a value for the device tag.
    - To edit an existing tag, change the value.
    - To delete an existing tag, remove the configuration key from the policy.

> [!NOTE]
> Users must open the Defender app before tags can sync with Intune and pass to the Microsoft Defender portal. Tags might take up to 18 hours to appear in the portal.

<a name="related-articles"></a>

## Related content

- [Overview of Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md)
- [Configure Dynamic Preview Rings for Microsoft Defender on mobile](mobile-dynamic-preview-rings-configure.md)
- [Android Mobile Threat Defense (MTD) Role for Microsoft Defender for Endpoint](android-mobile-threat-defense-role.md)
- <a href="/intune/intune-service/protect/microsoft-defender-deploy-android" target="_blank" rel="noopener noreferrer">Microsoft Intune: Deploy and configure Microsoft Defender for Endpoint on Android</a>
