---
title: What's new in Microsoft Defender for Endpoint
description: This article describes new features available in Microsoft Defender for Endpoint, including both Windows and cross-platform updates.
ms.topic: whats-new
ms.service: defender-endpoint
author: lwainstein
ms.author: lwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 11/19/2025
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier1
#Customer.intent: As a security administrator or IT professional, stay up to date with the latest features, improvements, and changes in Microsoft Defender for Endpoint and related security products, so that you can ensure your organization benefits from new capabilities, stays protected against emerging threats, and takes advantage of enhancements as soon as they become available.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# What's new in Microsoft Defender for Endpoint

This article describes Microsoft Defender for Endpoint features that are in preview or generally available (GA) in the latest release.

Learn more:

- [Microsoft Defender for Endpoint supported versions](microsoft-defender-endpoint-versions.md)
- [Preview features](/defender-xdr/preview)

## January 2026

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|All |[Device vulnerabilities report](tvm-vulnerable-devices-report.md) enhancements |Preview |To simplify and streamline the Device vulnerabilities report experience, the Vulnerable devices report now includes the following changes and enhancements:<br><br>- The **Vulnerable devices by Windows 10/11 version over time** section has been removed.<br>- The report's filters have been simplified to only include the **Device group** filter.<br>- The report's history is now limited to the last 30 days.<br><br> **Note**: These changes are not yet visible to government cloud customers and will be visible in late January 2026. |

## December 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8412.0101 |GA |Build 1.0.8412.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--december-2025--1084120101). |
|Android |Build 1.0.8321.0101 |GA |Build 1.0.8321.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--december-2025--1083210101). |
|macOS |Build 101.25102.0019 |GA |Release version 20.125102.19.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--december-2025--101251020019). |
|All |[Triage collection](/azure/sentinel/datalake/sentinel-mcp-triage-tool) |Preview |Use triage collection to prioritize incidents and hunt threats with the Sentinel Model Context Protocol (MCP) server.|
|All |New Microsoft Secure Score recommendations |Preview |Microsoft Secure Score now includes new recommendations to help organizations proactively prevent common endpoint attack techniques: - **Disable Remote Registry service on Windows**: Prevents remote access to the Windows registry, reducing attack surface and blocking unauthorized configuration changes, privilege escalation, and lateral movement.<br> - **Disable NTLM authentication for Windows workstations**: Helps prevent credential theft and lateral movement attacks by removing support for an outdated and insecure protocol. |
|All |[CVE exceptions](/defender-vulnerability-management/tvm-exception-overview#types-of-exceptions) |GA |CVE exceptions are now generally available, and also support the **False positive** justification and the `status` field as part of the response for the `GET /api/vulnerabilities` request. [Learn more](/defender-endpoint/api/get-all-vulnerabilities). |

## November 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Windows Antivirus |Platform 4.18.25110.6 / Engine 1.1.25110.1 |GA |Platform 4.18.25110.6 and Engine 1.1.25110.1 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--november-2025--platform-418251106--engine-11251101). |
|Android |Build 1.0.8315.0101 |GA |Build 1.0.8315.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--november-2025--1083150101). |
|Android |Build 1.0.8303.0101 |GA |Build 1.0.8303.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--november-2025--1083030101). |
|macOS |Build 101.25102.0016 |GA |Release version 20.125102.16.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--november-2025--101251020016). |
|iOS |Build 1.1.70290103 |GA |Build 1.1.70290103 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#ios--november-2025--1170290103). |
|Windows |New predictive shielding response actions |Preview |Defender for Endpoint now includes the [GPO hardening](respond-machine-alerts.md#gpo-hardening) and [Safeboot hardening](respond-machine-alerts.md#safeboot-hardening) response actions. These actions are part of the [predictive shielding](/defender-xdr/shield-predict-threats) feature, which anticipates and mitigates potential threats before they materialize.|
|All |[Custom data collection](custom-data-collection.md) |Preview |Custom data collection enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. |
| Windows, Linux | Defender deployment tool<br/>- [for Windows devices](./defender-deployment-tool-windows.md)<br/>- [for Linux devices](./linux-install-with-defender-deployment-tool.md) |Preview | The new Defender deployment tool is a lightweight, self-updating application that streamlines onboarding devices to the Defender endpoint security solution. The tool takes care of prerequisites, automates migrations from older solutions, and removes the need for complex onboarding scripts, separate downloads, and manual installations. It currently supports Windows and Linux devices. |
| Windows | [Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security) |Preview | A Defender for endpoint security solution is now available for legacy Windows 7 SP1 and Windows Server 2008 R2 SP1 devices. The solution provides advanced protection capabilities and improved functionality for these devices compared to other solutions. The new solution is available using the new [Defender deployment tool](./defender-deployment-tool-windows.md). |
|All |Vulnerability Management section moved under Exposure management |Preview |The **Vulnerability Management** section in the Microsoft Defender portal is now located under **Exposure management**. This change is part of the vulnerability management integration to Microsoft Security Exposure Management, which significantly expands the scope and capabilities of the platform. [Learn more](/defender-vulnerability-management/microsoft-defender-vulnerability-management-exposure-management). |
|All |New Microsoft Secure Score recommendations |GA |Microsoft Secure Score now includes new recommendations to help organizations proactively prevent common endpoint attack techniques:<br>- **Require LDAP client signing**: Helps ensure integrity of directory requests so attackers can't tamper with or manipulate group memberships or permissions in transit.<br>- **Require LDAP server signing**: Helps ensure integrity of directory requests so attackers can't tamper with or manipulate group memberships or permissions in transit.<br>- **Encrypt LDAP client traffic**: Prevents exposure of credentials and sensitive user information by enforcing encrypted communication instead of clear-text LDAP.<br>- **Enforce LDAP channel binding**: Prevents man-in-the-middle relay attacks by ensuring the authentication is cryptographically tied to the TLS session. |
|All |Microsoft Secure Score recommendations |GA |These Microsoft Secure Score recommendations are now generally available:<br>- **Block web shell creation on servers**<br>- **Block use of copied or impersonated system tools**<br>- **Block rebooting a machine in Safe Mode**. |

## October 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8217.0101 |GA |Build 1.0.8217.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--october-2025--1082170101). |
|Android |Build 1.0.8201.0101 |GA |Build 1.0.8201.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--october-2025--1082010101). |
|macOS |Build 101.25082.0006 |GA |Release version 20.125082.6.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--october-2025--101250820006). |
|iOS |Build 1.1.70230101 |GA |Build 1.1.70230101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#ios--october-2025--1170230101-1169250104). |
|iOS |Build 1.1.69250104 |GA |Build 1.1.69250104 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#ios--october-2025--1170230101-1169250104). |
|Windows Antivirus |Platform 4.18.25100.9008 / Engine 1.1.25100.9002 |GA |Platform 4.18.25100.9008 and Engine 1.1.25100.9002 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--october-2025--platform-418251009008--engine-11251009002). |
|All |[Streamlined connectivity support for US government environments (GCC, GCC High, DoD)](configure-device-connectivity.md) |Preview |Defender for Endpoint now supports streamlined connectivity for US government cloud environments. This enhancement simplifies onboarding by reducing the number of required service endpoints and improves reliability across restricted networks. For more information, see the [required connectivity settings](gov.md#required-connectivity-settings). |
|All |Isolation exclusions |GA |The [Isolation exclusions](isolation-exclusions.md) feature is now generally available. Isolation exclusions allow designated processes or endpoints to bypass the restrictions of network isolation, ensuring essential functions continue while limiting broader network exposure. |
|Linux |Build 101.25092.0001 |GA |Release version 30.125092.0001.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--october-2025--101250920001). |
|All |[CVE exceptions](/defender-vulnerability-management/tvm-exception-overview#types-of-exceptions) |Preview |You can now use **CVE exceptions** to exclude specific Common Vulnerabilities and Exposures (CVEs) from analysis in your environment. CVE exceptions allow you to control what type of data is relevant to your organization and to selectively exclude certain data from your remediation efforts. For more information, see [Exceptions in Microsoft Defender Vulnerability Management](/defender-vulnerability-management/tvm-exception-overview) and [Create, view, and manage exceptions](/defender-vulnerability-management/tvm-exception). |
|All |New Microsoft Secure Score recommendations |Preview |Microsoft Secure Score now includes new recommendations to help organizations proactively prevent common endpoint attack techniques:<br>- **Block web shell creation on servers** (reduces the risk of web-based persistence and remote code execution attacks)<br>- **Block use of copied or impersonated system tools** (helps prevent attacker misuse of legitimate administrative utilities for lateral movement or privilege escalation)<br>- **Block rebooting a machine in Safe Mode**: Helps defend against attackers who attempt to disable endpoint protection or persist through reboots. |

## September 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8102.0101 |GA |Build 1.0.8102.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--september-2025--1081020101). |
|macOS |Build 101.25072.0011 |GA |Release version 20.125072.11.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--september-2025--101250720011). |
|Windows Antivirus |Platform 4.18.25090.3009 / Engine 1.1.25090.3001 |GA |Platform 4.18.25090.3009 and Engine 1.1.25090.3001 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--september-2025--platform-418250903009--engine-11250903001). |
|macOS |[Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md) |GA |Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |
|Linux |Build 101.25082.0003 |GA |Release version 30.125082.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--september-2025--101250820003-build-1). |
|Linux |Build 101.25072.0003 |GA |Release version 30.125072.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--september-2025--101250720003-build-2). |
|iOS |Build 1.1.68200103 |GA |Build 1.1.68200103 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#ios--september-2025--1168200103). |

