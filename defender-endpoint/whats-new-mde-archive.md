---
title: What's new in Microsoft Defender for Endpoint - Archive
description: See what features were available for Microsoft Defender for Endpoint in past releases.
search.appverid: met150
ms.service: defender-endpoint
ms.subservice: reference
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.date: 02/18/2026
manager: bagol
ai-usage: ai-assisted
audience: ITPro
ms.collection:
- m365-security
- tier1
ms.topic: whats-new
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# What's new in Microsoft Defender for Endpoint - Archive


The following features were in preview or generally available (GA) in Microsoft Defender for Endpoint in past releases.

For more information on preview features, see [Preview features](/defender-xdr/preview).

For more information on what's new with Microsoft Defender for Endpoint on Windows, see:
[What's new in Microsoft Defender for Endpoint on Windows](windows-whatsnew.md)

For more information on what's new with other Microsoft Defender security products, see:

- [What's new in Microsoft Defender XDR](/defender-xdr/whats-new)
- [What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)

For more information on Microsoft Defender for Endpoint on specific operating systems and on other operating systems:

- [What's new in Defender for Endpoint on Windows](windows-whatsnew.md)
- [What's new in Defender for Endpoint on macOS](mac-whatsnew.md)
- [What's new in Defender for Endpoint on Linux](linux-whatsnew.md)
- [What's new in Defender for Endpoint on Android](android-whatsnew.md)
- [What's new in Defender for Endpoint on iOS](ios-whatsnew.md)

## July 2025

- Azure Stack HCI OS support (version 23H2 and later) — Preview. Added support for Azure Stack HCI OS, version 23H2 and later. Support for Azure Stack HCI OS is rolling out across commercial and government clouds.

- [Microsoft Defender Core service](/defender-endpoint/microsoft-defender-core-service-overview) — GA. Microsoft Defender Core service helps with the stability and performance of Microsoft Defender Antivirus.

## May 2025

- **(Android)** Alerts for activities related to open wireless connection and certificates are now detected as events. Starting May 19, 2025, connecting or disconnecting to open wireless networks and download/installation/removal of self-signed certificates appear as events in the Timeline tab instead of alerts. For more information, see [Network protection](android-configure.md#network-protection).

- **(iOS)** Alerts for activities related to open wireless connections are now detected as events. Starting May 19, 2025, when a user connects to an open wireless network on a mobile device, an alert is no longer generated on the Microsoft Defender portal. Instead, this activity is added as an event and viewable under the device timeline. For more information, see [Configure network protection](ios-configure-features.md#configure-network-protection).

## April 2025

- [Contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices) — Preview. Containing an IP address prevents attackers from spreading attacks to other noncompromised devices.

- Attack Surface Reduction (ASR) Rules — GA. Two new ASR rules are now generally available: Block rebooting machine in Safe Mode; Block use of copied or impersonated system tools.

- **(Linux)** ARM64-based Linux server support — GA. Defender for Endpoint now supports ARM64-based Linux servers on Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux. For more information, see [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md).

- **(Android)** Deploy Defender for Endpoint prerelease builds on Android devices using Google Play preproduction tracks. For more information, see [Deploy Defender for Endpoint prerelease builds on Android devices](mobile-pretest-android.md).

## March 2025

- **(iOS)** Improving usability: Key updates to the Microsoft Defender app interface on iOS. The new **Device Protection** feature card for enterprise users includes Web Protection, Device Health, and Jailbreak features with recommendation cards and a tile view. For more information, see [User Experience in Microsoft Defender for Endpoint on iOS](/defender-endpoint/ios-new-ux).

## February 2025

- [Aggregated reporting in Microsoft Defender for Endpoint](aggregated-reporting.md) — GA. Aggregated reporting extends signal reporting intervals to significantly reduce the size of reported events while preserving essential event properties.

- **(Android)** Defender for Endpoint on Android now supports Android 10 as the minimum version. Support for Android 8, 8.1, and 9 ends on April 30, 2025. Moving forward, only devices running Android 10 and later are supported.

- **(Android)** Open Wi-Fi Detection update: A caching behavior is implemented so that if a user reconnects to the same open Wi-Fi network within seven days, another alert isn't raised. Alerts for different open Wi-Fi networks are still generated immediately.

- **(iOS)** Open Wi-Fi Detection update: A caching behavior is implemented so that if a user reconnects to the same open Wi-Fi network within seven days, another alert isn't raised. Alerts for different open Wi-Fi networks are still generated immediately.

## January 2025

- **(Android)** New dashboard with recommendation cards for alerts and feature tiles. The updated dashboard prominently displays active alerts and presents features in tile form for easier navigation. For more information, see [What's new in Defender for Endpoint on Android](android-whatsnew.md).

- **(iOS)** New dashboard with recommendation cards for alerts and feature tiles. The updated dashboard prominently displays active alerts and presents features in tile form for easier navigation. For more information, see [What's new in Defender for Endpoint on iOS](ios-whatsnew.md).

- **(iOS)** Defender for Endpoint on iOS now supports iOS/iPadOS 16.x as the minimum version. Support for iOS/iPadOS 15 ends on January 31, 2025.

- **(iOS)** User enrollment support. Microsoft Defender for Endpoint iOS can now be deployed on Intune User Enrolled devices. For more information, see [User Enrollment setup](ios-install.md#user-enrollment-setup-only-for-intune-user-enrolled-devices).

## November-December 2024

- New demonstration scenarios — GA. Five new demonstration scenarios are available: [AMSI demos](mde-demonstration-amsi.md), [Cloud protection demo](/defender-endpoint/defender-endpoint-demonstration-cloud-delivered-protection), [Controlled folder access (block ransomware) demo](/defender-endpoint/defender-endpoint-demonstration-controlled-folder-access), [Endpoint detection and response (EDR) detection test](/defender-endpoint/edr-detection), [URL reputation (SmartScreen) demo](/defender-endpoint/defender-endpoint-demonstration-smartscreen-url-reputation).

## December 2024

- **(Android)** Android low-touch onboarding is now generally available. Low-touch onboarding simplifies setup on Android devices by supporting silent sign-on and autogranting certain permissions, so users only need to grant the necessary permissions to onboard. It supports Android Enterprise BYOD, COPE, and fully managed profiles. For configuration details, see [Android low-touch onboarding](/defender-endpoint/android-intune).

> [!IMPORTANT]
> **Ending support for device administrator enrolled devices**: Microsoft Intune and Defender for Endpoint are ending support for device administrator enrolled devices with access to [Google Mobile Services](/mem/intune/apps/manage-without-gms) (GMS), beginning December 31, 2024. After support ends, Intune and Defender for Endpoint won't make changes or updates to Android device administrator management for devices with access to GMS, and technical support will no longer be available. For more information, see [Tech Community blog: Intune ending support for Android device administrator on devices with GMS in December 2024](https://techcommunity.microsoft.com/blog/intunecustomersuccess/intune-ending-support-for-android-device-administrator-on-devices-with-gms-in-de/3915443).

## August 2024

- **(Android)** Network protection is now generally available and enabled by default for all users (version 1.0.6812.0101). Network protection provides protection against rogue Wi-Fi related threats, rogue hardware like pineapple devices, and rogue certificates. Users see a network protection card in the Defender for Endpoint app and are required to provide location permission to complete setup. Administrators can change the default value via Intune App Configuration policies. For more information, see [Network protection on Android](android-configure.md).

## July 2024

- Monitor OT devices in the device inventory — Preview. You can now monitor OT devices in addition to IoT devices in the device inventory, as part of the integration with [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/device-discovery). For more information, see [Device inventory](machines-view-overview.md).

- Learning hub resources moved — GA. Learning hub resources have moved from the Microsoft Defender portal to [learn.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2273118).

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

- [Improved Microsoft Defender for Endpoint onboarding for Windows Server 2012 R2 and Windows Server 2016](/mem/configmgr/core/plan-design/changes/whats-new-in-version-2207#improved-microsoft-defender-for-endpoint-mde-onboarding-for-windows-server-2012-r2-and-windows-server-2016)<br>Configuration Manager version 2207 now supports automatic deployment of modern, unified Microsoft Defender for Endpoint for Windows Server 2012 R2 & 2016. Devices running Windows Server 2012 R2 or Windows Server 2016 that is targeted by the Defender for Endpoint onboarding policy now use the unified agent instead of the Microsoft Monitoring Agent-based solution, if configured through client settings.

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


## October 2021

- [Updated onboarding and feature parity for Windows Server 2012 R2 and Windows Server 2016 (preview)](onboard-server.md)<br> The new unified solution package makes it easier to onboard servers by removing dependencies and installation steps. In addition, this unified solution package comes with many new feature improvements.

- Windows 11 support added to Microsoft Defender for Endpoint and Microsoft 365 Defender.

## November 2021

- **(Android)** Permission changes for Microsoft Defender for Endpoint on Android 11 or later (build 1.0.3501.0301). Microsoft Defender for Endpoint requires [new storage permission](https://developer.android.com/training/data-storage/manage-all-files#all-files-access-google-play) for devices running Android 11 or later, as required by [Google API Level 30](https://developer.android.com/distribute/play-policies#APILevel30). Users must accept this permission after updating to build 1.0.3501.0301 or later to ensure app security functionality continues without disruption. If the permission is denied, app security is turned off on the device. For more information, see [Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md).

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

## January 2022

- **(Android)** Vulnerability management on Android and iOS is now generally available. For more information, see [Announcing general availability of vulnerability management on Android and iOS](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-general-availability-of-vulnerability-management/ba-p/3071663).

## June 2021

- [Delta export software vulnerabilities assessment](api/get-assessment-methods-properties.md#31-methods) API <br> An addition to the [Export assessments of vulnerabilities and secure configurations](api/get-assessment-methods-properties.md) API collection. <br> Unlike the full software vulnerabilities assessment (JSON response) - which is used to obtain an entire snapshot of the software vulnerabilities assessment of your organization by device - the delta export API call is used to fetch only the changes that have happened between a selected date and the current date (the "delta" API call). Instead of getting a full export with a large amount of data every time, you'll only get specific information on new, fixed, and updated vulnerabilities. Delta export API call can also be used to calculate different KPIs such as "how many vulnerabilities were fixed" or "how many new vulnerabilities were added to an organization."

- [Export assessments of vulnerabilities and secure configurations](api/get-assessment-methods-properties.md) API <br> Adds a collection of APIs that pull threat and vulnerability management data on a per-device basis. There are different API calls to get different types of data: secure configuration assessment, software inventory assessment, and software vulnerabilities assessment. Each API call contains the requisite data for devices in your organization.

- [Remediation activity](api/get-remediation-methods-properties.md) API <br>  Adds a collection of APIs with responses that contain threat and vulnerability management remediation activities that have been created in your tenant. Response information types include one remediation activity by ID, all remediation activities, and exposed devices of one remediation activity.

- [Device discovery](device-discovery.md) <br> Helps you find unmanaged devices connected to your corporate network without the need for extra appliances or cumbersome process changes. Using onboarded devices, you can find unmanaged devices in your network and assess vulnerabilities and risks. You can then onboard discovered devices to reduce risks associated with having unmanaged endpoints in your network.

   > [!IMPORTANT]
   > Standard discovery will be the default mode for all customers starting July 19, 2021. You can choose to retain the "basic mode" through the **Settings** page.

- [Device group definitions](machine-groups.md) can now include multiple values for each condition. You can set multiple tags, device names, and domains to the definition of a single device group.

- [Mobile Application management support](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-new-capabilities-on-android-and-ios/ba-p/2442730) <br> This enhancement enables Microsoft Defender for Endpoint protect an organization's data within a managed application when Intune is being used to manage mobile applications. For more information about mobile application management, see [this documentation](/mem/intune/apps/mam-faq).

- [Microsoft Tunnel VPN integration](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-new-capabilities-on-android-and-ios/ba-p/2442730) <br> Microsoft Tunnel VPN capabilities are now integrated with Microsoft Defender for Endpoint app for Android. This unification enables organizations to offer a simplified end-user experience with one security app – offering both mobile threat defense and the ability to access on-prem resources from their mobile device – while security and IT teams are able to maintain the same admin experiences they're familiar with.

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
---

# Release notes archive

The following sections contain platform-specific build and version history for macOS, Linux, and Windows EDR components of Microsoft Defender for Endpoint. For current releases, see [Microsoft Defender for Endpoint release notes](microsoft-defender-endpoint-versions.md).


## macOS release notes archive

Entries older than Aug 2025 (builds older than 101.25062.0006).

### Jul-2025 (Build: 101.25062.0005  | Release version: 20.125062.5.0)

| Build:             | **101.25062.0005**   |
|--------------------|----------------------|
| Release version:   | **20.125062.5.0**    |
| Engine version:    | **1.1.25040.3000**   |
| Signature version: | **1.427.248.0**      |

##### What's new

- Bug and performance fixes

### Jun-2025 (Build: 101.25052.0012  | Release version: 20.125052.12.0)

| Build:             | **101.25052.0012**   |
|--------------------|----------------------|
| Release version:   | **20.125052.12.0**   |
| Engine version:    | **1.1.25060.3000**   |
| Signature version: | **1.431.226.0**      |

##### What's new

- Bug and performance fixes

### May-2025 (Build: 101.25042.0009  | Release version: 20.125042.9.0)

| Build:             | **101.25042.0009**   |
|--------------------|----------------------|
| Release version:   | **20.125042.9.0**    |
| Engine version:    | **1.1.25040.3000**   |
| Signature version: | **1.429.521.0**      |

##### What's new

- `mdatp health --details edr` now includes Azure Active Directory information
- Bug and performance fixes

### Apr-2025 (Build: 101.25032.0006  | Release version: 20.125032.6.0)

| Build:             | **101.25032.0006**   |
|--------------------|----------------------|
| Release version:   | **20.125032.6.0**    |
| Engine version:    | **1.1.25020.3000**   |
| Signature version: | **1.427.158.0**      |

##### What's new

- Hardware UUID is now displayed in the Security Portal
- Bug and performance fixes
- **(GA) Behavior Monitoring for macOS**: For information on Behavior Monitoring for Microsoft Defender for Endpoint on macOS, see [Behavior Monitoring in Microsoft Defender for Endpoint on macOS](behavior-monitor-macos.md).

### Mar-2025 (Build: 101.25022.0003  | Release version: 20.125022.3.0)

| Build:             | **101.25022.0003**    |
|--------------------|-----------------------|
| Release version:   | **20.125022.3.0**     |
| Engine version:    | **1.1.24090.12**      |
| Signature version: | **1.423.249.0**       |

##### What's new

- Bug and performance fixes

### Mar-2025 (Build: 101.25012.0008  | Release version: 20.125012.7.0)

| Build:             | **101.25012.0008**    |
|--------------------|-----------------------|
| Release version:   | **20.125012.7.0**     |
| Engine version:    | **1.1.25020.3000**    |
| Signature version: | **1.423.211.0**       |

##### What's new

- Bug fixes and performance improvements

### Feb-2025 (Build: 101.24122.0011  | Release version: 20.124122.11.0)

| Build:             | **101.24122.0011**    |
|--------------------|-----------------------|
| Release version:   | **20.124122.11.0**    |
| Engine version:    | **1.1.24080.11**      |
| Signature version: | **1.419.351.0**       |

##### What's new

- Fixed an issue with the auth prompt during new installation on macOS with multiple active users
- Improved stability when using the antivirus engine in passive mode

### Jan-2025 (Build: 101.24122.0005  | Release version: 20.124122.5.0)

| Build:             | **101.24122.0005**    |
|--------------------|-----------------------|
| Release version:   | **20.124122.4.0**     |
| Engine version:    | **1.1.24080.11**      |
| Signature version: | **1.419.351.0**       |

##### What's new

- Removed support of macOS 12, the minimal requirement is now macOS 13.0 or later
- Fix: Defender quarantines a file even if it's marked as immutable
- `mdatp health` can return [`out_of_date`](device-health-microsoft-defender-antivirus-health.md#up-to-date-definitions) status for `definitions_status`
- Bug and performance fixes

### Dec-2024 (Build: 101.24102.0018  | Release version: 20.124102.18.0)

| Build:             | **101.24102.0018**    |
|--------------------|-----------------------|
| Release version:   | **20.124102.18.0**    |
| Engine version:    | **1.1.24080.10**      |
| Signature version: | **1.419.298.0**       |

##### What's new

- **Improved User/Group Permission Handling** - Added reporting in `mdatp-health` for user/group permission issues for Defender files. On restart Defender attempts to cure these issues.
- Bug and performance fixes.

### Oct-2024 (Build: 101.24092.0004  | Release version: 20.124092.4.0)

| Build:             | **101.24092.0004**         |
|--------------------|-----------------------|
| Release version:   | **20.124092.4.0** |
| Engine version:    | **1.1.24080.11**       |
| Signature version: | **1.421.14.0**      |

##### What's new

- Bug and performance fixes

### Oct-2024 (Build: 101.24082.0009  | Release version: 20.124082.9.0)

| Build:             | **101.24082.0009**    |
|--------------------|-----------------------|
| Release version:   | **20.124082.9.0**     |
| Engine version:    | **1.1.24080.9**       |
| Signature version: | **1.411.410.0**       |

##### What's new

- Product improvements and performance fixes

### Sep-2024 (Build: 101.24072.0007  | Release version: 20.124072.7)

| Build:             | **101.24072.0007**    |
|--------------------|-----------------------|
| Release version:   | **20.124072.7**       |
| Engine version:    | **1.1.24080.9**       |
| Signature version: | **1.411.410.0**       |

##### What's new

- Resolved the issue causing outdated vulnerability assessments impacting some macOS devices

### Aug-2024 (Build: 101.24072.0006  | Release version: 20.124072.6.0)

| Build:             | **101.24072.0006**    |
|--------------------|-----------------------|
| Release version:   | **20.124072.6.0** |
| Engine version:    | **1.1.24060.7**  |
| Signature version: | **1.417.325.0**  |

##### What's new

- Product improvements and performance fixes

### Jul-2024 (Build: 101.24062.0009  | Release version: 20.124062.9.0)

| Build:             | **101.24062.0009**         |
|--------------------|-----------------------|
| Release version:   | **20.124062.9.0** |
| Engine version:    | **1.1.24050.7**       |
| Signature version: | **1.411.410.0**      |

##### What's new

- Product improvements and performance fixes

### Jun-2024 (Build: 101.24052.0013  | Release version: 20.124052.13.0)

| Build:             | **101.24052.0013**    |
|--------------------|-----------------------|
| Release version:   | **20.124052.13.0**    |
| Engine version:    | **1.1.24040.2**       |
| Signature version: | **1.411.153.0**       |

##### What's new

- [[device control](mac-device-control-overview.md)] Secure Digital cards aren't recognized on newer macOS
- Product improvements and performance fixes

### May-2024 (Build: 101.24042.0008  | Release version: 20.124042.8.0)

| Build:             | **101.24042.0008**   |
|--------------------|----------------------|
| Release version:   | **20.124042.8.0**    |
| Engine version:    | **1.1.24040.1**      |
| Signature version: | **1.413.13.0**       |

#### What's new

- Product improvements and performance fixes

### Apr-2024 (Build: 101.24032.0006  | Release version: 20.124032.06.0)

| Build:             | **101.24032.0006**    |
|--------------------|-----------------------|
| Release version:   | **20.124012.10.0**    |
| Engine version:    | **1.1.24030.4**       |
| Signature version: | **1.407.521.0**       |


#### What's new

- Improvements to `mdatp threat` command
- Remove Big Sur from supported versions of macOS
- [[device control](mac-device-control-overview.md)] Fix Bluetooth support on Sonoma (see the note later in this section)
- Product improvements and performance fixes
- **(GA) Troubleshooting mode for macOS**. Troubleshooting mode helps you identify instances where antivirus might be causing issues with your applications or system resources. To learn more, see [Troubleshooting mode in Microsoft Defender for Endpoint on macOS](mac-troubleshoot-mode.md).  

   > [!NOTE]
   > You need to deploy a new MDM configuration profile for Defender to access Bluetooth.
   > See details for [JAMF](mac-jamfpro-policies.md#step-10-grant-bluetooth-permissions) and [Intune](mac-install-with-intune.md#step-7-bluetooth-permissions)

### Mar-2024 (Build: 101.24012.0010  | Release version: 20.124012.10.0)

| Build:             | **101.24012.0010**    |
|--------------------|-----------------------|
| Release version:   | **20.124012.10.0**    |
| Engine version:    | **1.1.24020.3**       |
| Signature version: | **1.405.788.0**       |

#### What's new

- Product improvements and performance fixes
- **(GA) Built-in Scheduled Scan for macOS**: For information on Scheduled Scan built-in for Microsoft Defender for Endpoint on macOS, see [How to schedule scans with Microsoft Defender for Endpoint on macOS](mac-schedule-scan.md).

### Jan-2024 (Build: 101.23122.0005  | Release version: 20.123122.5.0)

| Build:             | **101.23122.0005**    |
|--------------------|-----------------------|
| Release version:   | **20.123122.5.0**     |
| Engine version:    | **1.1.23100.2010**    |
| Signature version: | **1.403.3022.0**      |

#### What's new

- [[device control](mac-device-control-overview.md)] Fixes for Bluetooth devices support
- Product improvements and performance fixes

### Dec-2023 (Build: 101.23102.0020 | Release version: 20.123102.20.0)

| Build:             | **101.23102.0020** |
|--------------------|--------------------|
| Release version:   | **20.123102.20.0** |
| Engine version:    | **1.1.23090.2005** |
| Signature version: | **1.401.1729.0**   |

#### What's new

- Product improvements and performance fixes

### Nov-2023 (Build: 101.23092.0007 | Release version: 20.123092.7.0)

| Build:             | **101.23092.0007**         |
|--------------------|----------------------------|
| Release version:   | **20.123092.7.0**          |
| Engine version:    | **1.1.23090.2005**         |
| Signature version: | **1.399.1196.0**           |

#### What's new

- [[device control](mac-device-control-overview.md)] set policy for DCv2 via 'mdatp config'
- Configuration loading - error logged to /Library/Logs/Microsoft/mdatp/microsoft_defender_core_err.log includes bad property name in JSON

> [!NOTE]
> If you use Device Control v1, consider migrating to v2 (that includes all v1 functionality and more).
> Device Control v1 will be considered deprecated in the nearest future.
> To check, run the `[mdatp health --details device_control](mac-device-control-overview.md#status)` command, and inspect the `active` property, it shouldn't contain "v1".

### Oct-2023 (Build: 101.23082.0018  | Release version: 20.123082.18.0)

| Build:             | **101.23082.0018**         |
|--------------------|----------------------------|
| Release version:   | **20.123082.18.0**         |
| Engine version:    | **1.1.23070.1002**         |
| Signature version: | **1.399.384.0**            |

#### What's new

- [[device control](mac-device-control-overview.md)] Detailed status with `mdatp health --details device_control`
- [[device control](mac-device-control-overview.md)] `mdatp config device-control policy` to [set policy](mac-device-control-manual.md) on a nonmanaged machine
- Product improvements and performance fixes

### Sep-2023 (Build: 101.23072.0025 | Release version: 20.123072.25.0)

| Build:             | **101.23072.0025**    |
|--------------------|-----------------------|
| Release version:   | **20.123072.25.0**    |
| Engine version:    | **1.1.23050.3**       |
| Signature version: | **1.397.911.0**       |

#### What's new

- Product improvements and performance fixes
- Fix: Security Portal events might have missed ancestors details for short lived processes
- Fix: Major performance issues on macOS when Network Protection is set to Audit mode
- **(GA) macOS devices receive built-in protection**. Tamper protection is turned on in block mode by default. This setting helps secure your Mac against threats. To learn more, see [Protect macOS security settings with tamper protection](built-in-protection.md).

### Aug-2023 (Build: 101.23062.0016  | Release version: 20.123062.16.0)

| Build:             | **101.23062.0016**    |
|--------------------|-----------------------|
| Release version:   | **20.123062.16.0**    |
| Engine version:    | **1.1.23050.3**       |
| Signature version: | **1.395.436.0**       |

#### What's new

- Product improvements and performance fixes
- Fix: macOS complains that uninstall background task is from unidentified developer

### Jul-2023 (Build: 101.23052.0004  | Release version: 20.123052.4.0)

| Build:             | **101.23052.0004**    |
|--------------------|-----------------------|
| Release version:   | **20.123052.4.0**     |
| Engine version:    | **1.1.20100.7**       |
| Signature version: | **1.391.2163.0**      |

#### What's new

- Client version schema change
- Fix: Defender doesn't start on a machine with certain versions of Microsoft Edge due to directory permission issue
- Product improvements and performance fixes

### Jun-2023 (Build: 101.98.84  | Release version: 20.123042.19884.0)

| Build:             | **101.98.84**         |
|--------------------|-----------------------|
| Release version:   | **20.123042.19884.0** |
| Engine version:    | **1.1.20300.4**       |
| Signature version: | **1.391.221.0**       |

#### What's new

- System Extensions health command `mdatp health --details system_extensions`
- Product improvements and performance fixes
- **(GA) Network protection available for macOS**

Network protection for macOS is now available for all Mac devices onboarded to Defender for Endpoint. Devices must meet the minimum requirements. To learn more, see [Use network protection to help prevent macOS connections to bad sites](network-protection-macos.md).

### May-2023 (Build: 101.98.71  | Release version: 20.123032.19871.0)

| Build:             | **101.98.71**         |
|--------------------|-----------------------|
| Release version:   | **20.123032.19871.0** |
| Engine version:    | **1.1.20300.4**       |
| Signature version: | **1.389.1872.0**      |

#### What's new

- Tamper Protection health command `mdatp health --details tamper_protection`
- Tamper Protection - [MDM processes exclusions](tamperprotection-macos.md#exclusions)
- Fix: Remove Codesigned Artifact from App Bundle
- Product improvements and performance fixes

### May-2023 (Build: 101.98.70  | Release version: 20.123022.19870.0)

| Build:             | **101.98.70**         |
|--------------------|-----------------------|
| Release version:   | **20.123022.19870.0** |
| Engine version:    | **1.1.20300.4**       |
| Signature version: | **1.389.1396.0**       |

#### What's new

- Product improvements and performance fixes

### Mar-2023 (Build: 101.98.30  | Release version: 20.123012.19830.0)

| Build:             | **101.98.30**         |
|--------------------|-----------------------|
| Release version:   | **20.123012.19830.0** |
| Engine version:    | **1.1.20100.6**       |
| Signature version: | **1.385.924.0**       |

#### What's new

- Product improvements and performance fixes

### Feb-2023 (Build: 101.97.94  | Release version: 20.123011.19794.0)

| Build:             | **101.97.94**         |
|--------------------|-----------------------|
| Release version:   | **20.123011.19794.0** |
| Engine version:    | **1.1.20000.2**       |
| Signature version: | **1.383.104.0**       |

#### What's new

- Improved performance, stability, and security
- Product improvements
- Discontinued support macOS Catalina [10.15]

### Jan-2023

#### What's new

- **(GA) Live Response available for macOS**

Live Response for macOS is now available for all Mac devices onboarded to Defender for Endpoint. Devices must meet the minimum requirements. To learn more, see  [Investigate entities on devices using live response](/defender-endpoint/live-response) 

### Nov-2022 (Build: 101.87.30 | Release version: 20.122082.18681.0)

&ensp;Released: **Nov 5, 2022**<br/>
&ensp;Published: **Nov 5, 2022**<br/>
&ensp;Build: **101.87.30**<br/>
&ensp;Release version: **20.122082.18681.0**<br/>
&ensp;Engine version: **1.1.19700.3**<br/>
&ensp;Signature version: **1.379.17.0**<br/>

**What's new**

- Fix for some users experiencing performance issues and temporary system hangs
- Product improvements and performance fixes

### Oct-2022 (Build: 101.86.81 | Release version: 20.122082.18681.0)

&ensp;Released: **Oct 25, 2022**<br/>
&ensp;Published: **Oct 25, 2022**<br/>
&ensp;Build: **101.86.81**<br/>
&ensp;Release version: **20.122082.18681.0**<br/>
&ensp;Engine version: **1.1.19700.3**<br/>
&ensp;Signature version: **1.377.636.0**<br/>

**What's new**

- Issue resolution: Upgrade fails if `\_mdatp` user a member of `\_lpadmin` group

> [!IMPORTANT]
> This is a minimal recommended MDE version for macOS Ventura.

### Oct-2022 (Build: 101.82.21  | Release version: 20.122082.18221.0)

&ensp;Build: **101.82.21**<br/>
&ensp;Release version: **20.122082.18221.0**<br/>
&ensp;Engine version: **1.1.19400.3**<br/>
&ensp;Signature version: **1.369.962.0**<br/>

**What's new**

- Fix - macOS TP in Block mode causing device hang on shutdown/crashes on reboot
- Add a mdatp command-line switch to view the on-demand scan history
- Improve Performance of Device Owner on macOS
- Ready for macOS Ventura (13.0)
- Fixes for product and performance issues

### Sep-2022 (Build: 101.78.13)

&ensp;Build: **101.78.13**<br/>
&ensp;Release version: **20.122072.17813.0**<br/>
&ensp;Engine version: **1.1.19500.2**<br/>
&ensp;Signature version: **1.373.556.0**<br/>

**What's new**

- Fix for uninstaller to properly delete Application Support folder
- Fix for Network Protection not filtering Safari when Firewall or iCloud Private Relay is on
- Fix for osqueryui zombie processes
- Fix for UI crash on Ventura
- Fix for definitions not getting downloaded right after install
- Other Product improvements

### Aug-2022 (Build: 101.75.90 | Release version: 20.122071.17590.0)

&ensp;Released: **Aug 3, 2022**<br/>
&ensp;Published: **Aug 3, 2022**<br/>
&ensp;Build: **101.75.90**<br/>
&ensp;Release version: **20.122071.17590.0**<br/>
&ensp;Engine version: **1.1.19300.3**<br/>
&ensp;Signature version: **1.369.395.0**<br/>

**What's new**

- Added a new field in the output of `mdatp health` that can be used to query the enforcement level of the network protection feature. The new field is called `network_protection_enforcement_level` and can take one of the following values: `audit`, `block`, or `disabled`.
- Addressed a product issue where multiple detections of the same content could lead to duplicate entries in the threat history.
- Other product improvements.

### Jul-2022 (Build: 101.73.77 | Release version: 20.122062.17377.0)

&ensp;Released: **Jul 21, 2022**<br/>
&ensp;Published: **Jul 21, 2022**<br/>
&ensp;Build: **101.73.77**<br/>
&ensp;Release version: **20.122062.17377.0**<br/>
&ensp;Engine version: **1.1.19200.3**<br/>
&ensp;Signature version: **1.367.1011.0**<br/>

**What's new**

- Addressed an issue where printing couldn't be completed successfully due to the network extension
- Added an option to [configure file hash computation](mac-preferences.md#configure-file-hash-computation-feature)
- From this build onwards, the product has the new anti-malware engine by default
- Performance improvements for file copy operations
- Product improvements

### Jul-2022 (Build: 101.71.18 | Release version: 20.122052.17118.0)

&ensp;Released: **Jul 7, 2022**<br/>
&ensp;Published: **Jul 7, 2022**<br/>
&ensp;Build: **101.71.18**<br/>
&ensp;Release version: **20.122052.17118.0**<br/>

**What's new**

- `mdatp connectivity test` added an extra URL. The new URL is [https://go.microsoft.com/fwlink/?linkid=2144709](https://go.microsoft.com/fwlink/?linkid=2144709).
- Up until now, the product log level didn't persist between product restarts. Beginning in this version, there's a new command-line tool switch that persists the log level. The new command is `mdatp log level persist --level <level>`.
- Resolved an issue in the product installation package that in rare cases could lead a loss of product state during updates
- Performance improvements for file copy operations and built-in macOS applications
- Product improvements

### Jun-2022 (Build: 101.70.19 | Release version: 20.122051.17019.0)

&ensp;Released: **Jun 14, 2022**<br/>
&ensp;Published: **Jun 14, 2022**<br/>
&ensp;Build: **101.70.19**<br/>
&ensp;Release version: **20.122051.17019.0**<br/>

**What's new**

- Resolved an issue where threat-related notifications weren't always presented to the end user.
- Performance improvements & other updates.

### Jun-2022 (Build: 101.70.18 | Release version: 20.122042.17018.0)

&ensp;Released: **Jun 2, 2022**<br/>
&ensp;Published: **Jun 2, 2022**<br/>
&ensp;Build: **101.70.18**<br/>
&ensp;Release version: **20.122042.17018.0**<br/>

**What's new**

- Resolved an issue where the installation package was sometimes hanging indefinitely during product updates
- Resolved an issue where the product sometimes was incorrectly detecting files inside the quarantine folder
- Performance improvements & other product improvements

### May-2022 (Build: 101.66.54 | Release version: 20.122041.16654.0)

&ensp;Released: **May 11, 2022**<br/>
&ensp;Published: **May 11, 2022**<br/>
&ensp;Build: **101.66.54**<br/>
&ensp;Release version: **20.122041.16654.0**<br/>

**What's new**

- Addressed an issue where `mdatp diagnostic real-time-protection-statistics` wasn't printing the correct process path in some cases.
- Product improvements

### Apr-2022 (Build: 101.64.15 | Release version: 20.122032.16415.0)

&ensp;Released: **Apr 26, 2022**<br/>
&ensp;Published: **Apr 26, 2022**<br/>
&ensp;Build: **101.64.15**<br/>
&ensp;Release version: **20.122032.16415.0**<br/>

**What's new**

- Fixed a regression introduced in version 101.61.69 where the status menu icon was sometimes showing an error icon, even though no action was required from the end user
- Improved the `conflicting_applications` field in `mdatp health` to show only the most recent 10 processes and also to include the process names. This improvement makes it easier to identify which processes are potentially conflicting with Microsoft Defender for Endpoint for macOS.
- Resolved an issue in `mdatp device-control removable-media policy list` where vendor ID and product ID were displayed as decimal instead of hexadecimal
- Performance improvements & other product improvements

### Mar-2022 (Build: 101.61.69 | Release version: 20.122022.16169.0)

&ensp;Released: **Mar 25, 2022**<br/>
&ensp;Published: **Mar 25, 2022**<br/>
&ensp;Build: **101.61.69**<br/>
&ensp;Release version: **20.122022.16169.0**<br/>

**What's new**

- Product improvements

### Mar-2022 (Build: 101.60.91 | Release version: 20.122021.16091.0)

&ensp;Released: **Mar 8, 2022**<br/>
&ensp;Published: **Mar 8, 2022**<br/>
&ensp;Build: **101.60.91**<br/>
&ensp;Release version: **20.122021.16091.0**<br/>

**What's new**

- This version contains a security update for [CVE-2022-23278](https://msrc-blog.microsoft.com/2022/03/guidance-for-cve-2022-23278-spoofing-in-microsoft-defender-for-endpoint/)

### Feb-2022 (Build: 101.59.50 | Release version: 20.122021.15950.0)

&ensp;Released: **Feb 28, 2022**<br/>
&ensp;Published: **Feb 28, 2022**<br/>
&ensp;Build: **101.59.50**<br/>
&ensp;Release version: **20.122021.15950.0**<br/>

**What's new**

- This version adds support for macOS 12.3. Starting with macOS 12.3, [Apple is removing Python 2.7](https://developer.apple.com/documentation/macos-release-notes/macos-12_3-release-notes). There's no Python version preinstalled on macOS by default. **ACTION NEEDED**:
  - Users must update Microsoft Defender for Endpoint for Mac to version 101.59.50 (or newer) before updating their devices to macOS Monterey 12.3 (or newer). This minimal version 101.59.50 is a prerequisite to eliminating Python-related issues with Microsoft Defender for Endpoint for macOS devices on macOS Monterey.
  - For remote deployments, existing MDM setups must be updated to Microsoft Defender for Endpoint for macOS version 101.59.50 (or newer). Pushing via MDM an older Microsoft Defender for Endpoint for macOS version to macOS Monterey 12.3 (or newer) results in an installation failure.

### Feb-2022 (Build: 101.59.10 | Release version: 20.122012.15910.0)

&ensp;Released: **Feb 22, 2022**<br/>
&ensp;Published: **Feb 22, 2022**<br/>
&ensp;Build: **101.59.10**<br/>
&ensp;Release version: **20.122012.15910.0**<br/>

**What's new**

- The command-line tool now supports restoring quarantined files to a location other than the one where the file was originally detected. Restoration can be done through `mdatp threat quarantine restore --id [threat-id] --path [destination-folder]`.
- Extended device control to handle devices connected over Thunderbolt 3
- Improved the handling of device control policies containing invalid vendor IDs and product IDs. Before this version, if the policy contained one or more invalid IDs, the entire policy was ignored. Beginning with this version, only the invalid portions of the policy are ignored. Issues with the policy are surfaced through `mdatp device-control removable-media policy list`.
- Product improvements

### Feb-2022 (Build: 101.56.62 | Release version: 20.121122.15662.0)

&ensp;Released: **Feb 7, 2022**<br/>
&ensp;Published: **Feb 7, 2022**<br/>
&ensp;Build: **101.56.62**<br/>
&ensp;Release version: **20.121122.15662.0**<br/>

**What's new**

- Product improvements

### Jan-2022 (Build: 101.56.35 | Release version: 20.121121.15635.0)

&ensp;Released: **Jan 30, 2022**<br/>
&ensp;Published: **Jan 30, 2022**<br/>
&ensp;Build: **101.56.35**<br/>
&ensp;Release version: **20.121121.15635.0**<br/>

**What's new**

- The application is renamed from *Microsoft Defender ATP* to *Microsoft Defender*. End users observe the following changes:
   - The application installation path changed from `/Application/Microsoft Defender ATP.app` to `/Applications/Microsoft Defender.app`.
   - Within the user experience, occurrences of *Microsoft Defender ATP* are replaced by *Microsoft Defender*
- Resolved an issue where some VPN applications couldn't connect due to the network content filter that is distributed with Microsoft Defender for Endpoint for macOS.
- Addressed an issue discovered in macOS 12.2 preview 2 where the installation package couldn't be opened due to a change in the operating system (OS) that prevents installation of packages with certain characteristics. While it appears that this OS change isn't included in the final release of macOS 12.2, it's likely that it will be reintroduced in a future macOS version. As such, we encourage all enterprise administrators to refresh the Microsoft Defender for Endpoint package in their management console to this product version (or a newer version).
- Addressed an issue seen on some M1 devices where the product was stuck with invalid anti-malware definitions and couldn't successfully update to a working set of definitions.
- `mdatp health` output has been extended with a more attribute called `full_disk_access_enabled` that can be used to determine whether Full Disk Access has been granted to all components of Microsoft Defender for Endpoint for macOS.
- Performance improvements & Product improvements

### Jan-2022 (Build: 101.54.16 | Release version: 20.121111.15416.0)

&ensp;Released: **Jan 12, 2022**<br/>
&ensp;Published: **Jan 12, 2022**<br/>
&ensp;Build: **101.54.16**<br/>
&ensp;Release version: **20.121111.15416.0**<br/>

**What's new**

- macOS 10.14 (Mojave) is no longer supported
- After a product setting stops being managed by the administrator through MDM, it now reverts to the value it had before it was managed (the value configured locally by the end user or, if no such local value was explicitly provided, the default value used by the product). Prior to this change, after a setting stopped being managed, its managed value persisted and was still used by the product.
- Performance improvements & Product improvements

### Nov-2021 (Build: 101.49.25)

&ensp;Build: **101.49.25**<br/>
&ensp;Release version: **20.121092.14925.0** <br/>

**What's new**

- Added a new switch to the command-line tool to control whether archives are scanned during on-demand scans. This can be configured through `mdatp config scan-archives --value [enabled/disabled]`. By default, this is set to enabled.
- Product improvements

### Oct-2021 (Build: 101.47.27)

&ensp;Build: **101.47.27**<br/>
&ensp;Release version: **20.121082.14727.0** <br/>

**What's new**

- Fix for a system freeze occurring on shutdown on macOS Mojave and macOS Catalina. 

### Oct-2021 (Build: 101.43.84)

&ensp;Build: **101.43.84**<br/>
&ensp;Release version: **20.121082.14384.0** <br/>

**What's new**

- Candidate build for macOS 12 (Monterey)
- Product improvements

### Sep-2021 (Build: 101.41.10)

&ensp;Build: **101.41.10**<br/>
&ensp;Release version: **20.121072.14110.0** <br/>

**What's new**

- Added new switches to the command-line tool:
  - Control degree of parallelism for on-demand scans. This can be configured through `mdatp config maximum-on-demand-scan-threads --value [number-between-1-and-64]`. By default, a degree of parallelism of 2 is used.
  - Control whether scans after security intelligence updates are enabled or disabled. This can be configured through `mdatp config scan-after-definition-update --value [enabled/disabled]`. By default, this is set to enabled.
- Changing the product log level now requires elevation.
- Performance improvements & Product improvements

### Aug-2021 (Build: 101.40.84)

&ensp;Build: **101.40.84**<br/>
&ensp;Release version: **20.121071.14084.0** <br/>

**What's new**

- M1 chip native support
- Performance improvements & Product improvements

### Jul-2021 (Build: 101.37.97)

&ensp;Build: **101.37.97**<br/>
&ensp;Release version: **20.121062.13797.0** <br/>

**What's new**

- Performance improvements & Product improvements

### Jun-2021 (Build: 101.34.28)

&ensp;Build: **101.34.28**<br/>
&ensp;Release version: **20.121061.13428.0** <br/>

**What's new**

- Product improvements

### Jun-2021 (Build: 101.34.27)

&ensp;Build: **101.34.27**<br/>
&ensp;Release version: **20.121052.13427.0** <br/>

**What's new**

- Product improvements

### May-2021 (Build: 101.34.20)

&ensp;Build: **101.34.20**<br/>
&ensp;Release version: **20.121051.13420.0** <br/>

**What's new**

- [Device control for macOS](mac-device-control-overview.md) is now in general availability.
- Addressed an issue where a quick scan couldn't be started from the status menu on macOS 11 (Big Sur).
- Other Product improvements

### Apr-2021 (Build: 101.32.69)

&ensp;Build: **101.32.69**<br/>
&ensp;Release version: **20.121042.13269.0** <br/>

**What's new**

- Addressed an issue where concurrent access to the keychain from Microsoft Defender for Endpoint and other applications can lead to keychain corruption.

### Mar-2021 (Build: 101.29.64)

&ensp;Build: **101.29.64**<br/>
&ensp;Release version: **20.121042.12964.0** <br/>

**What's new**

- Starting with this version, threats detected during on-demand antivirus scans triggered through the command-line client are automatically remediated. Threats detected during scans triggered through the user interface still require manual action.
- `mdatp diagnostic real-time-protection-statistics` now supports two other switches:
  - `--sort`: sorts the output descending by total number of files scanned
  - `--top N`: displays the top N results (only works if `--sort` is also specified)
- Performance improvements (specifically for when `YARN` is used) & Product improvements

### Feb-2021 (Build: 101.27.50)

&ensp;Build: **101.27.50**<br/>
&ensp;Release version: **20.121022.12750.0** <br/>

**What's new**

- Fix to accommodate for Apple certificate expiration for macOS Catalina and earlier. This fix restores Microsoft Defender Vulnerability Management (MDVM) functionality. 

### Feb-2021 (Build: 101.25.69)

&ensp;Build: **101.25.69**<br/>
&ensp;Release version: **20.121022.12569.0** <br/>

**What's new**

- Microsoft Defender for Endpoint on macOS is now available in preview for US Government customers. For more information, see [Microsoft Defender for Endpoint for US Government customers](gov.md).
- Performance improvements (specifically for the situation when the XCode Simulator app is used) & Product improvements.

### Jan-2021 (Build: 101.23.64)

&ensp;Build: **101.23.64**<br/>
&ensp;Release version: **20.121021.12364.0** <br/>

**What's new**

- Added a new option to the command-line tool to view information about the last on-demand scan. To view information about the last on-demand scan, run `mdatp health --details antivirus`.
- Performance improvements & Product improvements

### Dec-2020 (Build: 101.22.79)

&ensp;Build: **101.22.79**<br>
&ensp;Release version: **20.121012.12279.0**<br>

**What's new**

- Performance improvements & Product improvements

### Nov-2020 (Build: 101.19.88)

&ensp;Build: **101.19.88**<br>
&ensp;Release version: **20.121011.11988.0**<br>

**What's new**

- Performance improvements & Product improvements

### Nov-2020 (Build: 101.19.48)

&ensp;Build: **101.19.48**<br>
&ensp;Release version: **20.120121.11948.0**<br>

**What's new**

> [!NOTE]
> The old command-line tool syntax has been deprecated with this release. For information on the new syntax, see [Resources](mac-resources.md#configuring-from-the-command-line).
- Added a new command-line switch to disable the network extension: `mdatp system-extension network-filter disable`. This command can be useful to troubleshoot networking issues that could be related to Microsoft Defender for Endpoint on Mac.
- Performance improvements & Product improvements

### Oct-2020 (Build: 101.19.21)

&ensp;Build: **101.19.21**<br>
&ensp;Release version: **20.120101.11921.0** <br>

**What's new**

- Product improvements

### Oct-2020 (Build: 101.15.26)

&ensp;Build: **101.15.26**<br>
&ensp;Release version: **20.120102.11526.0**<br>

**What's new**

- Improved the reliability of the agent when running on macOS 11 Big Sur.
- Added a new command-line switch (`--ignore-exclusions`) to ignore AV exclusions during custom scans (`mdatp scan custom`).
- Performance improvements & Product improvements

### Sep-2020 (Build: 101.13.75)

&ensp;Build: **101.13.75**<br>
&ensp;Release version: **20.120101.11375.0**<br>

**What's new**

- Removed conditions when Microsoft Defender for Endpoint was triggering a macOS 11 (Big Sur) issue that manifests into a kernel panic.
- Fixed a memory leak in the Endpoint Security system extension when running on macOS 11 (Big Sur).
- Product improvements

### Aug-2020 (Build: 101.10.72) 

&ensp;Build: **101.10.72** <br>

**What's new**

- Product improvements

### Jul-2020 (Build: 101.09.61)

&ensp;Build: **101.09.61**<br>

**What's new**

- Added a new managed preference for [disabling the option to send feedback](mac-preferences.md#show--hide-option-to-send-feedback).
- Status menu icon now shows a healthy state when the product settings are managed. Previously, the status menu icon was displaying a warning or error state, even though the product settings were managed by the administrator.
- Performance improvements & Product improvements

### Jul-2020 (Build: 101.09.50)

&ensp;Build: **101.09.50**<br>

**What's new**

- This product version is validated on macOS Big Sur 11 preview 9.
- The new syntax for the mdatp command-line tool is now the default one. For more information on the new syntax, see [Resources for Microsoft Defender for Endpoint on macOS](mac-resources.md#configuring-from-the-command-line).
> [!NOTE]
> The old command-line tool syntax will be removed from the product on **January 1st, 2021**.
- Extended `mdatp diagnostic create` with a new parameter (`--path [directory]`) that allows the diagnostic logs to be saved to a different directory.
- Performance improvements & Product improvements

### Jul-2020 (Build: 101.09.49)

&ensp;Build: **101.09.49**<br>

**What's new**

- User interface improvements to differentiate exclusions that are managed by the IT administrator versus exclusions defined by the local user.
- Improved CPU utilization during on-demand scans.
- Performance improvements & Product improvements

### Jun-2020 (Build: 101.07.23)

&ensp;Build: **101.07.23**<br>

**What's new**

- Added new fields to the output of `mdatp --health` for checking the status of passive mode and the EDR group ID.

  > [!NOTE]
  > `mdatp --health` will be replaced with `mdatp health` in a future product update.

- Resolved an issue where automatic sample submission wasn't marked as managed in the user interface.
- Added new settings for controlling the retention of items in the antivirus scan history. You can now [specify the number of days to retain items in the scan history](mac-preferences.md#antivirus-scan-history-retention-in-days) and [specify the maximum number of items in the scan history](mac-preferences.md#maximum-number-of-items-in-the-antivirus-scan-history).
- Product improvements

### May-2020 (Build: 101.06.63)

&ensp;Build: **101.06.63**<br>

**What's new**

- Addressed a performance regression introduced in version `101.05.17`. The regression was introduced with the fix to eliminate the kernel panics some customers observed when accessing SMB shares. We reverted this code change and are investigating alternative ways to eliminate the kernel panics.

### May-2020 (Build: 101.05.17)

&ensp;Build: **101.05.17**<br>

**What's new**

> [!IMPORTANT]
> We're working on a new and enhanced syntax for the `mdatp` command-line tool. The new syntax is currently the default in the Insider Fast and Insider Slow update channels. We encourage you to familiarize yourself with this new syntax.
> We continue supporting the old syntax in parallel with the new syntax and provide more communications around the deprecation plan for the old syntax in the upcoming months.
- Addressed a kernel panic that occurred sometimes when accessing SMB file shares.
- Performance improvements & Product improvements

### Apr-2020 (Build: 101.05.16)

&ensp;Build: **101.05.16**<br>

**What's new**

- Improvements to quick scan logic to significantly reduce the number of scanned files.
- Added [autocompletion support](mac-resources.md#how-to-enable-autocompletion) for the command-line tool.
- Product improvements

### Mar-2020 (Build: 101.03.12)

&ensp;Build: **101.03.12**<br>

**What's new**

- Performance improvements & Product improvements

### Feb-2020 (Build: 101.01.54)

&ensp;Build: **101.01.54**<br>

**What's new**

- Improvements around compatibility with Time Machine
- Accessibility improvements
- Performance improvements & Product improvements

### Jan-2020 (Build: 101.00.31)

&ensp;Build: **101.00.31**<br>

**What's new**

- Improved [product onboarding experience for Intune users](/mem/intune/apps/apps-advanced-threat-protection-macos)
- Antivirus [exclusions now support wildcards](mac-exclusions.md#supported-exclusion-types)
- Added the ability to trigger antivirus scans from the macOS contextual menu. You can now right-click a file or a folder in Finder and select **Scan with Microsoft Defender for Endpoint**.
- In-place product downgrades are now explicitly disallowed by the installer. If you need to downgrade, first uninstall the existing version and reconfigure your device.
- Other performance improvements & Product improvements

### 2019 releases (Build: 100.90.27)

&ensp;Build: **100.90.27**<br>

**What's new**

- You can now [set an update channel](mac-updates.md#set-the-channel-name) for Microsoft Defender for Endpoint on macOS that is different from the system-wide update channel.
- New product icon
- Other user experience improvements
- Product improvements

### 2019 releases (Build: 100.86.92)

&ensp;Build: **100.86.92**<br>

**What's new**

- Improvements around compatibility with Time Machine
- Addressed an issue where the product was sometimes not cleaning all files under `/Library/Application Support/Microsoft/Defender` during uninstallation.
- Reduced the CPU utilization of the product when Microsoft products are updated through Microsoft AutoUpdate.
- Other performance improvements & Product improvements

### 2019 releases (Build: 100.86.91)

&ensp;Build: **100.86.91**<br>

**What's new**

> [!CAUTION]
> To ensure the most complete protection for your macOS devices and in alignment with Apple stopping delivery of macOS native security updates to OS versions older than [current - 2], MDATP for macOS deployment and updates will no longer be supported on macOS Sierra [10.12]. MDATP for macOS updates and enhancements are delivered to devices running versions Catalina [10.15], Mojave [10.14], and High Sierra [10.13].
>
> If you already have MDATP for macOS devices deployed to your Sierra [10.12] devices, upgrade to the latest macOS version to eliminate risks of losing protection.

- Performance improvements & Product improvements

### 2019 releases (Build: 100.83.73)

&ensp;Build: **100.83.73**<br>

**What's new**

- Added more controls for IT administrators around [management of exclusions](mac-preferences.md#exclusion-merge-policy), [management of threat type settings](mac-preferences.md#threat-type-settings-merge-policy), and [disallowed threat actions](mac-preferences.md#disallowed-threat-actions).
- When Full Disk Access isn't enabled on the device, a warning is now displayed in the status menu.
- Performance improvements & Product improvements

### 2019 releases (Build: 100.82.60)

&ensp;Build: **100.82.60**<br>

**What's new**

- Addressed an issue where the product fails to start following a definition update.

### 2019 releases (Build: 100.80.42)

&ensp;Build: **100.80.42**<br>

**What's new**

- Product improvements

### 2019 releases (Build: 100.79.42)

&ensp;Build: **100.79.42**<br>

**What's new**

- Fixed an issue where Microsoft Defender for Endpoint on macOS was sometimes interfering with Time Machine.
- Added a new switch to the command-line utility for testing the connectivity with the backend service

   ```bash
   mdatp connectivity test
   ```

- Added ability to view the full threat history in the user interface (can be accessed from the **Protection history** view).
- Performance improvements & Product improvements

### 2019 releases (Build: 100.72.15)

&ensp;Build: **100.72.15**<br>

**What's new**

- Product improvements

### 2019 releases (Build: 100.70.99)

&ensp;Build: **100.70.99**<br>

**What's new**

- Addressed an issue that impacts the ability of some users to upgrade to macOS Catalina when real-time protection is enabled. This sporadic issue was caused by Microsoft Defender for Endpoint locking files within Catalina upgrade package while scanning them for threats, which led to failures in the upgrade sequence.

### 2019 releases (Build: 100.68.99)

&ensp;Build: **100.68.99**<br>

**What's new**

- Added the ability to configure the antivirus functionality to run in [passive mode](mac-preferences.md#enforcement-level-for-antivirus-engine).
- Performance improvements & Product improvements

### 2019 releases (Build: 100.65.28)

&ensp;Build: **100.65.28**<br>

**What's new**

- Added support for macOS Catalina.

> [!CAUTION]
> macOS 10.15 (Catalina) contains new security and privacy enhancements. Beginning with this version, by default, applications aren't able to access certain locations on disk (such as Documents, Downloads, Desktop, etc.) without explicit consent. In the absence of this consent, Microsoft Defender for Endpoint isn't able to fully protect your device.
> > The mechanism for granting this consent depends on how you deployed Microsoft Defender for Endpoint:
> - For manual deployments, see the updated instructions in the [Manual deployment article](mac-install-manually.md#allow-full-disk-access).
- For managed deployments, see the updated instructions in the [JAMF-based deployment](mac-install-with-jamf.md) and [Microsoft Intune-based deployment](mac-install-with-intune.md#create-system-configuration-profiles) articles.

- Performance improvements & Product improvements

---

## Linux release notes archive

Entries older than Aug 2025 (builds older than 101.25062.0003).

### July-2025 Build: 101.25052.0007 | Release version: 30.125052.0007.0

|Build:             |**101.25052.0007**    |
|-------------------|----------------------|
|Released:          |**July 22, 2025**     |
|Published:         |**July 22, 2025**     |
|Release version:   |**30.125052.0007.0**  |
|Engine version:    |**1.1.25020.4000**    |
|Signature version: |**1.427.370.0**       |

#### What's new
- Fixed issue to generate unique Machine identifiers to ensure each onboarded device is uniquely identified.
- Other stability improvements and bug fixes.

### June-2025 Build: 101.25042.0003 | Release version: 30.125042.0003.0

|Build:             |**101.25042.0003**    |
|-------------------|----------------------|
|Released:          |**June 30, 2025**     |
|Published:         |**June 30, 2025**     |
|Release version:   |**30.125042.0003.0**  |
|Engine version:    |**1.1.25020.4000**    |
|Signature version: |**1.427.370.0**       |

#### What's new
- The Defender for Endpoint package rollout into production happens gradually. From the time the release notes are published, it might take up to a week for the package to be pushed to all production machines.
- Removed external dependency of uuid-runtime from the Defender for Endpoint package
- Other stability improvements and bug fixes

### May-2025 Build: 101.25032.0010 | Release version: 30.125032.0010.0

|Build:             |**101.25032.0010**    |
|-------------------|----------------------|
|Released:          |**May 23, 2025**      |
|Published:         |**May 23, 2025**      |
|Release version:   |**30.125032.0010.0**  |
|Engine version:    |**1.1.25020.4000**    |
|Signature version: |**1.427.370.0**       |

#### What's new

- Removed external dependency of MDE Netfilter and libpcre from MDE package
  
- Fix for Python script executing unverified binaries with root-level privileges to identify Java processes using outdated versions of log4j (CVE-2025-26684) has been addressed.
  
- Added detection mechanism for CVE-2025-31324 affecting the "Visual Composer" component of the SAP NetWeaver application server.

### April-2025 Build: 101.25022.0002 | Release version: 30.125022.0001.0

|Build:             |**101.25022.0002**    |
|-------------------|----------------------|
|Released:          |**April 07, 2025**    |
|Published:         |**April 07, 2025**    |
|Release version:   |**30.125022.0001.0**  |
|Engine version:    |**1.1.24090.13**      |
|Signature version: |**1.421.226.0**       |

#### What's new

- mdatp diagnostic ebpf-statistics command requires sudo privilege now

- Manage dynamic signature file share source by setting URL and update interval

- Other stability improvements and bug fixes

- Support for ARM64 Linux servers 

### Mar-2025 Build: 101.25012.0000 | Release version: 30.125012.0000.0

| Build:            | **101.25012.0000**   |
|-------------------|----------------------|
|Released:          | **March 11, 2025**   |
|Published:         | **March 11, 2025**   |
|Release version:   | **30.125012.0000.0** |
|Engine version:    | **1.1.24090.13**     |
|Signature version: | **1.421.226.0**      |

#### What's new

- The MDATP package rollout into production will be done gradually. From the time the release notes are published, it might take up to a week for the package to be pushed to all production machines.

- The vulnerability in curl, CVE-2024-7264, has been addressed.

- Other stability improvements and bug fixes.

##### Known Issues

- There's a known issue where MDE is deleting the configuration file located at /etc/systemd/system/mdatp.service.d on each service start. As a workaround, customers can use the Immutable attribute that prevents the files from being modified or deleted.

  To set the file to be unmodifiable, execute the following command:
  
```bash

  sudo chattr +i /etc/systemd/system/mdatp.service.d/[file name]
  ```
  
 This command makes the file unchangeable. If you need to restore modification permissions, use the following command:

  ```bash
  
  sudo chattr -i /etc/systemd/system/mdatp.service.d/[file name]
  ```
  
  Note that the chattr command can only be used on supported file systems, such as ext4.
  
 If you need further assistance, you can reach out to our support team with your organization ID, and we can implement a temporary mitigation to prevent deletion. A permanent fix for this issue is available in MDE version 101.25032.0000.

### Feb-2025 Build: 101.24122.0008 | Release version: 30.124112.0008.0

| Build:             | **101.24122.0008**    |
|--------------------|-----------------------|
| Released:          | **February 20, 2025** |
| Published:         | **February 20, 2025** |
| Release version:   | **30.124122.0008.0**  |
| Engine version:    | **1.1.24090.13**      |
| Signature version: | **1.421.226.0**       |

#### What's new

- The MDATP package `101.24122.0008` is rolling out gradually for each distribution.
- Other stability improvements and bug fixes

### Feb-2025 Build: 101.24112.0003 | Release version: 30.124112.0003.0

| Build:             | **101.24112.0003**    |
|--------------------|-----------------------|
| Released:          | **February 04, 2025** |
| Published:         | **February 04, 2025** |
| Release version:   | **30.124112.0003.0**  |
| Engine version:    | **1.1.24090.13**      |
| Signature version: | **1.421.1681.0**      |

#### What's new

- Fixed a bug that incorrectly reported the DefenderEngineVersion to the security portal.
- The MDATP package `101.24112.0003` is rolling out gradually for each distribution.

### Jan-2025 Build: 101.24112.0001 | Release version: 30.124112.0001.0

| Build:             | **101.24112.0001**    |
|--------------------|-----------------------|
| Released:          | **January 13, 2025** |
| Published:         | **January 13, 2025** |
| Release version:   | **30.124112.0001.0** |
| Engine version:    | **1.1.24090.13**       |
| Signature version: | **1.421.226.0**      |

#### What's new

- Upgraded the Bond version to 13.0.1 to address security vulnerabilities in versions 12 or lower.

- Mdatp package no longer has a dependency on SELinux packages.
  
- Users can now query the status of supplementary event provider eBPF using the threat hunting query in `DeviceTvmInfoGathering`. To learn more about this query check: [Use eBPF-based sensor for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-ebpf). The result of this query can return the following two values as eBPF status:
  - Enabled: When eBPF is enabled as working as expected.
  - Disabled: When eBPF is disabled due to one of the following reasons:
    - When MDE is using auditD as a supplementary sensor
    - When eBPF isn't present and we fall back to Net link as supplementary event provider
    - There's no supplementary sensor present.

- Beginning with 2411, the MDATP package release to Production on `packages.microsoft.com` follows a gradual rollout mechanism which spans over a week. The other release rings, insiderFast, and insiderSlow, are unaffected by this change.

- Stability and performance improvements.

- Critical bugs fixes around definition update flow.

### Jan-2025 Build: 101.24102.0000 | Release version: 30.124102.0000.0

| Build:             | **101.24102.0000**    |
|--------------------|-----------------------|
| Released:          | **January 8, 2025** |
| Published:         | **January 8, 2025** |
| Release version:   | **30.124102.0000.0** |
| Engine version:    | **1.1.24080.11**       |
| Signature version: | **1.419.351.0**      |

#### What's new

- The default engine version has been updated to `1.1.24080.11`, and the default signature version has been updated to `1.419.351.0`.

- Improved the reporting of command-line threat information for short lived processes on the security portal.

### Nov-2024 Build: 101.24092.0002 | Release version: 30.124092.0002.0

| Build:             | **101.24092.0002**    |
|--------------------|-----------------------|
| Released:          | **November 14, 2024** |
| Published:         | **November 14, 2024** |
| Release version:   | **30.124092.0002.0** |
| Engine version:    | **1.1.24080.9**       |
| Signature version: | **1.417.659.0**      |

#### What's new

- To support hardened installations with nonexecutable `/var` partitions, mdatp antivirus definitions now install to `/opt/microsoft/mdatp/definitions.noindex` instead of `/var` if the latter is detected as nonexecutable. During upgrades, the installer attempts to migrate older definitions to the new path upon detecting a nonexecutable `/var`, unless it finds that the path has already been customized (using `mdatp definitions path set`).

- Beginning with this version, Defender for Endpoint on Linux no longer needs executable permissions for `/var/log`. If these permissions aren't available, log files are automatically redirected to `/opt`.

### Oct-2024 Build: 101.24082.0004 | Release version: 30.124082.0004.0

| Build:             | **101.24082.0004**         |
|--------------------|-----------------------|
| Released:          | **October 15, 2024** |
| Published:         | **October 15, 2024** |
| Release version:   | **30.124082.0004** |
| Engine version:    | **1.1.24080.9**       |
| Signature version: | **1.417.659.0**      |

#### What's new

- Starting with this version, Defender for Endpoint on Linux no longer supports `AuditD` as a supplementary event provider. For improved stability and performance, we have transitioned to eBPF. If you disable eBPF, or in the event eBPF isn't supported on any specific kernel, Defender for Endpoint on Linux automatically switches back to Net link as a fallback supplementary event provider. Net link provides reduced functionality and tracks only process-related events. In this case, all process operations continue to flow seamlessly, but you could miss specific file and socket-related events that eBPF would otherwise capture. For more information, see [Use eBPF-based sensor for Microsoft Defender for Endpoint on Linux](linux-support-ebpf.md). If you have any concerns or need assistance during this transition, contact support.

- Stability and performance improvements

- Other bug fixes

### Sept-2024 Build: 101.24072.0001 | Release version: 30.124072.0001.0

| Build:             | **101.24072.0001**         |
|--------------------|-----------------------|
| Released:          | **September 23, 2024** |
| Published:         | **September 23, 2024** |
| Release version:   | **30.124072.0001.0** |
| Engine version:    | **1.1.24060.6**       |
| Signature version: | **1.415.228.0**      |

#### What's new

- Added support for Ubuntu 24.04

- Updated default engine version to `1.1.24060.6` and default signatures version to `1.415.228.0`.

### July-2024 Build: 101.24062.0001 | Release version: 30.124062.0001.0

| Build:             | **101.24072.0001**         |
|--------------------|-----------------------|
| Released:          | **July 31, 2024** |
| Published:         | **July 31, 2024** |
| Release version:   | **30.124062.0001.0** |
| Engine version:    | **1.1.24050.7**       |
| Signature version: | **1.411.410.0**      |

#### What's new

There are multiple fixes and new changes in this release.

- Fixes bug in which infected command-line threat information wasn't showing correctly in security portal.

- Fixes a bug where disabling a preview feature required a Defender of Endpoint to disable it.

- Global Exclusions feature using managed JSON is now in Public Preview. available in insiders slow from 101.23092.0012. For more information, see [linux-exclusions](linux-exclusions.md).

- Updated the Linux default engine version to 1.1.24050.7 and default signature version to 1.411.410.0.

- Stability and performance improvements.

- Other bug fixes.

### June-2024 Build: 101.24052.0002 | Release version: 30.124052.0002.0

| Build:             | **101.24052.0002**         |
|--------------------|-----------------------|
| Released:          | **June 24, 2024** |
| Published:         | **June 24, 2024** |
| Release version:   | **30.124052.0002.0** |
| Engine version:    | **1.1.24040.2**       |
| Signature version: | **1.411.153.0**      |

#### What's new

There are multiple fixes and new changes in this release.

- This release fixes a bug related to high memory usage eventually leading to high CPU due to eBPF memory leak in kernel space resulting in servers going into unusable states. This only affected the kernel versions 3.10x and <= 4.16x, majorly on RHEL/CentOS distros. Update to the latest MDE version to avoid any impact.

- We have now simplified the output of `mdatp health --detail features`

- Stability and performance improvements.

- Other bug fixes.

### May-2024 Build: 101.24042.0002 | Release version: 30.124042.0002.0

| Build:             | **101.24042.0002**         |
|--------------------|-----------------------|
| Released:          | **May 29, 2024** |
| Published:         | **May 29, 2024** |
| Release version:   | **30.124042.0002.0** |
| Engine version:    | **1.1.24030.4**       |
| Signature version: | **1.407.521.0**      |

#### What's new

There are multiple fixes and new changes in this release:

- In version 24032.0007, there was a known issue where the enrollment of devices to MDE Security Management failed when using the "Device Tagging" mechanism via the mdatp_managed.json file. This issue has been resolved in the current release.

- Stability and performance improvements.

- Other bug fixes.

### May-2024 Build: 101.24032.0007 | Release version: 30.124032.0007.0

| Build:             | **101.24032.0007**         |
|--------------------|-----------------------|
| Released:          | **May 15, 2024** |
| Published:         | **May 15, 2024** |
| Release version:   | **30.124032.0007.0** |
| Engine version:    | **1.1.24020.3**       |
| Signature version: | **1.403.3500.0**      |

#### What's new

There are multiple fixes and new changes in this release:

- In passive and on-demand modes, antivirus engine remains in idle state and is used only during scheduled custom scans. Thus as part of performance improvements, we have made changes to keep the AV engine down  in passive and on-demand mode except during scheduled custom scans. If the real time protection is enabled, antivirus engine will always be up and running. This has no impact on your server protection in any mode.
 
  To keep users informed of the state of antivirus engine, we have introduced a new field called "engine_load_status" as part of MDATP health. It indicates whether antivirus engine is currently running or not.

  | `Field name` | `engine_load_status` | 
  |---|---|
  | Possible values | Engine not loaded (AV engine process is down),  Engine load succeeded (AV engine process up and running) | 

  Healthy scenarios:
    - If RTP is enabled, engine_load_status should be "Engine load succeeded"
    - If MDE is in on-demand or passive mode, and custom scan isn't running then "engine_load_status" should be "Engine not loaded"
    - If MDE is in on-demand or passive mode, and custom scan is running then "engine_load_status" should be "Engine load succeeded"    

- Bug fix to enhance behavioral detections.

- Stability and performance improvements.

- Other bug fixes.

#### Known Issues

- There's a known issue where enrolling devices to MDE Security Management via "Device Tagging" mechanism using mdatp_managed.json is failing in 24032.0007. To mitigate this issue, use the following mdatp CLI command to tag devices:

   ```bash
   sudo mdatp edr tag set --name GROUP --value MDE-Management
   ```
    **The issue has been fixed in Build: 101.24042.0002**

### March-2024 Build: 101.24022.0001 | Release version: 30.124022.0001.0

| Build:             | **101.24022.0001**         |
|--------------------|-----------------------|
| Released:          | **March 22,2024** |
| Published:         | **March 22,2024** |
| Release version:   | **30.124022.0001.0** |
| Engine version:    | **1.1.23110.4**       |
| Signature version: | **1.403.87.0**      |

#### What's new

There are multiple fixes and new changes in this release:

- The addition of a new log file - `microsoft_defender_scan_skip.log`. This logs the filenames that were skipped from various antivirus scans by Microsoft Defender for Endpoint due to any reason.

- Stability and performance improvements.

- Bug fixes.

### March-2024 Build: 101.24012.0001 | Release version: 30.124012.0001.0

| Build:             | **101.24012.0001**         |
|--------------------|-----------------------|
| Released:          | **March 12,2024** |
| Published:         | **March 12,2024** |
| Release version:   | **30.124012.0001.0** |
| Engine version:    | **1.1.23110.4**       |
| Signature version: | **1.403.87.0**      |

#### What's new

There are multiple fixes and new changes in this release:

- Updated default engine version to `1.1.23110.4`, and default signatures version to `1.403.87.0`.

- Stability and performance improvements.

- Bug fixes.

### February-2024 Build: 101.23122.0002 | Release version: 30.123122.0002.0

| Build:             | **101.23122.0002**         |
|--------------------|-----------------------|
| Released:          | **February 5,2024** |
| Published:         | **February 5,2024** |
| Release version:   | **30.123122.0002.0** |
| Engine version:    | **1.1.23100.2010**       |
| Signature version: | **1.399.1389.0**      |

#### What's new

There are multiple fixes and new changes in this release:

- Updated default engine version to `1.1.23100.2010`, and default signatures version to `1.399.1389.0`.

- General stability and performance improvements.

- Bug fixes.

- Microsoft Defender for Endpoint on Linux now officially supports the following distros and versions:

   | Distro & version | Ring | Package |
   |---|---|---|
   | Mariner 2 | Production | https://packages.microsoft.com/cbl-mariner/2.0/prod/extras/x86_64/config.repo |
   | Rocky 8.7 and higher | Insiders Slow | https://packages.microsoft.com/config/rocky/8/insiders-slow.repo |
   | Rocky 9.2 and higher | Insiders Slow | https://packages.microsoft.com/config/rocky/9/insiders-slow.repo |
   | Alma 8.4 and higher | Insiders Slow | https://packages.microsoft.com/config/alma/8/insiders-slow.repo |
   | Alma 9.2 and higher | Insiders Slow | https://packages.microsoft.com/config/alma/9/insiders-slow.repo |

If you already have Defender for Endpoint running on any of these distros and facing any issues in the older versions, upgrade to the latest Defender for Endpoint version from the corresponding ring mentioned above. 

> [!NOTE]
> Known issues: 
> 
> Microsoft Defender for Endpoint for Linux on Rocky and Alma currently has the following known issues:
> - Live Response and Threat Vulnerability Management are currently not supported (work in progress).
> - Operating system info for devices isn't visible in the Microsoft Defender portal

### January-2024 Build: 101.23112.0009 | Release version: 30.123112.0009.0

| Build:             | **101.23112.0009**         |
|--------------------|-----------------------|
| Released:          | **January 29,2024** |
| Published:         | **January 29,2024** |
| Release version:   | **30.123112.0009.0** |
| Engine version:    | **1.1.23100.2010**       |
| Signature version: | **1.399.1389.0**      |

#### What's new

- Updated default engine version to `1.1.23110.4`, and default signatures version to `1.403.1579.0`.

- General stability and performance improvements.

- Bug fix for behavior monitoring configuration.

- Bug fixes.

### November-2023 Build: 101.23102.0003 | Release version: 30.123102.0003.0

| Build:             | **101.23102.0003**         |
|--------------------|-----------------------|
| Released:          | **November 28,2023** |
| Published:         | **November 28,2023** |
| Release version:   | **30.123102.0003.0** |
| Engine version:    | **1.1.23090.2008**       |
| Signature version: | **1.399.690.0**      |

#### What's new

- Updated default engine version to `1.1.23090.2008`, and default signatures version to `1.399.690.0`.

- Updated libcurl library to version `8.4.0` to fix recently disclosed vulnerabilities with the older version.

- Updated Openssl library to version `3.1.1` to fix recently disclosed vulnerabilities with the older version.

- General stability and performance improvements.

- Bug fixes.

### November-2023 Build: 101.23092.0012 | Release version: 30.123092.0012.0

| Build:             | **101.23092.0012**         |
|--------------------|-----------------------|
| Released:          | **November 14,2023** |
| Published:         | **November 14,2023** |
| Release version:   | **30.123092.0012.0** |
| Engine version:    | **1.1.23080.2007**       |
| Signature version: | **1.395.1560.0**      |

#### What's new

There are multiple fixes and new changes in this release: 

- Support added to restore threat based on original path using the following command:
  
  ```bash
  sudo mdatp threat quarantine restore threat-path --path [threat-original-path] --destination-path [destination-folder]
  ```
- From this release, Microsoft Defender for Endpoint on Linux will no longer be shipping a solution for RHEL 6.
  
    RHEL 6 'Extended end of life support' is poised to end by June 30, 2024 and customers are advised to plan their RHEL upgrades accordingly aligned with guidance from Red Hat. Customers who need to run Defender for Endpoint on RHEL 6 servers can continue to use version 101.23082.0011 (doesn't expire before June 30, 2024) supported on kernel versions 2.6.32-754.49.1.el6.x86_64 or prior.
  - Engine Update to `1.1.23080.2007` and Signatures Ver: `1.395.1560.0`.
  - Streamlined device connectivity experience is now in public preview mode. [public blog](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-a-streamlined-device-connectivity-experience-for/ba-p/3956236)
  - Performance improvements & bug fixes.

#### Known issues

- CPU lock-up seen on kernel version 5.15.0-0.30.20 in ebpf mode, see [Use eBPF-based sensor for Microsoft Defender for Endpoint on Linux](linux-support-ebpf.md) for details and Mitigation options.

### November-2023 Build: 101.23082.0011 | Release version: 30.123082.0011.0

| Build:             | **101.23082.0011**         |
|--------------------|-----------------------|
| Released:          | **November 1,2023** |
| Published:         | **November 1,2023** |
| Release version:   | **30.123082.0011.0** |
| Engine version:    | **1.1.23070.1002**       |
| Signature version: | **1.393.1305.0**      |

#### What's new

- This new release is build over October 2023 release (101.23082.0009) with addition of following changes. There's no change for other customers and upgrading is optional.

- Fix for immutable mode of auditd when supplementary subsystem is ebpf:  In ebpf mode all mdatp audit rules should be cleaned after switching to ebpf and rebooting.  After the reboot, mdatp audit rules weren't cleaned due to which it was resulting in hang of the server.  The fix cleans these rules, user shouldn't see any mdatp rules loaded on reboot

- Fix for MDE not starting up on RHEL 6.

#### Known issues

When upgrading from mdatp version 101.75.43 or 101.78.13, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version 101.98.05. More information about the underlying issue can be found at [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading.
Some customers (<1%) experience issues with this method.

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### October-2023 Build: 101.23082.0009 | Release version: 30.123082.0009.0

| Build:             | **101.23082.0009**         |
|--------------------|-----------------------|
| Released:          | **October 9,2023** |
| Published:         | **October 9,2023** |
| Release version:   | **30.123082.0009.0** |
| Engine version:    | **1.1.23070.1002**       |
| Signature version: | **1.393.1305.0**      |

#### What's new

- This new release is build over October 2023 release (`101.23082.0009`) with addition of new CA Certificates. There's no change for other customers and upgrading is optional. 

#### Known issues

When upgrading from mdatp version 101.75.43 or 101.78.13, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version 101.98.05. More information about the underlying issue can be found at [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading.
Some customers (<1%) experience issues with this method.

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### October-2023 Build: 101.23082.0006 | Release version: 30.123082.0006.0

| Build:             | **101.23082.0006**         |
|--------------------|-----------------------|
| Released:          | **October 9,2023** |
| Published:         | **October 9,2023** |
| Release version:   | **30.123082.0006.0** |
| Engine version:    | **1.1.23070.1002**       |
| Signature version: | **1.393.1305.0**      |

#### What's new

- Feature updates and new changes
  
  - eBPF sensor is now the default supplementary event provider for endpoints
  
  - Microsoft Intune tenant attach feature is in public preview (as of mid July)
    - You must add "*.dm.microsoft.com" to firewall exclusions for the feature to work correctly
  
  - Defender for Endpoint is now available for Debian 12 and Amazon Linux 2023
  
  - Support to enable Signature verification of updates downloaded
    - You must update the manajed.json as shown:
      ```
        "features":{
          "OfflineDefinitionUpdateVerifySig":"enabled"
        }
      ```
      
    - Prerequisite to enable feature
      - Engine version on the device must be  "1.1.23080.007" or above. Check your engine version by using the following command.
        ``` mdatp health --field engine_version ```
  
  - Option to support monitoring of NFS and FUSE mount points. These are ignored by default.
    The following example shows how to monitor all filesystem while ignoring only NFS:

  ```
    "antivirusEngine": {
        "unmonitoredFilesystems": ["nfs"]
    }
    ```
    
    Example to monitor all filesystems including NFS and FUSE:
    ```
    "antivirusEngine": {
        "unmonitoredFilesystems": []
    }
    ```

  - Other performance improvements
  
  - Bug Fixes

#### Known issues

- When upgrading from mdatp version 101.75.43 or 101.78.13, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version 101.98.05. More information about the underlying issue can be found at [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).
There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading.
Some customers (<1%) experience issues with this method.

 ```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### September-2023 Build: 101.23072.0021 | Release version: 30.123072.0021.0

| Build:             | **101.23072.0021**         |
|--------------------|-----------------------|
| Released:          | **September 11,2023** |
| Published:         | **September 11,2023** |
| Release version:   | **30.123072.0021.0** |
| Engine version:    | **1.1.20100.7**       |
| Signature version: | **1.385.1648.0**      |

#### What's new

There are multiple fixes and new changes in this release:

- In `mde_installer.sh` v0.6.3, users can use the `--channel` argument to provide the channel of the configured repository during cleanup. For example, `sudo ./mde_installer --clean --channel prod`
    
- The Network Extension can now be reset by administrators using `mdatp network-protection reset`.

- Other performance improvements

- Bug Fixes

#### Known issues

- While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.98.05`. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading.
Some customers (<1%) experience issues with this method.

 ```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### July-2023 Build: 101.23062.0010 | Release version: 30.123062.0010.0

| Build:             | **101.23062.0010**         |
|--------------------|-----------------------|
| Released:          | **July 26,2023** |
| Published:         | **July 26,2023** |
| Release version:   | **30.123062.0010.0** |
| Engine version:    | **1.1.20100.7**       |
| Signature version: | **1.385.1648.0**      |

#### What's new

There are multiple fixes and new changes in this release

- If a proxy is set for Defender for Endpoint, then it's visible in the `mdatp health` command output. With this release we provided two options in mdatp diagnostic hot-event-sources:

   - Files
   - Executables
    
- Network Protection: Connections that are blocked by Network Protection and have the block overridden by users is now correctly reported to Microsoft Defender XDR

- Improved logging in Network Protection block and audit events for debugging

- Other fixes and improvements

   - From this version, enforcementLevel are in passive mode by default giving admins more control over where they want 'RTP on' within their estate
   - This change only applies to fresh MDE deployments, for example, servers where Defender for Endpoint is being deployed for the first time. In update scenarios, servers that have Defender for Endpoint deployed with RTP ON, continue operating with RTP ON even post update to version 101.23062.0010

- Bug fix: RPM database corruption issue in Defender Vulnerability Management baseline is fixed.

- Other performance improvements

#### Known issues

While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.98.05`. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading.
Some customers (<1%) experience issues with this method.

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### July-2023 Build: 101.23052.0009 | Release version: 30.123052.0009.0

| Build:             | **101.23052.0009**         |
|--------------------|-----------------------|
| Released:          | **July 10,2023** |
| Published:         | **July 10,2023** |
| Release version:   | **30.123052.0009.0** |
| Engine version:    | **1.1.20100.7**       |
| Signature version: | **1.385.1648.0**      |

#### What's new

- There are multiple fixes and new changes in this release
      - The build version schema is updated from this release. While the major version number remains same as 101, the minor version number now has five digits followed by four digit patch number that is, `101.xxxxx.yyy`
      - Improved Network Protection memory consumption under stress
     - Updated the engine version to `1.1.20300.5` and signature version to `1.391.2837.0`.
    - Bug fixes.

#### Known issues

While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.98.05`. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading.
Some customers (<1%) experience issues with this method.

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### June-2023 Build: 101.98.89 | Release version: 30.123042.19889.0

| Build:             | **101.98.89**         |
|--------------------|-----------------------|
| Released:          | **June 12,2023** |
| Published:         | **June 12,2023** |
| Release version:   | **30.123042.19889.0** |
| Engine version:    | **1.1.20100.7**       |
| Signature version: | **1.385.1648.0**      |

#### What's new

There are multiple fixes and new changes in this release 

- Improved Network Protection Proxy handling.

- In Passive mode, Defender for Endpoint no longer scans when Definition update happens.

- Devices continue to be protected even after Defender for Endpoint agent is expired. We recommend upgrading the Defender for Endpoint Linux agent to the latest available version to receive bug fixes, features, and performance improvements.
    
- Removed semanage package dependency.
    
- Engine Update to `1.1.20100.7` and Signatures Ver: `1.385.1648.0`.
    
- Bug fixes.

#### Known issues

- While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.98.05`. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading. 
Some customers (<1%) experience issues with this method. 

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### May-2023 Build: 101.98.64 | Release version: 30.123032.19864.0

| Build:             | **101.98.64**         |
|--------------------|-----------------------|
| Released:          | **May 3,2023** |
| Published:         | **May 3,2023** |
| Release version:   | **30.123032.19864.0** |
| Engine version:    | **1.1.20100.6**       |
| Signature version: | **1.385.68.0**      |

#### What's new

There are multiple fixes and new changes in this release 

- Health message improvements to capture details about auditd failures.

- Improvements to handle augenrules, which was causing installation failure.

- Periodic memory cleanup in engine process.

- Fix for memory issue in mdatp audisp plugin.

- Handled missing plugin directory path during installation.

- When conflicting application is using blocking fanotify, with default configuration mdatp health shows unhealthy. This is now fixed.

- Support for ICMP traffic inspection in BM.

- Engine Update to `1.1.20100.6` and Signatures Ver: `1.385.68.0`.

- Bug fixes.

#### Known issues

- While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.98.05`. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading. 
Caution: Some customers (<1%) experience issues with this method. 

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### April-2023 Build: 101.98.58 | Release version: 30.123022.19858.0

| Build:             | **101.98.58**         |
|--------------------|-----------------------|
| Released:          | **April 20,2023** |
| Published:         | **April 20,2023** |
| Release version:   | **30.123022.19858.0** |
| Engine version:    | **1.1.20000.2**       |
| Signature version: | **1.381.3067.0**      |

#### What's new

There are multiple fixes and new changes in this release 

- Logging and error reporting improvements for auditd.

- Handle failure in reload of auditd configuration.

- Handling for empty auditd rule files during MDE install.

- Engine Update to `1.1.20000.2` and Signatures Ver: `1.381.3067.0`.

- Addressed a health issue in mdatp that occurs due to selinux denials.

- Bug fixes.

#### Known issues

- While upgrading mdatp to version `101.94.13` or later, you might notice that health is false, with health_issues as "no active supplementary event provider". This can happen due to misconfigured/conflicting auditd rules on existing machines. To mitigate the issue, the auditd rules on the existing machines need to be fixed. The following commands can help you to identify such auditd rules (commands need to be run as super user). Take a backup of following file: /etc/audit/rules.d/audit.rules as these steps are only to identify failures.

  ```bash
  echo -c >> /etc/audit/rules.d/audit.rules
  augenrules --load
  ```

- While upgrading from mdatp version `101.75.43` or `101.78.13`, you could encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.98.05`. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

There are two ways to mitigate this upgrade issue:

1. Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.
    
   Example:

   ```bash
   sudo apt purge mdatp
   sudo apt-get install mdatp
   ```

2. As an alternative you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

If you don't want to uninstall mdatp, you can disable rtp and mdatp in sequence before upgrading. 
Caution: Some customers (<1%) experience issues with this method. 

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### March-2023 Build: 101.98.30 | Release version: 30.123012.19830.0

| Build:             | **101.98.30**         |
|--------------------|-----------------------|
| Released:          | **March 20, 2023** |
| Published:         | **March 20, 2023** |
| Release version:   | **30.123012.19830.0** |
| Engine version:    | **1.1.19900.2**       |
| Signature version: | **1.379.1299.0**      |

#### What's new

- This new release is build over March 2023 release (`101.98.05`) with a fix for Live response commands failing for one of our customers. There's no change for other customers and upgrade is optional. 
    
#### Known issues

- With mdatp version 101.98.30 you might see a health false issue in some of the cases, because SELinux rules aren't defined for certain scenarios. The health warning could look something like this:

*Found SELinux denials within last one day. If the MDATP is recently installed, clear the existing audit logs or wait for a day for this issue to autoresolve. Use command: \"sudo ausearch -i -c 'mdatp_audisp_pl' | grep \"type=AVC\" | grep \" denied\" to find details*

The issue could be mitigated by running the following commands.

```bash
sudo ausearch -c 'mdatp_audisp_pl' --raw | sudo audit2allow -M my-mdatpaudisppl_v1
sudo semodule -i my-mdatpaudisppl_v1.pp
```

Here, my-mdatpaudisppl_v1 represents the policy module name. After you run the commands, either wait for 24 hours or clear/archive the audit logs. The audit logs could be archived by running the following command

```bash
sudo service auditd stop
sudo systemctl stop mdatp
cd /var/log/audit
sudo gzip audit.*
sudo service auditd start
sudo systemctl start mdatp
mdatp health
```

In case the issue reappears with some different denials. We need to run the mitigation again with a different module name (for example, my-mdatpaudisppl_v2).

### March-2023 Build: 101.98.05 | Release version: 30.123012.19805.0

| Build:             | **101.98.05**         |
|--------------------|-----------------------|
| Released:          | **March 08, 2023** |
| Published:         | **March 08, 2023** |
| Release version:   | **30.123012.19805.0** |
| Engine version:    | **1.1.19900.2**       |
| Signature version: | **1.379.1299.0**      |

#### What's new

- Improved Data Completeness for Network Connection events

- Improved Data Collection capabilities for file ownership/permissions changes

- seManage in part of the package, to that seLinux policies can be configured in different distro (fixed).

- Improved enterprise daemon stability

- AuditD stop path clean-up

- Improved the stability of mdatp stop flow.

- Added new field to wdavstate to keep track of platform update time.

- Stability improvements to parsing Defender for Endpoint onboarding blob.

- Scan doesn't proceed if a valid license isn't present (fixed)

- Added performance tracing option to xPlatClientAnalyzer, with tracing enabled mdatp process dumps the flow in all_process.zip file that can be used for analysis of performance issues.

- Added support in Defender for Endpoint for the following RHEL-6 kernel versions:

   - `2.6.32-754.43.1.el6.x86_64`
   - `2.6.32-754.49.1.el6.x86_64`

- Other fixes
    
#### Known issues

While upgrading mdatp to version 101.94.13, you might notice that health is false, with health_issues as "no active supplementary event provider". This can happen due to misconfigured/conflicting auditd rules on existing machines. To mitigate the issue, the auditd rules on the existing machines need to be fixed. The following steps can help you to identify such auditd rules (these commands need to be run as super user). Make sure to back up following file: `/etc/audit/rules.d/audit.rules` as these steps are only to identify failures.

  ```bash
  echo -c >> /etc/audit/rules.d/audit.rules
  augenrules --load
  ```

- While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.98.05`. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901)

There are two ways to mitigate the problem in upgrading.

Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

Example:

```bash
sudo apt purge mdatp
sudo apt-get install mdatp
```

As an alternative, you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

In case you don't want to uninstall mdatp you can disable rtp and mdatp in sequence before upgrade. 
Caution: Some customers(<1%) are experiencing issues with this method. 

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### Jan-2023 Build: 101.94.13 | Release version: 30.122112.19413.0

| Build:             | **101.94.13**         |
|--------------------|-----------------------|
| Released:          | **January 10, 2023** |
| Published:         | **January 10, 2023** |
| Release version:   | **30.122112.19413.0** |
| Engine version:    | **1.1.19700.3**       |
| Signature version: | **1.377.550.0**      |

#### What's new

- There are multiple fixes and new changes in this release
  - Skip quarantine of threats in passive mode by default.
  - New config, nonExecMountPolicy, can now be used to specify behavior of RTP on mount point marked as noexec.
  - New config, unmonitoredFilesystems, can be used to unmonitor certain filesystems.
  - Improved performance under high load and in speed test scenarios.
  - Fixes an issue with accessing SMB shares behind Cisco AnyConnect VPN connections.
  - Fixes an issue with Network Protection and SMB.
  - lttng performance tracing support.
  - TVM, eBPF, auditd, telemetry, and mdatp cli improvements.
  - mdatp health now reports behavior_monitoring
  - Other fixes.

#### Known issues

- While upgrading mdatp to version `101.94.13`, you might notice that health is false, with health_issues as "no active supplementary event provider. This can happen due to misconfigured/conflicting auditd rules on existing machines. To mitigate the issue, the auditd rules on the existing machines need to be fixed. The following steps can help you to identify such auditd rules (these commands need to be run as super user). Take a backup of following file: `/etc/audit/rules.d/audit.rules` as these steps are only to identify failures.

  ```bash
  echo -c >> /etc/audit/rules.d/audit.rules
  augenrules --load
  ```

- While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version 101.94.13. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901)

There are two ways to mitigate the problem in upgrading.

Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

Example:

```bash
sudo apt purge mdatp
sudo apt-get install mdatp
```

As an alternative, you can follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

In case you don't want to uninstall mdatp you can disable rtp and mdatp in sequence before upgrade.
Caution: Some customers(<1%) are experiencing issues with this method.

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### Nov-2022 Build: 101.85.27 | Release version: 30.122092.18527.0

| Build:             | **101.85.27**         |
|--------------------|-----------------------|
| Released:          | **November 02, 2022** |
| Published:         | **November 02, 2022** |
| Release version:   | **30.122092.18527.0** |
| Engine version:    | **1.1.19500.2**       |
| Signature version: | **1.371.1369.0**      |

#### What's new

- There are multiple fixes and new changes in this release
  - V2 engine is default with this release and V1 engine bits are removed for enhanced security.
  - V2 engine support configuration path for AV definitions. (mdatp definition set path)
  - Removed external packages dependencies from MDE package. Removed dependencies are libatomic1, libselinux, libseccomp, libfuse, and libuuid
  - In case crash collection is disabled by configuration, crash monitoring process isn't launched.
  - Performance fixes to optimally use system events for AV capabilities.
  - Stability improvement when restarting mdatp and load epsext issues.
  - Other fixes

#### Known issues

- While upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version 101.85.21. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901)

There are two ways to mitigate the problem in upgrading.

Use your package manager to uninstall the `101.75.43` or `101.78.13` mdatp version.

Example:

```bash
sudo apt purge mdatp
sudo apt-get install mdatp
```

As an alternative approach, follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

In case you don't want to uninstall mdatp you can disable rtp and mdatp in sequence before upgrade.
Caution: Some customers(<1%) are experiencing issues with this method.

```bash
sudo mdatp config real-time-protection --value=disabled
sudo systemctl disable mdatp
```

### Sep-2022 Build: 101.80.97 | Release version: 30.122072.18097.0

| Build:             | **101.80.97**         |
|--------------------|-----------------------|
| Released:          | **September 14, 2022** |
| Published:         | **September 14, 2022** |
| Release version:   | **30.122072.18097.0** |
| Engine version:    | **1.1.19300.3**       |
| Signature version: | **1.369.395.0**      |

#### What's new

- Fixes a kernel hang observed on select customer workloads running mdatp version `101.75.43`. After RCA, this was attributed to a race condition while releasing the ownership of a sensor file descriptor. The race condition was exposed due to a recent product change in the shutdown path. Customers on newer Kernel versions (5.1+) aren't impacted by this issue. For more information, see [System hang due to blocked tasks in fanotify code](https://access.redhat.com/solutions/2838901).

#### Known issues

- When upgrading from mdatp version `101.75.43` or `101.78.13`, you might encounter a kernel hang. Run the following commands before attempting to upgrade to version `101.80.97`. This action should prevent the issue from occurring.

  ```bash
  sudo mdatp config real-time-protection --value=disabled
  sudo systemctl disable mdatp
  ```

After executing the commands, use your package manager to perform the upgrade.

As an alternative approach, follow the instructions to [uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux), then [install](linux-install-manually.md#application-installation) the latest version of the package.

### Aug-2022 Build: 101.78.13 | Release version: 30.122072.17813.0

| Build:             | **101.78.13**         |
|--------------------|-----------------------|
| Released:          | **August 24, 2022** |
| Published:         | **August 24, 2022** |
| Release version:   | **30.122072.17813.0** |
| Engine version:    | **1.1.19300.3**       |
| Signature version: | **1.369.395.0**      |
 
#### What's new

- Rolled back due to reliability issues

### Aug-2022 (Build: 101.75.43 | Release version: 30.122071.17543.0)

| Build:             | **101.75.43**         |
|--------------------|-----------------------|
| Released:          | **August 2, 2022** |
| Published:         | **August 2, 2022** |
| Release version:   | **30.122071.17543.0** |
| Engine version:    | **1.1.19300.3**       |
| Signature version: | **1.369.395.0**      |

#### What's new

- Added support for Red Hat Enterprise Linux version 9.0
- Added a new field in the output of `mdatp health` that can be used to query the enforcement level of the network protection feature. The new field is called `network_protection_enforcement_level` and can take one of the following values: `audit`, `block`, or `disabled`.
- Addressed a product bug where multiple detections of the same content could lead to duplicate entries in the threat history
- Addressed an issue where one of the processes spawned by the product (`mdatp_audisp_plugin`) was sometimes not properly terminated when the service was stopped
- Other bug fixes

### Jul-2022 Build: 101.73.77 | Release version: 30.122062.17377.0

| Build:             | **101.73.77**         |
|--------------------|-----------------------|
| Released:          | **July 21, 2022** |
| Published:         | **July 21, 2022** |
| Release version:   | **30.122062.17377.0** |
| Engine version:    | **1.1.19200.3**       |
| Signature version: | **1.367.1011.0**      |

#### What's new

- Added an option to [configure file hash computation](linux-preferences.md#configure-file-hash-computation-feature)
- From this build onwards, the product has the new anti-malware engine by default
- Performance improvements for file copy operations
- Bug fixes

### Jun-2022 Build: 101.71.18 | Release version: 30.122052.17118.0

| Build:             | **101.71.18**         |
|--------------------|-----------------------|
| Released:          | **June 24, 2022** |
| Published:         | **June 24, 2022** |
| Release version:   | **30.122052.17118.0** |

#### What's new

- Fix to support definitions storage in nonstandard locations (outside of /var) for v2 definition updates
- Fixed an issue in the product sensor used on RHEL 6 that could lead to an OS hang
- `mdatp connectivity test` was extended with an extra URL that the product requires to function correctly. The new URL is [https://go.microsoft.com/fwlink/?linkid=2144709](https://go.microsoft.com/fwlink/?linkid=2144709).
- Up until now, the product log level wasn't persisted between product restarts. Beginning with this version, there's a new command-line tool switch that persists the log level. The new command is `mdatp log level persist --level <level>`.
- Removed the dependency on `python` from the product installation package
- Performance improvements for file copy operations and processing of network events originating from `auditd`
- Bug fixes

### May-2022 Build: 101.68.80 | Release version: 30.122042.16880.0

| Build:             | **101.68.80**         |
|--------------------|-----------------------|
| Released:          | **May 23, 2022** |
| Published:         | **May 23, 2022** |
| Release version:   | **30.122042.16880.0** |

#### What's new

- Added support for kernel version `2.6.32-754.47.1.el6.x86_64` when running on RHEL 6
- On RHEL 6, product can now be installed on devices running Unbreakable Enterprise Kernel (UEK)
- Fixed an issue where the process name was sometimes incorrectly displayed as `unknown` when running `mdatp diagnostic real-time-protection-statistics`
- Fixed a bug where the product sometimes was incorrectly detecting files inside the quarantine folder
- Fixed an issue where the `mdatp` command-line tool wasn't working when `/opt` was mounted as a soft-link
- Performance improvements & bug fixes

### May-2022 Build: 101.65.77 | Release version: 30.122032.16577.0

| Build:             | **101.65.77**         |
|--------------------|-----------------------|
| Released:          | **May 2, 2022** |
| Published:         | **May 2, 2022** |
| Release version:   | **30.122032.16577.0** |

#### What's new

- Improved the `conflicting_applications` field in `mdatp health` to show only the most recent 10 processes and also to include the process names. This makes it easier to identify which processes are potentially conflicting with Microsoft Defender for Endpoint for Linux.
- Bug fixes

### Mar-2022 (Build: 101.62.74 | Release version: 30.122022.16274.0)

| Build:             | **101.62.74**         |
|--------------------|-----------------------|
| Released:          | **Mar 24, 2022** |
| Published:         | **Mar 24, 2022** |
| Release version:   | **30.122022.16274.0** |

#### What's new

- Addressed an issue where the product would incorrectly block access to files greater than 2 GB in size when running on older kernel versions
- Bug fixes

### Mar-2022 Build: 101.60.93 | Release version: 30.122012.16093.0

| Build:             | **101.60.93**         |
|--------------------|-----------------------|
| Released:          | **Mar 9, 2022** |
| Published:         | **Mar 9, 2022** |
| Release version:   | **30.122012.16093.0** |

#### What's new

- This version contains a security update for CVE-2022-23278.

### Mar-2022 Build: 101.60.05 | Release version: 30.122012.16005.0

| Build:             | **101.60.05**         |
|--------------------|-----------------------|
| Released:          | **Mar 3, 2022** |
| Published:         | **Mar 3, 2022** |
| Release version:   | **30.122012.16005.0** |

#### What's new

- Added support for kernel version 2.6.32-754.43.1.el6.x86_64 for RHEL 6.10
- Bug fixes

### Feb-2022 Build: 101.58.80 | Release version: 30.122012.15880.0

| Build:             | **101.58.80**         |
|--------------------|-----------------------|
| Released:          | **Feb 20, 2022** |
| Published:         | **Feb 20, 2022** |
| Release version:   | **30.122012.15880.0** |

#### What's new

- The command-line tool now supports restoring quarantined files to a location other than the one where the file was originally detected. This can be done through `mdatp threat quarantine restore --id [threat-id] --path [destination-folder]`.
- Beginning with this version, network protection for Linux can be evaluated on demand
- Bug fixes

### Jan-2022 Build: 101.56.62 | Release version: 30.121122.15662.0

| Build:             | **101.56.62**         |
|--------------------|-----------------------|
| Released:          | **Jan 26, 2022** |
| Published:         | **Jan 26, 2022** |
| Release version:   | **30.121122.15662.0** |

#### What's new

- Fixed a product crash introduced in 101.53.02 that affected multiple customers

### Jan-2022 Build: 101.53.02 | Release version: 30.121112.15302.0

| Build:             | **101.53.02**         |
|--------------------|-----------------------|
| Released:          | **Jan 8, 2022** |
| Published:         | **Jan 8, 2022** |
| Release version:   | **30.121112.15302.0** |

#### What's new

- Performance improvements & bug fixes

### 2021 releases

#### Build: 101.52.57 | Release version: 30.121092.15257.0

| Build:             | **101.52.57**         |
|--------------------|-----------------------|
| Release version:   | **30.121092.15257.0** |

##### What's new 

- Added a capability to detect vulnerable Log4j jars in use by Java applications. The machine is periodically inspected for running Java processes with loaded Log4j jars. The information is reported to the Microsoft Defender for Endpoint backend and is exposed in the Vulnerability Management area of the portal.

#### Build: 101.47.76  | Release version: 30.121092.14776.0

| Build:             | **101.47.76**         |
|--------------------|-----------------------|
| Release version:   | **30.121092.14776.0** |
  
##### What's new

- Added a new switch to the command-line tool to control whether archives are scanned during on-demand scans. This can be configured through mdatp config scan-archives--value [enabled/disabled]. By default, this setting is set to enabled.

- Bug fixes

#### Build: 101.45.13 | Release version: 30.121082.14513.0

| Build:             | **101.45.13**         |
|--------------------|-----------------------|
| Release version:   | **30.121082.14513.0** |

##### What's new

- Beginning with this version, we're bringing Microsoft Defender for Endpoint support to the following distros:

  - RHEL6.7-6.10 and CentOS6.7-6.10 versions.
  - Amazon Linux 2
  - Fedora 33 or higher

- Bug fixes

#### Build: 101.45.00 | Release version: 30.121072.14500.0

| Build:             | **101.45.00**         |
|--------------------|-----------------------|
| Release version:   | **30.121072.14500.0** |

##### What's new

- Added new switches to the command-line tool:
  - Control degree of parallelism for on-demand scans. This can be configured through `mdatp config maximum-on-demand-scan-threads --value [number-between-1-and-64]`. By default, a degree of parallelism of `2` is used.
  - Control whether scans after security intelligence updates are enabled or disabled. This can be configured through `mdatp config scan-after-definition-update --value [enabled/disabled]`. By default, this setting is set to `enabled`.
  - Changing the product log level now requires elevation
  - Bug fixes

#### Build: 101.39.98 | Release version: 30.121062.13998.0

| Build:             | **101.39.98**         |
|--------------------|-----------------------|
| Release version:   | **30.121062.13998.0** |

##### What's new

- Performance improvements & bug fixes

#### Build: 101.34.27 | Release version: 30.121052.13427.0

| Build:             | **101.34.27**         |
|--------------------|-----------------------|
| Release version:   | **30.121052.13427.0** |

##### What's new

- Performance improvements & bug fixes

#### Build: 101.29.64 | Release version: 30.121042.12964.0

| Build:             | **101.29.64**         |
|--------------------|-----------------------|
| Release version:   | **30.121042.12964.0** |

##### What's new

- Beginning with this version, threats detected during on-demand antivirus scans triggered through the command-line client are automatically remediated. Threats detected during scans triggered through the user interface still require manual action.
- `mdatp diagnostic real-time-protection-statistics` now supports two more switches:
- `--sort`: sorts the output descending by total number of files scanned
- `--top N`: displays the top N results (only works if `--sort` is also specified)
- Performance improvements & bug fixes

#### Build: 101.25.72 | Release version: 30.121022.12563.0

| Build:             | **101.25.72**         |
|--------------------|-----------------------|
| Release version:   | **30.121022.12563.0** |

##### What's new

- Microsoft Defender for Endpoint on Linux is now available in preview for US Government customers. For more information, see [Microsoft Defender for Endpoint for US Government customers](gov.md).
- Fixed an issue where usage of Microsoft Defender for Endpoint on Linux on systems with FUSE filesystems was leading to OS hang
- Performance improvements & other bug fixes
   
#### Build: 101.25.63 | Release version: 30.121022.12563.0

| Build:             | **101.25.63**         |
|--------------------|-----------------------|
| Release version:   | **30.121022.12563.0** |

##### What's new

- Performance improvements & bug fixes

#### Build: 101.23.64 | Release version: 30.121021.12364.0

| Build:             | **101.23.64**         |
|--------------------|-----------------------|
| Release version:   | **30.121021.12364.0** |

##### What's new

- Performance improvement for the situation where an entire mount point is added to the antivirus exclusion list. Prior to this version, the product processed file activity originating from the mount point. Beginning with this version, file activity for excluded mount points is suppressed, leading to better product performance
- Added a new option to the command-line tool to view information about the last on-demand scan. To view information about the last on-demand scan, run `mdatp health --details antivirus`
- Other performance improvements & bug fixes

#### Build: 101.18.53

##### What's new

- EDR for Linux is now [generally available](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/edr-for-linux-is-now-is-generally-available/ba-p/2048539)

- Added a new command-line switch (`--ignore-exclusions`) to ignore AV exclusions during custom scans (`mdatp scan custom`)
- Extended `mdatp diagnostic create` with a new parameter (`--path [directory]`) that allows the diagnostic logs to be saved to a different directory
- Performance improvements & bug fixes

---

## Windows EDR release notes archive

Entries other than May 2025 (10.8797.25857.1000) and July 2024 (10.8760.27617.1006).

### May-2024 (Release version: 10.8750.27558.1004)

|OS  |KB |Release version |
| -------- | -------- | -------- |
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8750.27558.1004|

#### What's new

##### Configuration Management

- Fixed an issue that caused empty policies to appear in the UI. 
- Configured Windows Defender Application Control (WDAC) policies to block undesired applications from running on the device. 

### Feb-2024 (Release version: 10.8735.26020.1009)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8735.26020.1009|

#### What's new

##### Endpoint Detection and Response

- Enabled support for IPV6 connections in Live Response connection commands.
- Fixed an issue in Downlevel Unified Agent that caused ServerRoles not to be populated.
    
##### Threat Vulnerability Management

- An issue related to the agent's monitoring of deleted registry keys no longer occurs.
- Added a new capability to enable/disable registry monitoring through configuration settings.

##### Network Detection and Response (NDR) Performance Enhancements

- Introduced performance enhancements to minimize the CPU and memory footprint of the agent.
- Enhanced the accuracy of network detections.
    
##### Data Loss Prevention (DLP)

- Introduced multiple performance and stability fixes.
     
##### Security Configuration Management

- Policies that include special characters are now supported.   

### Dec-2023 (Release version: 10.8672.25926.1019)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8672.25926.1019|

#### What's new

- Supports Expanded User Contain capabilities

### Sept-2023 (Release version: 10.8560.25364.1036)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8560.25364.1036|

#### What's new

- Supports User Contain availability

### May-2023 (Release version: 10.8295.22621.1023)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8295.22621.1023|

#### What's new

- Supports new security settings management capabilities

### Jan/Feb-2023 (Release version: 10.8295.22621.1019)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8295.22621.1019|

#### What's new

- Improved command and control security, quality fixes

### Dec-2022 (Release version: 10.8210.22621.1016)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8210.22621.1016|

**What's new**

- Bug fixes and stability improvements

### Aug-2022 (Release version: 10.8210.*)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8210.22621.1011|
|Windows 11 21H2 (Cobalt)<br> (Windows 11 SV 21H2)     | [KB5016691](https://support.microsoft.com/topic/august-25-2022-kb5016691-os-build-22000-918-preview-59097044-915a-49a0-8870-49823236adbd)        | 10.8210.22000.918        |
|Server 2022 (Iron)     | [KB5016693](https://support.microsoft.com/topic/august-16-2022-kb5016693-os-build-20348-946-preview-ee90d0bc-c162-4124-b7c6-f963ee7b17ed)        |10.8210.20348.946         |
|Windows 10 20H2/21H1/21H2<br> Windows Server 20H2  (Vibranium)     | [KB5016688](https://support.microsoft.com/topic/august-26-2022-kb5016688-os-builds-19042-1949-19043-1949-and-19044-1949-preview-ec31ebdc-067d-44dd-beb0-eabcc984d843)       | 10.8210.19041.1949        |
|Windows Server 2019 (RS5)   |[KB5016690](https://support.microsoft.com/topic/august-23-2022-kb5016690-os-build-17763-3346-preview-b81d1ac5-75c7-42c1-b638-f13aa4242f42)       |10.8210.17763.3346 |

#### What's new

- Added a fix to resolve a missing intermediate certificate issue with the use of "TelemetryProxyServer" on Windows Server 2012 R2 running the unified agent.
- Enhanced [Endpoint DLP](/purview/endpoint-dlp-learn-about) with ability to protect password protected and encrypted files and not label files.
- Enhanced Endpoint DLP with support for context data in audit telemetry (short evidence).
- Improved Microsoft Defender for Endpoint client authentication support for VDI devices.
- Enhanced Microsoft Defender for Endpoint's ability to identify and intercept ransomware and advanced attacks.
- The *Contain* feature now supports more desktop and server versions to perform contain actions and block discovered devices when such devices are contained.
- Expanded the troubleshooting mode feature to more desktop and server versions. For a complete list of supported OS versions and more information about prerequisites, see [Get started with troubleshooting mode in Microsoft Defender for Endpoint](enable-troubleshooting-mode.md).
- Live Response improvements include reduced session creation latency when using proxies, an undo remediation manual command, support for OneDrive shares in `FindFile` action, and improved isolation and stability.
- [Security Management for Microsoft Defender for Endpoint](/mem/intune/protect/mde-security-integration#configure-your-tenant-to-support-microsoft-defender-for-endpoint-security-configuration-management) now provides the ability to sync the device configuration on demand instead of waiting for a specific cadence.

 > [!NOTE] 
 > Update package KB5005292 is on a gradual rollout schedule through Windows Update. Towards the end of this schedule, the package will be published completely, including to the update catalog for manual download. For the current release, this will be in the second half of October. If you want to test the package sooner, you can use [gradual rollout controls for platform updates](configure-updates.md) to select the Preview channel.
