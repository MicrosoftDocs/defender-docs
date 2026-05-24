---
title: New features in Microsoft Defender for Endpoint
description: This article describes new features available in Microsoft Defender for Endpoint, including both Windows and cross-platform updates.
ms.topic: whats-new
ms.service: defender-endpoint
author: lwainstein
ms.author: lwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 05/20/2026
ms.collection:
- m365-security
- tier1
#Customer.intent: As a security administrator or IT professional, stay up to date with the latest features, improvements, and changes in Microsoft Defender for Endpoint and related security products, so that you can ensure your organization benefits from new capabilities, stays protected against emerging threats, and takes advantage of enhancements as soon as they become available.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# New features in Microsoft Defender for Endpoint

This article describes Microsoft Defender for Endpoint features that are in preview or generally available (GA), released in the past six months.

For recent releases of Microsoft Defender for Endpoint, including build numbers, improvements, and fixes, see [Microsoft Defender for Endpoint release notes](microsoft-defender-endpoint-releases.md).

Learn more about [Preview features](/defender-xdr/preview).

## May 2026

|Type  |Feature  |Preview/GA  |Description  |
|---------|------------|-------------|-------------|
|Feature |[Automatic device isolation (automatic attack disruption)](respond-machine-alerts.md#isolate-device-automatic-attack-disruption) |Preview |Microsoft Defender for Endpoint can now automatically isolate compromised devices as part of [automatic attack disruption](/defender-xdr/automatic-attack-disruption). Isolation blocks most network traffic while keeping the device connected to security services. The action is time-limited, scoped to the incident, and security operators can release isolation at any time. |
|Feature |[Custom data collection](custom-data-collection.md) |GA |Custom data collection is now generally available. This feature enables organizations to expand and customize telemetry collection beyond default configurations with rule-based filtering for specific events from endpoint devices. The maximum event limit per rule has been updated from 25,000 to 75,000 events per device within a 24-hour rolling window. |
|Feature |[Configure offline security intelligence update settings for Linux from the Defender and Intune portals](./linux-support-offline-security-intelligence-update.md#configure-the-endpoints) |GA |You can now configure offline security intelligence update settings for Linux directly from the Defender and Intune portals. |
|Feature |[Selective Response Actions](./restrict-response-actions-high-value-assets.md) |Preview |Selective Response Actions enables organizations to tailor high-impact security operations on devices during onboarding. It provides precise control over how response actions are applied on Tier-0 systems and other high-value assets, helping maintain operational stability while delivering strong protection. |
|Release - Windows|Windows Defender Antivirus: Platform 4.18.26040.7 / Engine 1.1.26040.8 |GA |See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#windows-antivirus--april-2026--platform-418260407--engine-11260408). |

## April 2026

|Type  |Feature  |Preview/GA  |Description  |
|---------|------------|-------------|-------------|
|Feature |New Microsoft Secure Score recommendation |Preview |Microsoft Secure Score now includes the **Ensure devices are updated to Secure Boot 2023 certificates and boot manager**, which helps identify devices that haven't yet transitioned to the new Secure Boot 2023 certificates required ahead of the June 2026 expiration.<br><br>Devices that remain on older Secure Boot certificates may become unable to receive new security protections for the early boot process as the certificates approach expiration in June 2026.<br><br>This recommendation provides centralized visibility into deployment status across the environment, which enables organizations to identify exposure, prioritize remediation, and track rollout progress at scale. To learn more about the recommendation, see [Assess Secure Boot status with Microsoft Defender (blog)](https://aka.ms/secureboot-mde). |
|Feature |[View action status in the Activities tab (Preview)](/defender-xdr/autoad-results#track-the-action-status-in-the-activities-tab-preview) |Preview |You can now view the current status of automatic attack disruption and predictive shielding actions related to a specific incident. You view this data in the **Activities** tab of the incident page. The data applies to the [Contain user](respond-machine-alerts.md#contain-user-from-the-network), [GPO hardening](respond-machine-alerts.md#gpo-hardening-preview), [Safeboot hardening](respond-machine-alerts.md#safeboot-hardening-preview) response actions. |
|Release - Linux |Build 101.26032.0000 |GA |Release version 30.126032.0000.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--april-2026--101260320000). |
|Release - macOS |Build 101.26032.0016 |GA |Release version 20.126032.16.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--april-2026--101260320016).|
|Release - macOS |Build 4.18.25040.1 |GA |Release version 4.18.25040.1 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--april-2026--418250401).|
|Release - Windows|Windows Defender Antivirus: Platform 4.18.26030.3011 / Engine 1.1.26030.3008 |GA |See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#windows-antivirus--march-2026--platform-418260303011--engine-11260303008). |
|Release - macOS |Build 101.26022.0020 |GA |Release version 20.126022.20.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--april-2026--101260220020). |
|Release - macOS |Build 101.26022.0018 |GA |Release version 20.126022.18.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--april-2026--101260220018).|
|Release - Android |Build 1.0.8805.0103 |GA |Build 1.0.8805.0103 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#android--april-2026--platform-1088050103). |