## August 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8018.0103 |GA |Build 1.0.8018.0103 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--august-2025--1080180103). |
|macOS |Build 101.25062.0006 |GA |Release version 20.125062.6.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--august-2025--101250620006). |
|Windows Antivirus |Platform 4.18.25080.5 / Engine 1.1.25080.5 |GA |Platform 4.18.25080.5 and Engine 1.1.25080.5 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--august-2025--platform-418250805--engine-11250805). |
|macOS |[Behavior Monitoring](behavior-monitor-macos.md) |GA |Defender for Endpoint can now monitor process behavior to detect and analyze potential threats based on the behavior of the applications, daemons, and files within the system. Learn more: [Behavior Monitoring in Microsoft Defender for Endpoint on macOS](behavior-monitor-macos.md) and [Behavior Monitoring GA announcement blog](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/behavior-monitoring-is-now-generally-available-for-microsoft-defender-for-endpoi/4415697). |
|Linux |Build 101.25062.0003 |GA |Release version 30.125062.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--august-2025--101250620003). |
|iOS |Build 1.1.68140102 |GA |Build 1.1.68140102 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#ios--august-2025--1168140102). |

## July 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.7901.0101 |GA |Build 1.0.7901.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--july-2025--1079010101). |
|macOS |Build 101.25062.0005 |GA |Release version 20.125062.5.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--july-2025--101250620005). |
|Linux |Build 101.25052.0007 |GA |Release version 30.125052.0007.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--july-2025--101250520007). |
|iOS |Build 1.1.67040101 |GA |Build 1.1.67040101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#ios--july-2025--1167040101). |