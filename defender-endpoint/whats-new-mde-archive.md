---
title: What's new in Microsoft Defender for Endpoint archive
description: See what features were available for Microsoft Defender for Endpoint in past releases.
ms.service: defender-endpoint
ms.subservice: reference
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.date: 02/18/2026
ai-usage: ai-assisted
ms.collection:
- m365-security
- tier1
ms.topic: whats-new
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# What's new in Microsoft Defender for Endpoint archive


The following features were in preview or generally available (GA) in Microsoft Defender for Endpoint in past releases.

For more information on preview features, see [Preview features](/defender-xdr/preview).

For more information on what's new with Microsoft Defender for Endpoint on Windows, see:
[What's new in Microsoft Defender for Endpoint on Windows](microsoft-defender-endpoint-releases.md#windows-releases)

For more information on what's new with other Microsoft Defender security products, see:

- [What's new in Microsoft Defender XDR](/defender-xdr/whats-new)
- [What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)

For more information on Microsoft Defender for Endpoint on specific operating systems, see [Microsoft Defender for Endpoint release notes](microsoft-defender-endpoint-releases.md).

## August 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8018.0103 |GA |Build 1.0.8018.0103 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#android--august-2025--platform-1080180103). |
|macOS |Build 101.25062.0006 |GA |Release version 20.125062.6.0 released: See [enhancements and features for this release](release-notes-mde-archive.md#macos--august-2025--101250620006). |
|macOS |[Behavior Monitoring](behavior-monitor-macos.md) |GA |Defender for Endpoint can now monitor process behavior to detect and analyze potential threats based on the behavior of the applications, daemons, and files within the system. Learn more: [Behavior Monitoring in Microsoft Defender for Endpoint on macOS](behavior-monitor-macos.md) and [Behavior Monitoring GA announcement blog](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/behavior-monitoring-is-now-generally-available-for-microsoft-defender-for-endpoi/4415697). |
|Linux |Build 101.25062.0003 |GA |Release version 30.125062.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--august-2025--platform-101250620003). |
|iOS |Build 1.1.68140102 |GA |Build 1.1.68140102 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#ios--august-2025--platform-1168140102). |

## July 2025

- Azure Stack HCI OS support (version 23H2 and later) - Preview. Added support for Azure Stack HCI OS, version 23H2 and later. Support for Azure Stack HCI OS is rolling out across commercial and government clouds.

- [Microsoft Defender Core service](microsoft-defender-core-service-overview.md) - GA. Microsoft Defender Core service helps with the stability and performance of Microsoft Defender Antivirus.

## May 2025

- **(Android)** Alerts for activities related to open wireless connection and certificates are now detected as events. Starting May 19, 2025, connecting or disconnecting to open wireless networks and download/installation/removal of self-signed certificates appear as events in the Timeline tab instead of alerts. For more information, see [Network protection](android-configure.md#network-protection).

- **(iOS)** Alerts for activities related to open wireless connections are now detected as events. Starting May 19, 2025, when a user connects to an open wireless network on a mobile device, an alert is no longer generated on the Microsoft Defender portal. Instead, this activity is added as an event and viewable under the device timeline. For more information, see [Configure network protection](ios-configure-features.md#configure-network-protection).

## April 2025

- [Contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices) - Preview. Containing an IP address prevents attackers from spreading attacks to other noncompromised devices.

- Attack Surface Reduction (ASR) Rules - GA. Two new ASR rules are now generally available: Block rebooting machine in Safe Mode; Block use of copied or impersonated system tools.

- **(Linux)** ARM64-based Linux server support - GA. Defender for Endpoint now supports ARM64-based Linux servers on Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux. For more information, see [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md).

- **(Android)** Deploy Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks. For more information, see [Deploy Defender for Endpoint prerelease builds on Android devices](mobile-pretest-android.md).

## March 2025

- **(iOS)** Improving usability: Key updates to the Microsoft Defender app interface on iOS. The new **Device Protection** feature card for enterprise users includes Web Protection, Device Health, and Jailbreak features with recommendation cards and a tile view. For more information, see [User Experience in Microsoft Defender for Endpoint on iOS](ios-new-ux.md).

## February 2025

- [Aggregated reporting in Microsoft Defender for Endpoint](aggregated-reporting.md) - GA. Aggregated reporting extends signal reporting intervals to significantly reduce the size of reported events while preserving essential event properties.

- **(Android)** Defender for Endpoint on Android now supports Android 10 as the minimum version. Support for Android 8, 8.1, and 9 ends on April 30, 2025. Moving forward, only devices running Android 10 and later are supported.

- **(Android)** Open Wi-Fi Detection update: A caching behavior is implemented so that if a user reconnects to the same open Wi-Fi network within seven days, another alert isn't raised. Alerts for different open Wi-Fi networks are still generated immediately.

- **(iOS)** Open Wi-Fi Detection update: A caching behavior is implemented so that if a user reconnects to the same open Wi-Fi network within seven days, another alert isn't raised. Alerts for different open Wi-Fi networks are still generated immediately.

## January 2025

- **(Android)** New dashboard with recommendation cards for alerts and feature tiles. The updated dashboard prominently displays active alerts and presents features in tile form for easier navigation. For more information, see [What's new in Defender for Endpoint on Android](microsoft-defender-endpoint-releases.md#android-releases).

- **(iOS)** New dashboard with recommendation cards for alerts and feature tiles. The updated dashboard prominently displays active alerts and presents features in tile form for easier navigation. For more information, see [What's new in Defender for Endpoint on iOS](microsoft-defender-endpoint-releases.md#ios-releases).

- **(iOS)** Defender for Endpoint on iOS now supports iOS/iPadOS 16.x as the minimum version. Support for iOS/iPadOS 15 ends on January 31, 2025.

- **(iOS)** User enrollment support. Microsoft Defender for Endpoint iOS can now be deployed on Intune User Enrolled devices. For more information, see [User Enrollment setup](ios-install.md#user-enrollment-setup-only-for-intune-user-enrolled-devices).

## November-December 2024

- New demonstration scenarios - GA. Five new demonstration scenarios are available: [AMSI demos](mde-demonstration-amsi.md), [Cloud protection demo](defender-endpoint-demonstration-cloud-delivered-protection.md), [Controlled folder access (block ransomware) demo](defender-endpoint-demonstration-controlled-folder-access.md), [Endpoint detection and response (EDR) detection test](edr-detection.md), [URL reputation (SmartScreen) demo](defender-endpoint-demonstration-smartscreen-url-reputation.md).

## December 2024

- **(Android)** Android low-touch onboarding is now generally available. Low-touch onboarding simplifies setup on Android devices by supporting silent sign-on and autogranting certain permissions, so users only need to grant the necessary permissions to onboard. It supports Android Enterprise BYOD, COPE, and fully managed profiles. For configuration details, see [Android low-touch onboarding](android-intune.md).

> [!IMPORTANT]
> **Ending support for device administrator enrolled devices**: Microsoft Intune and Defender for Endpoint are ending support for device administrator enrolled devices with access to [Google Mobile Services](/intune/intune-service/apps/manage-without-gms) (GMS), beginning December 31, 2024. After support ends, Intune and Defender for Endpoint won't make changes or updates to Android device administrator management for devices with access to GMS, and technical support will no longer be available. For more information, see [Tech Community blog: Intune ending support for Android device administrator on devices with GMS in December 2024](https://techcommunity.microsoft.com/blog/intunecustomersuccess/intune-ending-support-for-android-device-administrator-on-devices-with-gms-in-de/3915443).

## August 2024

- **(Android)** Network protection is now generally available and enabled by default for all users (version 1.0.6812.0101). Network protection provides protection against rogue Wi-Fi related threats, rogue hardware like pineapple devices, and rogue certificates. Users see a network protection card in the Defender for Endpoint app and are required to provide location permission to complete setup. Administrators can change the default value via Intune App Configuration policies. For more information, see [Network protection on Android](android-configure.md).

## July 2024

- Monitor OT devices in the device inventory - Preview. You can now monitor OT devices in addition to IoT devices in the device inventory, as part of the integration with [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/device-discovery). For more information, see [Device inventory](machines-view-overview.md).

- Learning hub resources moved - GA. Learning hub resources have moved from the Microsoft Defender portal to [learn.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2273118).

- **(iOS)** Device tagging is now generally available. Administrators can configure device tags through Intune via configuration policies and push them to user's devices. For more information, see [Configure Device Tagging](ios-configure-features.md#device-tagging).

- **(iOS)** Vulnerability assessment of apps on iOS is now generally available for enrolled (MDM) devices. For more information, see [Configure vulnerability assessment of apps](ios-configure-features.md#configure-vulnerability-assessment-of-apps).

- **(iOS)** Network protection on iOS is now generally available and enabled by default for all users. Users see a Network Protection card in the Defender for Endpoint iOS app. Administrators can change the default value via Intune App Configuration policies. For more information, see [Configure Network Protection](ios-configure-features.md#configure-network-protection).

- **(iOS)** Privacy controls are now available for both administrators and end users on enrolled (MDM) and unenrolled (MAM) devices. Administrators can configure the privacy in the phish alert report, and end users can configure the information shared to their organization.

- **(iOS)** Optional permissions and the ability to disable web protection are now available. Administrators can deploy Defender for Endpoint on BYOD devices without enforcing the mandatory VPN permission during onboarding. End users can onboard without mandatory permissions and review them later. Customers who don't want to set up a VPN can disable web protection and deploy Defender for Endpoint without that feature.

- **(iOS)** Integration with Microsoft Tunnel. Defender for Endpoint on iOS can now integrate with Microsoft Tunnel, a VPN gateway solution, to enable security and connectivity in a single app.

- **(iOS)** Improved experience on supervised iOS devices. Defender for Endpoint on iOS has specialized ability on supervised devices and can provide Web Protection without setting up a local VPN on the device. For more information, see [Complete deployment for supervised devices](ios-install.md#complete-deployment-for-supervised-devices).

- **(iOS)** The Microsoft Defender for Endpoint app is now available as **Microsoft Defender** in the App Store. With this update, the app is available as preview for consumers in the US region.

- **(iOS)** Vulnerability management on Android and iOS is now generally available. For more information, see [Announcing general availability of vulnerability management](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-general-availability-of-vulnerability-management/ba-p/3071663).

## December 2022

- Microsoft Defender for Endpoint Device control removable storage access control updates:

    1. Microsoft Intune support for removable storage access control is now available. See [Deploy and manage device control with Intune](device-control-deploy-manage-intune.md).

    2. The new default enforcement policy of removable storage access control is designed for all device control features. Printer Protection is now available for this policy. If you create a Default Deny policy, printers are blocked in your organization.

        - Intune: *./Vendor/MSFT/Defender/Configuration/DefaultEnforcement* <br> See [Deploy and manage device control using Intune](device-control-deploy-manage-intune.md)

        - Group policy: *Computer Configuration > Administrative Templates > Windows Components > Microsoft Defender Antivirus > Features > Device Control > Select Device Control Default Enforcement*<br> See [Deploy and manage device control with Group Policy](device-control-deploy-manage-gpo.md)

- Microsoft Defender for Endpoint Device control New Printer Protection solution to manage printer is now available. For more information, see [Device control policies](device-control-policies.md).

- **(Android)** Mobile device tagging is now generally available. This feature enables bulk tagging of mobile devices by allowing administrators to set up tags via Intune configuration policies and push them to user's devices. Once the user installs and activates Defender, the client app passes the device tags to the Security Portal, where they appear in the Device Inventory. This configuration is available for both enrolled (MDM) and unenrolled (MAM) devices. For more information, see [Device Tagging (MDM)](android-configure.md#device-tagging) and [Device Tagging (MAM)](android-configure-mam.md#device-tagging).

- **(Android)** The Microsoft Defender for Endpoint app is now available as **Microsoft Defender** in the Play Store. With this update, the app is available as preview for consumers in the US region. Based on how you sign in with your work or personal account, you have access to features for Microsoft Defender for Endpoint or for Microsoft Defender for individuals. For more information, see [Microsoft Defender for individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals).

- **(Android)** Microsoft Defender is no longer supported for versions 1.0.3011.0302 or earlier. Users should upgrade to the latest version to keep their devices secure.

## November 2022

- [Built-in protection](built-in-protection.md) is now generally available. Built-in protection helps protect your organization from ransomware and other threats with default settings that help ensure that your devices are protected.

## October 2022

[Network protection C2 detection and remediation is now generally available](network-protection.md#block-command-and-control-attacks). <br/>Attackers often compromise existing internet-connected servers to become their command and control servers. Attackers can use the compromised servers to hide malicious traffic and deploy malicious bots that are used to infect endpoints. Network protection detection and remediation help improve the time it takes for the security operations (SecOps) teams to pinpoint and respond to malicious network threats that are looking to compromise endpoints.

- **(Android)** Defender for Endpoint is now generally available on Android Enterprise COPE (company-owned personally enabled) devices. Enterprises can onboard COPE devices and push Defender for Endpoint to user's devices through the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431). COPE devices get full capabilities including phishing and web protection, malware scanning, network protection (preview), and breach prevention through integration with Microsoft Intune and Conditional Access. For more information, see [Tech Community Blog: Defender for Endpoint is now available on Android corporate-owned personally enabled devices](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/microsoft-defender-for-endpoint-is-now-available-on-android/ba-p/3626100).

## September 2022

- [Attack surface reduction rules report now available in the Microsoft Defender portal](attack-surface-reduction-rules-report.md). <br/>The attack surface reduction rules report is now available in the Microsoft Defender portal. This ASR report provides information about the attack surface reduction rules that are applied to devices in your organization and helps you detect threats, block potential threats, and get visibility into ASR and device configuration.

- [Built-in protection](built-in-protection.md) (preview) is rolling out. Built-in protection is a set of default settings, such as tamper protection turned on, to help protect devices from ransomware and other threats.

- [Device health reporting is now generally available](device-health-reports.md). <br/>The device health report provides information about the health and security of your endpoints. The report includes trending information showing the sensor health state, antivirus status, OS platforms, Windows 10 versions, and Microsoft Defender Antivirus update versions.

- [Device health reporting is now available for US Government customers using Defender for Endpoint](device-health-reports.md). <br/>Device health reporting is now available for GCC, GCC High, and DoD customers.

- [Troubleshooting mode](enable-troubleshooting-mode.md) is now available for more Windows operating systems, including Windows Server 2012 R2 and higher. For more information about the required updates, see [Troubleshooting mode](enable-troubleshooting-mode.md).

- **(Android)** Privacy controls are now available for both administrators and end users on enrolled (MDM) and unenrolled (MAM) devices. Administrators can configure privacy in the alert report, and end users can configure the information shared to their organization. For more information, see [Privacy controls (MDM)](android-configure.md#privacy-controls) and [Privacy controls (MAM)](android-configure-mam.md#configure-privacy-controls).

- **(Android)** Optional permissions are now available in the onboarding flow for unenrolled (MAM) devices. Administrators can deploy Defender for Endpoint without enforcing the mandatory VPN and Accessibility permissions during onboarding. End users can onboard without these permissions and review them later. For more information, see [Optional permissions](android-configure-mam.md#optional-permissions).

## August 2022

- [Device health status](investigate-machines.md#device-health-status)<br>The Device health status card shows a summarized health report for the specific device.

- [Device health reporting (Preview)](device-health-reports.md)<br> The devices status report provides high-level information about the devices in your organization. The report includes trending information showing the sensor health state, antivirus status, OS platforms, and Windows 10 versions.

- [Tamper protection on macOS is now generally available](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/tamper-protection-on-macOS-is-now-generally-available/ba-p/3595422)<br> This feature is released with audit mode enabled by default, and you can decide whether to enforce (block) or turn off the capability. Later this year, we offer a gradual rollout mechanism that will automatically switch endpoints to "block" mode;  this mechanism applies only if you haven't made a choice to either enable ("block" mode) or disable the capability.

- [Network Protection and Web Protection for macOS and Linux is now in Public Preview!](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/network-protection-and-web-protection-for-macOS-and-linux-is-now/ba-p/3601576)<br>Network Protection helps reduce the attack surface of your devices from Internet-based events. It prevents employees from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the Internet. It's the foundation on which our Web Protection for Microsoft Defender for Endpoint is built. These capabilities include Web threat protection, Web content filtering, and IP/URL Custom indicators. Web protection enables you to secure your devices against web threats and helps to regulate unwanted content.

- [Improved Microsoft Defender for Endpoint onboarding for Windows Server 2012 R2 and Windows Server 2016](/intune/configmgr/core/plan-design/changes/whats-new-in-version-2207#improved-microsoft-defender-for-endpoint-mde-onboarding-for-windows-server-2012-r2-and-windows-server-2016)<br>Configuration Manager version 2207 now supports automatic deployment of modern, unified Microsoft Defender for Endpoint for Windows Server 2012 R2 & 2016. Devices running Windows Server 2012 R2 or Windows Server 2016 that is targeted by the Defender for Endpoint onboarding policy now use the unified agent instead of the Microsoft Monitoring Agent-based solution, if configured through client settings.

## July 2022

- [Add domain controller devices - Evaluation lab enhancement](evaluate-microsoft-defender-antivirus.md)<br>Now generally available - Add a domain controller to run complex scenarios such as lateral movement and multistage attacks across multiple devices.

- [Announcing File page enhancements in Microsoft Defender for Endpoint](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-file-page-enhancements-in-microsoft-defender-for/ba-p/3584004)<br>Have you ever investigated files in Microsoft Defender for Endpoint? We now make it even easier with our recent announcement of enhancements to the File page and side panel. Users can now streamline processes by having a more efficient navigation experience that hosts all this information in one place.

- [Introducing the new alert suppression experience](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/introducing-the-new-alert-suppression-experience/ba-p/3562719)<br>We're excited to share that the new and advanced alert suppression experience is now Generally Available. The new experience provides tighter granularity and control, allowing users to tune Microsoft Defender for Endpoint alerts.

- [Prevent compromised unmanaged devices from moving laterally in your organization with "Contain](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/prevent-compromised-unmanaged-devices-from-moving-laterally-in/ba-p/3482134)<br>Starting today, when a device that isn't enrolled in Microsoft Defender for Endpoint is suspected of being compromised, as an SOC analyst, you're able to "Contain" it. As a result, any device enrolled in Microsoft Defender for Endpoint will now block any incoming/outgoing communication with the suspected device.

- [Mobile device support is now available for US Government Customers using Defender for Endpoint](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/mobile-device-support-is-now-available-for-us-government/ba-p/3472590)<br>Microsoft Defender for Endpoint for US Government customers is built in the Azure US Government environment and uses the same underlying technologies as Defender in Azure Commercial. This offering is available to GCC, GCC High, and DoD customers, and it further extends our platform availability from Windows, macOS, and Linux, to Android and iOS devices.

## June 2022

- [Defender for Servers Plan 2 now integrates with MDE unified solution](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/defender-for-servers-plan-2-now-integrates-with-mde-unified/ba-p/3527534)<br>You can now start deploying the modern, unified solution for Windows Server 2012 R2 and 2016 to servers covered by Defender for Servers Plan 2, using a single button.

- [Mobile Network Protection in Microsoft Defender for Endpoint on Android & iOS now in Public Preview](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/mobile-network-protection-in-microsoft-defender-for-endpoint-on/ba-p/3559121)<br>Microsoft offers a mobile network protection feature in Defender for Endpoint that helps organizations identify, assess, and remediate endpoint weaknesses with the help of robust threat intelligence. We're delighted to announce that users can now benefit from this new feature on both Android and iOS platforms that have Microsoft Defender for Endpoint.

- **(Android)** Microsoft Defender for Endpoint is now supported on Android Enterprise personal profile (BYOD only) with malware scanning, protection from phishing links, network protection, and vulnerability management, coupled with [privacy controls](android-configure.md#privacy-controls) to ensure user privacy on personal profile. For more information, see the [announcement](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-the-public-preview-of-defender-for-endpoint-personal/ba-p/3370979) and the [deployment guide](android-intune.md#set-up-microsoft-defender-in-personal-profile-on-android-enterprise-in-byod-mode).

## January 2022

- **(Android)** Vulnerability management on Android and iOS is now generally available. For more information, see [Announcing general availability of vulnerability management on Android and iOS](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-general-availability-of-vulnerability-management/ba-p/3071663).

## November 2021

- **(Android)** Permission changes for Microsoft Defender for Endpoint on Android 11 or later (build 1.0.3501.0301). Microsoft Defender for Endpoint requires [new storage permission](https://developer.android.com/training/data-storage/manage-all-files#all-files-access-google-play) for devices running Android 11 or later, as required by [Google API Level 30](https://developer.android.com/distribute/play-policies#APILevel30). Users must accept this permission after updating to build 1.0.3501.0301 or later to ensure app security functionality continues without disruption. If the permission is denied, app security is turned off on the device. For more information, see [Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md).

## October 2021

- [Updated onboarding and feature parity for Windows Server 2012 R2 and Windows Server 2016 (preview)](onboard-server.md)<br> The new unified solution package makes it easier to onboard servers by removing dependencies and installation steps. In addition, this unified solution package comes with many new feature improvements.

- Windows 11 support added to Microsoft Defender for Endpoint and Microsoft 365 Defender.

## September 2021

- [Web content filtering](web-content-filtering.md) . As part of web protection capabilities in Microsoft Defender for Endpoint, web content filtering enables your organization's security team to track and regulate access to websites based on their content categories. Categories include adult content, high bandwidth, legal liability, leisure, and uncategorized. Although many websites that fall into one or more of these categories might not be malicious, they could be problematic because of compliance regulations, bandwidth usage, or other concerns. [Learn more about web content filtering](web-content-filtering.md).

## August 2021

- [Microsoft Defender for Endpoint Plan 1 ](defender-endpoint-plan-1.md) (preview). Defender for Endpoint Plan 1 (preview) is an endpoint protection solution that includes next-generation protection, attack surface reduction, centralized management and reporting, and APIs. Defender for Endpoint Plan 1 (preview) is a new offering for customers who:
  - Want to try our endpoint protection capabilities
  - Have Microsoft 365 E3, and
  - Don't yet have Microsoft 365 E5

  For more information on Defender for Endpoint Plan 1 (preview), see [Microsoft Defender for Endpoint Plan 1 (preview)](defender-endpoint-plan-1.md).

  Existing [Defender for Endpoint](microsoft-defender-endpoint.md) capabilities will be known as Defender for Endpoint Plan 2.

- (Preview) [Web Content Filtering](web-content-filtering.md)<br>  Web content filtering is part of web protection capabilities in Microsoft Defender for Endpoint. It enables your organization to track and regulate access to websites based on their content categories. Many of these websites, while not malicious, might be problematic because of compliance regulations, bandwidth usage, or other concerns.

## June 2021

- [Delta export software vulnerabilities assessment](api/get-assessment-methods-properties.md#31-methods) API <br> An addition to the [Export assessments of vulnerabilities and secure configurations](api/get-assessment-methods-properties.md) API collection. <br> Unlike the full software vulnerabilities assessment (JSON response) - which is used to obtain an entire snapshot of the software vulnerabilities assessment of your organization by device - the delta export API call is used to fetch only the changes that have happened between a selected date and the current date (the "delta" API call). Instead of getting a full export with a large amount of data every time, you'll only get specific information on new, fixed, and updated vulnerabilities. Delta export API call can also be used to calculate different KPIs such as "how many vulnerabilities were fixed" or "how many new vulnerabilities were added to an organization."

- [Export assessments of vulnerabilities and secure configurations](api/get-assessment-methods-properties.md) API <br> Adds a collection of APIs that pull threat and vulnerability management data on a per-device basis. There are different API calls to get different types of data: secure configuration assessment, software inventory assessment, and software vulnerabilities assessment. Each API call contains the requisite data for devices in your organization.

- [Remediation activity](api/get-remediation-methods-properties.md) API <br>  Adds a collection of APIs with responses that contain threat and vulnerability management remediation activities that have been created in your tenant. Response information types include one remediation activity by ID, all remediation activities, and exposed devices of one remediation activity.

- [Device discovery](device-discovery.md) <br> Helps you find unmanaged devices connected to your corporate network without the need for extra appliances or cumbersome process changes. Using onboarded devices, you can find unmanaged devices in your network and assess vulnerabilities and risks. You can then onboard discovered devices to reduce risks associated with having unmanaged endpoints in your network.

   > [!IMPORTANT]
   > Standard discovery will be the default mode for all customers starting July 19, 2021. You can choose to retain the "basic mode" through the **Settings** page.

- [Device group definitions](machine-groups.md) can now include multiple values for each condition. You can set multiple tags, device names, and domains to the definition of a single device group.

- [Mobile Application management support](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-new-capabilities-on-android-and-ios/ba-p/2442730) <br> This enhancement enables Microsoft Defender for Endpoint protect an organization's data within a managed application when Intune is being used to manage mobile applications. For more information about mobile application management, see [this documentation](/intune/intune-service/apps/mam-faq).

- [Microsoft Tunnel VPN integration](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-new-capabilities-on-android-and-ios/ba-p/2442730) <br> Microsoft Tunnel VPN capabilities are now integrated with Microsoft Defender for Endpoint app for Android. This unification enables organizations to offer a simplified end-user experience with one security app offering both mobile threat defense and the ability to access on-premises resources from their mobile device while security and IT teams are able to maintain the same admin experiences they're familiar with.

- [Jailbreak detection on iOS](ios-configure-features.md#conditional-access-with-defender-for-endpoint-on-ios) <br> Jailbreak detection capability in Microsoft Defender for Endpoint on iOS is now generally available. This adds to the phishing protection that already exists. For more information, see [Setup Conditional Access Policy based on device risk signals](ios-configure-features.md#conditional-access-with-defender-for-endpoint-on-ios).

## March 2021

 [Manage tamper protection using the Microsoft Defender Security Center](manage-tamper-protection-microsoft-365-defender.md#manage-tamper-protection-for-your-organization-using-microsoft-defender-portal) <br> You can manage tamper protection settings on Windows 10, Windows Server 2016, Windows Server 2019, and Windows Server 2022 by using a method called *tenant attach*.

## January 2021

- [Windows Virtual Desktop](https://azure.microsoft.com/services/virtual-desktop/) <br> Microsoft Defender for Endpoint now adds support for Windows Virtual Desktop.

## December 2020

- [Microsoft Defender for Endpoint on iOS](microsoft-defender-endpoint-ios.md) <br> Microsoft Defender for Endpoint now adds support for iOS. Learn how to install, configure, update, and use Microsoft Defender for Endpoint for iOS.

## September 2020

- [Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md) <br> Microsoft Defender for Endpoint now adds support for Android. In addition to the provisions for you to install, configure, and use Microsoft Defender for Endpoint for Android (introduced in the previous sprint in August 2020), the provision to "update" Microsoft Defender for Endpoint for Android has been introduced in this sprint.

- [Threat and vulnerability management macOS support](/defender-vulnerability-management/tvm-supported-os)<br> Threat and vulnerability management for macOS is now in public preview, and will continuously detect vulnerabilities on your macOS devices to help you prioritize remediation by focusing on risk. For more information, see [Microsoft Tech Community blog post](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/microsoft-defender-for-endpoint-adds-depth-and-breadth-to-threat/ba-p/1695824).

## August 2020

- [Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md) <br> Microsoft Defender for Endpoint now adds support for Android. The article [Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md) Details how to install, configure, and use Microsoft Defender for Endpoint for Android.

## July 2020

- [Create indicators for certificates](indicators-overview.md) <br> Create indicators to allow or block certificates.

## June 2020

- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) <br> Microsoft Defender for Endpoint now adds support for Linux. This article [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) Details how to install, configure, update, and use Microsoft Defender for Endpoint for Linux.

- [Attack simulators in the evaluation lab](evaluate-microsoft-defender-antivirus.md) <br> Microsoft Defender for Endpoint partnered with various threat simulation platforms to give you convenient access to test the capabilities of the platform right from within the portal.

## April 2020

- [Threat & Vulnerability Management API support](api/exposed-apis-list.md) <BR>Run Threat & Vulnerability Management-related API calls such as get your organization's threat exposure score or device secure score, software and device vulnerability inventory, software version distribution, device vulnerability information, and security recommendation information. For more information, see [Microsoft Tech Community blog post](https://techcommunity.microsoft.com/t5/microsoft-defender-atp/threat-amp-vulnerability-management-apis-are-now-generally/ba-p/1304615).

## November-December 2019

- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md) <BR> Microsoft Defender for Endpoint for Mac brings the next-generation protection to Mac devices. Core components of the unified endpoint security platform will now be available for Mac devices, including [endpoint detection and response](overview-endpoint-detection-response.md).

- [Threat & Vulnerability Management application and application version end-of-life information](/defender-vulnerability-management/tvm-security-recommendation) <BR>Applications and application versions which have reached their end of life (EOL) are tagged or labeled as such; so, you're aware that they'll no longer be supported, and can take action to either uninstall or replace. Doing so helps lessen the risks related to various vulnerability exposures due to unpatched applications.

- [Threat & Vulnerability Management Advanced Hunting Schemas](/defender-xdr/advanced-hunting-schema-tables) <BR>Use the Threat & Vulnerability Management tables in the Advanced hunting schema to query about software inventory, vulnerability knowledgebase, security configuration assessment, and security configuration knowledgebase.

- [Threat & Vulnerability Management role-based access controls](user-roles.md) <BR>Use the new permissions to allow maximum flexibility to create SecOps-oriented roles, Threat & Vulnerability Management-oriented roles, or hybrid roles so that only authorized users are accessing specific data to do their task. You can also achieve even further granularity by specifying whether a Threat & Vulnerability Management role can only view vulnerability-related data, or can create and manage remediation and exceptions.

## October 2019

- [Indicators for IP addresses, URLs/Domains](indicators-overview.md) <BR> You can now allow or block URLs/domains using your own threat intelligence.

- [Microsoft Threat Experts - Experts on Demand](endpoint-attack-notifications.md) <BR> You now have the option to consult with Microsoft Threat Experts from several places in the portal to help you in the context of your investigation.

- [Connected Azure AD applications](connected-applications.md)<br> The **Connected applications** page provides information about the Azure AD applications connected to Microsoft Defender for Endpoint in your organization.

- [API Explorer](api/api-explorer.md)<br> The API explorer makes it easy to construct and execute API queries, and to test and send requests for any available Microsoft Defender for Endpoint API endpoint.

## September 2019

- [Tamper Protection settings using Intune](manage-tamper-protection-intune.md)<br/>You can now turn on Tamper Protection (or turn off) for your organization in the Microsoft 365 Device Management Portal (Intune).

- [Live response](live-response.md)<BR> Get instantaneous access to a device using a remote shell connection. Do in-depth investigative work and take immediate response actions to promptly contain identified threats - real time.

- [Evaluation lab](evaluate-microsoft-defender-antivirus.md) <BR> The Microsoft Defender for Endpoint evaluation lab is designed to eliminate the complexities of device and environment configuration so that you can
 focus on evaluating the capabilities of the platform; running simulations; and seeing the prevention, detection, and remediation features in action.

- [Windows Server 2008 R2 SP1](onboard-server.md) <BR> You can now onboard Windows Server 2008 R2 SP1.

## June 2019

- [Threat & Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) <BR> A new built-in capability that uses a risk-based approach to the discovery, prioritization, and remediation of endpoint vulnerabilities and misconfigurations.

- [Device health and compliance report](device-health-reports.md)  The device health and compliance report provides high-level information about the devices in your organization.

## May 2019

- [Threat protection reports](threat-protection-reports.md)<BR>The threat protection report provides high-level information about alerts generated in your organization.

- [Microsoft Threat Experts](endpoint-attack-notifications.md)<BR> Microsoft Threat Experts is the new managed threat hunting service in Microsoft Defender for Endpoint that provides proactive hunting, prioritization, and additional context and insights that further empower security operations centers (SOCs) to identify and respond to threats quickly and accurately. It provides an additional layer of expertise and optics that Microsoft customers can utilize to augment security operation capabilities as part of Microsoft 365.

- [Indicators](api/ti-indicator.md) <BR> APIs for indicators are now generally available.

- [Interoperability](partner-applications.md) <BR> Microsoft Defender for Endpoint supports third-party applications to help enhance the detection, investigation, and threat intelligence capabilities of the platform.

## April 2019

- [Microsoft Threat Experts Targeted Attack Notification capability](endpoint-attack-notifications.md) <BR> Microsoft Threat Experts' Targeted Attack Notification alerts are tailored for organizations to provide as much information as can be quickly delivered, including the timeline, scope of breach, and the methods of intrusion, thus bringing attention to critical threats in their network.

- [Microsoft Defender for Endpoint API](/defender-vulnerability-management/tvm-supported-os) <BR> Microsoft Defender for Endpoint exposes much of its data and actions through a set of programmatic APIs. Those APIs enable you to automate workflows and innovate based on Microsoft Defender for Endpoint capabilities.

## February 2019

- [Incidents](view-incidents-queue.md) <BR> Incident is a new entity in Microsoft Defender for Endpoint that brings together all relevant alerts and related entities to narrate the broader-attack story, giving analysts better perspective on the purview of complex threats.

- [Onboard previous versions of Windows](onboard-downlevel.md)<BR> Onboard supported versions of Windows devices so that they can send sensor data to the Microsoft Defender for Endpoint sensor.

## October 2018

- [Attack surface reduction rules](attack-surface-reduction.md)<BR>All Attack surface reduction rules are now supported on Windows Server 2019.

- [Controlled folder access](enable-controlled-folders.md)<BR> Controlled folder access is now supported on Windows Server 2019.

- [Custom detection](/defender-xdr/custom-detections-overview)<BR>With custom detections, you can create custom queries to monitor events for any kind of behavior such as suspicious or emerging threats. This can be done by using the power of advanced hunting through the creation of custom detection rules.

- [Integration with Azure Security Center](onboard-server.md)<BR> Microsoft Defender for Endpoint integrates with Azure Security Center to provide a comprehensive server protection solution. With this integration, Azure Security Center can leverage the power of Microsoft Defender for Endpoint to provide improved threat detection for Windows Servers.

- [Managed security service provider](mssp-support.md) (MSSP) support<BR> Microsoft Defender for Endpoint adds support for this scenario by providing MSSP integration. The integration allows MSSPs to take the following actions: Get access to MSSP customer's Microsoft Defender Security Center portal, fetch email notifications, and fetch alerts through security information and event management (SIEM) tools.

- [Removable device control](https://cloudblogs.microsoft.com/microsoftsecure/2018/12/19/windows-defender-atp-has-protections-for-usb-and-removable-devices/)<BR>Microsoft Defender for Endpoint provides multiple monitoring and control features to help prevent threats from removable devices, including new settings to allow or block specific hardware IDs.

- Support for iOS and Android devices<BR> iOS and Android devices are now supported and can be onboarded to the service.

- [Threat analytics](threat-analytics.md)<BR>
Threat Analytics is a set of interactive reports published by the Microsoft Defender for Endpoint research team as soon as emerging threats and outbreaks are identified. The reports help security operations teams assess impact on their environment and provide recommended actions to contain the impact, increase organizational resilience, and prevent specific threats.

- There are two new attack surface reduction rules in Windows 10 version 1809:

  - Block Adobe Reader from creating child processes

  - Block Office communication application from creating child processes

- [Microsoft Defender Antivirus](microsoft-defender-antivirus-windows.md)

- Anti-malware Scan Interface (AMSI) was extended to cover Office VBA macros as well. [Office VBA + AMSI: Parting the veil on malicious macros](https://cloudblogs.microsoft.com/microsoftsecure/2018/09/12/office-vba-amsi-parting-the-veil-on-malicious-macros/).

  - Microsoft Defender Antivirus, new in Windows 10 version 1809, can now [run within a sandbox](https://www.microsoft.com/security/blog/2018/10/26/windows-defender-antivirus-can-now-run-in-a-sandbox) (preview), increasing its security.

  - [Configure CPU priority settings](configure-advanced-scan-types-microsoft-defender-antivirus.md) for Microsoft Defender Antivirus scans.

## March 2018

- [Advanced Hunting](/defender-xdr/advanced-hunting-query-language)<BR>Query data using advanced hunting in Microsoft Defender for Endpoint.

- [Attack surface reduction rules](attack-surface-reduction.md)<BR>The newly introduced attack surface reduction rules are:

  - Use advanced protection against ransomware

  - Block credential stealing from the Windows local security authority subsystem (lsass.exe)

  - Block process creations originating from PSExec and WMI commands

  - Block untrusted and unsigned processes that run from USB

  - Block executable content from email client and webmail

- [Automated investigation and remediation](automated-investigations.md)<BR> Use Automated investigations to investigate and remediate threats.

  > [!NOTE]
  > Available from Windows 10, version 1803 or later.

- [Conditional Access](conditional-access.md) <br> Enable conditional access to better protect users, devices, and data.

- [Microsoft Defender for Endpoint Community center](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/bd-p/MicrosoftDefenderATP)<BR>The Microsoft Defender for Endpoint Community Center is a place where community members can learn, collaborate, and share experiences about the product.

- [Controlled folder access](enable-controlled-folders.md)<BR>You can now block untrusted processes from writing to disk sectors using Controlled Folder Access.

- [Onboard Windows and Mac client devices to Microsoft Defender for Endpoint](onboard-client.md)<BR>Microsoft Defender for Endpoint provides a centralized security operations experience for Windows and non-Windows platforms. You'll be able to see alerts from various supported operating systems (OS) in Microsoft Defender Security Center and better protect your organization's network.

- [Role-based access control (RBAC)](rbac.md)<BR>Using role-based access control (RBAC), you can create roles and groups within your security operations team to grant appropriate access to the portal.

- [Microsoft Defender Antivirus](microsoft-defender-antivirus-windows.md)<BR>Microsoft Defender Antivirus now shares detection status between Microsoft 365 services and interoperates with Microsoft Defender for Endpoint. For more information, see [Use next-gen technologies in Microsoft Defender Antivirus through cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md).

- Block at first sight can now block nonportable executable files (such as JS, VBS, or macros) and executable files. For more information, see [Enable block at first sight](configure-block-at-first-sight-microsoft-defender-antivirus.md).

## Release notes archive

For archived platform-specific build and version history (macOS, Linux, Windows EDR), see [Microsoft Defender for Endpoint release notes - Archive](release-notes-mde-archive.md).