## March 2026

|Type  |Feature  |Preview/GA  |Description  |
|---------|------------|-------------|-------------|
|Feature| New Microsoft Secure Score recommendations |Preview |Microsoft Secure Score now includes new recommendations to help organizations proactively prevent common endpoint attack techniques: <br> - **Block outbound network connections from Microsoft HTML Application Host (mshta.exe):** Helps mitigate attacks that leverage mshta.exe (a trusted Windows binary) to execute malicious scripts and communicate with external command-and-control (C2) infrastructure. Blocking outbound connections from mshta.exe disrupts common attack chains, prevents payload download and data exfiltration, and reduces the risk of living-off-the-land attacks. This is relevant for emerging attack campaigns, for example, ClickFix campaigns, where attackers abuse legitimate tools like mshta.exe to execute malicious content delivered through user interaction.|
|Release - Linux |Build 101.26021.0002 |GA |Release version 30.126021.0002.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--march-2026--101260210002). |
|Release - Windows |Windows Defender Antivirus: Platform 4.18.26020.6 / Engine 1.1.26020.3 |GA |See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#windows-antivirus--february-2026--platform-418260206--engine-11260203). |
|Feature |[Library management for live response](configure-libraries-live-response.md) |GA |Library management for live response is now generally available. This feature provides a centralized view for managing files and scripts used during live response sessions. |
|Release - macOS |Build 101.26012.0017 |GA |Release version 20.126012.17.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--march-2026--101260120017).|
|Feature |New Microsoft Secure Score recommendations |GA |Microsoft Secure Score now includes new recommendations to help organizations reduce exposure to common attack techniques involving remote access and authentication relay attacks:<br> - **Block file transfer over RDP**: Restricts file transfer capabilities in Remote Desktop Protocol (RDP) sessions. This helps prevent attackers from using RDP sessions to transfer malicious files into the environment or exfiltrate sensitive data.<br> - **SMB server security hardening against authentication relay attacks**: Helps protect servers from credential relay attacks by strengthening Server Message Block (SMB) authentication protections, including enforcing Extended Protection for Authentication (EPA), SMB signing, and SMB encryption to ensure authentication integrity and protect SMB traffic from tampering or interception. |
|Release - macOS|Build 101.26012.0015 |GA |Release version 20.126012.15.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--march-2026--101260120015).|
|Release - Linux |Build 101.26012.0007 |GA |Release version 30.126012.0007.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--march-2026--101260120007). |
|Feature |[Proactive user containment (contain user)](respond-machine-alerts.md#contain-user-from-the-network) |GA |The proactive user containment (contain user) action as part of the predictive shielding feature is now generally available. This action infuses activity data with exposure data to identify exposed credentials at risk of being compromised and reused to conduct malicious activity.|

## February 2026

|Type  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Release - macOS |Build 101.26012.0012 |GA |Release version 20.126012.12.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--february-2026--101260120012).|
|Feature |What's new and release notes documentation updates |GA |The what's new and OS-specific release notes pages are now updated to provide better visibility and access to new features, improvements, and fixes:<br>- The what's new page (this page) is now named **New features in Microsoft Defender for Endpoint** and includes both features and links to latest release notes.<br>- The [Release notes page](microsoft-defender-endpoint-releases.md) now consolidates release details for all supported operating systems, including Windows Antivirus. The new page groups updates by platform and date, making it easier to find specific information.<br>- All previous release notes pages redirect to the consolidated release notes page. |
|Feature |Support for software product vulnerability data on Windows 7 |GA |To provide comprehensive vulnerability management capabilities across all supported Windows versions, Microsoft Defender Vulnerability Management now gathers software product vulnerability data on Windows 7 devices. |
|Feature |[Library management for live response](configure-libraries-live-response.md) |Preview |You can now view and manage files and scripts used during live response sessions in the Microsoft Defender portal. With this enhancement, you get a centralized view of all uploaded files and their properties, and can upload, view and delete files outside the live response session. |
|Feature |[Effective settings tab](investigate-machines.md#configuration-management---effective-settings) |GA |The **Effective settings** tab under the device inventory **Configuration management** tab is now generally available. In this tab, you can view the actual value and configuration source of each security setting on a device. This helps identify configuration attempts that didn't take effect and eliminates gaps where intended protections aren't enforced. |
|Feature |Vulnerable components page renamed to [Software components](/defender-vulnerability-management/tvm-vulnerable-components) |GA |To reflect Defender Vulnerability Management's visibility into all software components identified in your organization, the **Vulnerable components** page is now named **Software components**. |
|Feature |Improved Device Vulnerabilities report experience | GA |To simplify and streamline the [Device vulnerabilities report](/defender-vulnerability-management/tvm-vulnerable-devices-report) experience, the Vulnerable devices report now includes the following changes and enhancements:<br>- The **Vulnerable devices by Windows 10/11 version over time** section is now removed.<br>- The report's filters only include the **Device group** filter.<br>- The report's history is now limited to the last 30 days.<br>- The report's history is now limited to the last 30 days.<br><br>**Note**: These changes are now visible to government cloud customers, but aren't yet visible in air-gapped environments. This visibility will be added in the coming months. |
|Feature |Enhanced Defender deployment tool for Windows | Preview |The new version of the tool streamlines onboarding and enhances security by:<br/>- Bundling the onboarding package directly into the tool's executable.<br/>- Generating a key during deployment package creation that is required for running the tool.<br/>- Enabling users to configure an expiry date for the package to reduce the risk of unauthorized use.<br/><br/>In addition, a new Deployment packages page in the Defender portal facilitates management of downloaded packages by providing centralized visibility into all the packages and their current status. |
|Release - macOS |Build 101.25122.0008 |GA |Release version 20.125122.8.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--february-2026--platform-101251220008). |
|Release - Linux |Build 101.25122.0004 |GA |Release version 30.125122.0004.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--february-2026--101251220004). |
|Release - Windows | Windows Defender Antivirus: Platform 4.18.26010.5 / Engine 1.1.26010.1 |GA |See [enhancements and features for this release](msda-updates-previous-versions-technical-upgrade-support.md#january-2026-platform-418260105--engine-11260101). |

## January 2026

|Type  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Release - Linux |Build 101.25102.0005 |GA |Release version 30.125102.0005.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--january-2026--platform-101251020005). |
|Release - macOS |Build 101.25122.0007 |GA |Release version 20.125122.7.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--january-2026--platform-101251220007). |
|Release - macOS |Build 101.25122.0006 |GA |Release version 20.125122.6.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--january-2026--platform-101251220006). |
|Feature |[Device vulnerabilities report](/defender-vulnerability-management/tvm-vulnerable-devices-report) enhancements |Preview |To simplify and streamline the Device vulnerabilities report experience, the Vulnerable devices report now includes several changes and enhancements ([learn more](#february-2026)).<br><br>**Note**: These changes are not yet visible to government cloud customers. |

## December 2025

|Type  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Release - Linux |Build 101.25092.0005 |GA |Release version 30.125092.0005.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--december-2025--platform-101250920005). |
|Release - Linux |Build 101.25092.0002 |GA |Release version 30.125092.0002.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--december-2025--platform-101250920002). |
|Release - Android |Build 1.0.8412.0101 |GA |Build 1.0.8412.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#android--december-2025--platform-1084120101). |
|Release - Android |Build 1.0.8321.0101 |GA |Build 1.0.8321.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#android--december-2025--platform-1083210101). |
|Release - macOS |Build 101.25102.0019 |GA |Release version 20.125102.19.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--december-2025--platform-101251020019). |
|Release - Windows |Windows Defender Antivirus: Platform 4.18.25110.6 / Engine 1.1.25110.1 |GA |See [enhancements and features for this release](msda-updates-previous-versions-technical-upgrade-support.md#november-2025-platform-418251106--engine-11251101). |
|Feature |[Triage collection](/azure/sentinel/datalake/sentinel-mcp-triage-tool) |Preview |Use triage collection to prioritize incidents and hunt threats with the Sentinel Model Context Protocol (MCP) server.|
|Feature |New Microsoft Secure Score recommendations |GA |Microsoft Secure Score now includes new recommendations to help organizations proactively prevent common endpoint attack techniques:<br> - **Disable Remote Registry service on Windows**: Prevents remote access to the Windows registry, reducing attack surface and blocking unauthorized configuration changes, privilege escalation, and lateral movement.<br> - **Disable NTLM authentication for Windows workstations**: Helps prevent credential theft and lateral movement attacks by removing support for an outdated and insecure protocol. |
|Feature |[CVE exceptions](/defender-vulnerability-management/tvm-exception-overview#types-of-exceptions) |GA |CVE exceptions are now generally available, and also support the **False positive** justification and the `status` field as part of the response for the `GET /api/vulnerabilities` request. [Learn more](api/get-all-vulnerabilities.md). |

## November 2025

|Type  |Feature  |Preview/GA  |Description  |
|---------|------------|-------------|-------------|
|Feature |New predictive shielding response actions |Preview |Defender for Endpoint now includes the [GPO hardening](respond-machine-alerts.md#gpo-hardening-preview) and [Safeboot hardening](respond-machine-alerts.md#safeboot-hardening-preview) response actions. These actions are part of the [predictive shielding](/defender-xdr/shield-predict-threats) feature, which anticipates and mitigates potential threats before they materialize.|
|Feature |[Custom data collection](custom-data-collection.md) |Preview |Custom data collection enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. |
|Feature |Vulnerability management moves under Exposure management |Preview |The **Vulnerability Management** section in the Microsoft Defender portal is now located under **Exposure management**. This change is part of the vulnerability management integration to Microsoft Security Exposure Management, which significantly expands the scope and capabilities of the platform. [Learn more](/defender-vulnerability-management/microsoft-defender-vulnerability-management-exposure-management). |
|Feature |New Microsoft Secure Score recommendations |GA |Microsoft Secure Score now includes new recommendations to help organizations proactively prevent common endpoint attack techniques:<br><br>- **Require LDAP client signing** or **Require LDAP server signing**: Helps ensure integrity of directory requests so attackers cannot tamper with or manipulate group memberships or permissions in transit.<br> - **Encrypt LDAP client traffic**: Prevents exposure of credentials and sensitive user information by enforcing encrypted communication instead of clear-text LDAP.<br>- **Enforce LDAP channel binding**: Stops adversaries from hijacking or relaying authentication sessions by binding NTLM authentication to a secure TLS channel. |
|Feature | Defender deployment tool<br/>- [for Windows devices](./defender-deployment-tool-windows.md)<br/>- [for Linux devices](./linux-install-with-defender-deployment-tool.md) | Preview | The new Defender deployment tool is a lightweight, self-updating application that streamlines onboarding devices to the Defender endpoint security solution. The tool takes care of prerequisites, automates migrations from older solutions, and removes the need for complex onboarding scripts, separate downloads, and manual installations. It supports Windows and Linux devices. |
|Feature | [Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security) | Preview | A Defender for endpoint security solution is now available for legacy Windows 7 SP1 and Windows Server 2008 R2 SP1 devices. The solution provides advanced protection capabilities and improved functionality for these devices compared to other solutions. The new solution is available using the new [Defender deployment tool](./defender-deployment-tool-windows.md). |
|Release - Windows |Windows Defender Antivirus: Platform 4.18.25100.9008 / Engine 1.1.25100.9002 |GA | See [enhancements and features for this release](msda-updates-previous-versions-technical-upgrade-support.md#october-2025-platform-418251009008--engine-11251009002). |

## October 2025

|Type  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Release - Android |Build 1.0.8217.0101 |GA |Build 1.0.8217.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#android--october-2025--platform-1082170101). |
|Release - Android |Build 1.0.8201.0101 |GA |Build 1.0.8201.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#android--october-2025--platform-1082010101). |
|Release - macOS |Build 101.25082.0006 |GA |Release version 20.125082.6.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--october-2025--platform-101250820006). |
|Release - iOS |Build 1.1.70230101 |GA |Build 1.1.70230101 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#ios--october-2025--platform-1170230101-1169250104). |
|Release - iOS |Build 1.1.69250104 |GA |Build 1.1.69250104 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#ios--october-2025--platform-1170230101-1169250104). |
|Release - Windows Antivirus |Platform 4.18.25100.9008 / Engine 1.1.25100.9002 |GA |Platform 4.18.25100.9008 and Engine 1.1.25100.9002 released: See [enhancements and features for this release](msda-updates-previous-versions-technical-upgrade-support.md#october-2025-platform-418251009008--engine-11251009002). |
|Feature |[Streamlined connectivity support for US government environments](configure-device-connectivity.md) |Preview |Defender for Endpoint now supports streamlined connectivity for US government cloud environments. This enhancement simplifies onboarding by reducing the number of required service endpoints and improves reliability across restricted networks. For more information, see the [required connectivity settings](gov.md#required-connectivity-settings). |
|Feature |Isolation exclusions |GA |The [Isolation exclusions](isolation-exclusions.md) feature is now generally available. Isolation exclusions allow designated processes or endpoints to bypass the restrictions of network isolation. This ensures that essential functions can continue while broader network exposure is limited. |
|Release - Linux |Build 101.25092.0001 |GA |Release version 30.125092.0001.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--october-2025--platform-101250920001). |
|Feature |[CVE exceptions](/defender-vulnerability-management/tvm-exception-overview#types-of-exceptions) |Preview |You can now use **CVE exceptions** to exclude specific Common Vulnerabilities and Exposures (CVEs) from analysis in your environment. CVE exceptions allow you to control what type of data is relevant to your organization and to selectively exclude certain data from your remediation efforts. For more information, see [Exceptions in Microsoft Defender Vulnerability Management](/defender-vulnerability-management/tvm-exception-overview) and [Create, view, and manage exceptions](/defender-vulnerability-management/tvm-exception). |
|Feature |New Microsoft Secure Score recommendations |GA |Microsoft Secure Score now includes new recommendations to help organizations proactively prevent common endpoint attack techniques:<br>- **Block web shell creation on servers** (reduces the risk of web-based persistence and remote code execution attacks)<br>- **Block use of copied or impersonated system tools** (helps prevent attacker misuse of legitimate administrative utilities for lateral movement or privilege escalation)<br>- **Block rebooting a machine in Safe Mode**: Helps defend against attackers who attempt to disable endpoint protection or persist through reboots. |

## September 2025

|Type  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Release - Android |Build 1.0.8102.0101 |GA |Build 1.0.8102.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#android--september-2025--platform-1081020101). |
|Release - macOS |Build 101.25072.0011 |GA |Release version 20.125072.11.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#macos--september-2025--platform-101250720011). |
|Release - macOS |[Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md) |GA |Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |
|Release - Linux |Build 101.25082.0003 |GA |Release version 30.125082.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--september-2025--platform-101250820003-build-1). |
|Release - Linux |Build 101.25072.0003 |GA |Release version 30.125072.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#linux--september-2025--platform-101250720003-build-2). |
|Release - iOS |Build 1.1.68200103 |GA |Build 1.1.68200103 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#ios--september-2025--platform-1168200103). |
