---
title: Microsoft Defender for Endpoint on Windows
ms.reviewer: pahuijbr
description: Learn about Microsoft Defender for Endpoint on Windows capabilities, including threat protection, EDR, attack surface reduction, vulnerability management, and deployment options.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-windows
ms.topic: overview
search.appverid: met150
ms.date: 05/19/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Microsoft Defender for Endpoint on Windows

Microsoft Defender for Endpoint on Windows provides preventative protection, post-breach detection, automated investigation, and response for Windows endpoints. The following table describes capabilities in Defender for Endpoint on Windows:

| Category | Description |
|---|---|
| Threat protection | Defender for Endpoint on Windows includes [next-generation antivirus protection](next-generation-protection.md) that uses behavior-based, cloud-delivered, and machine-learning techniques. <br/><br/> [Behavioral blocking and containment](behavioral-blocking-containment.md) detects and blocks malicious behaviors and helps contain compromised devices. <br/><br/> [Web protection](web-protection-overview.md) guards against malicious websites, phishing attempts, and web-based threats. [Network protection](network-protection.md) blocks connections to malicious network destinations. <br/><br/> [Attack surface reduction](overview-attack-surface-reduction.md) capabilities, including [attack surface reduction rules](attack-surface-reduction.md) and [device control](device-control-overview.md), reduce exposure to common attack techniques such as credential theft, malware execution, and unauthorized use of removable storage. <br/><br/> [Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) safeguards critical security settings from unauthorized changes. [Firewall](configure-environment.md) configuration enables Defender for Endpoint service connectivity. |
| Endpoint detection and response | Defender for Endpoint on Windows uses AI and advanced analytics to [detect and respond to threats](overview-endpoint-detection-response.md) close to real time. The Microsoft Defender portal at <https://security.microsoft.com> provides a central location to view detections and manage your organization's devices. <br/><br/> You can use [advanced hunting](/defender-xdr/advanced-hunting-overview) to query raw event data and gain deeper insight into your network events. [Threat analytics](threat-analytics.md) provides curated intelligence reports about active and emerging threats. <br/><br/> [EDR in block mode](edr-in-block-mode.md) enables Defender for Endpoint to block and remediate threats even when Microsoft Defender Antivirus runs in passive mode. <br/><br/> [Response actions](respond-machine-alerts.md) include running antivirus scans, isolating devices, collecting investigation packages, and collecting files for deep analysis. You can also use [live response](live-response.md) for remote shell connections to perform in-depth investigations. <br/><br/> [Endpoint Attack Notifications](endpoint-attack-notifications.md) provide proactive hunting and prioritization to help identify and respond to the most critical threats. |
| Posture management | Defender for Endpoint on Windows offers risk-based [vulnerability management](/defender-vulnerability-management/defender-vulnerability-management) with intelligent prioritization, remediation, and tracking. These features help you manage and secure your Windows devices. <br/><br/> Your security team gets a comprehensive view of your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score), [security recommendations](/defender-vulnerability-management/tvm-security-recommendation), [remediation activities](/defender-vulnerability-management/tvm-remediation), [software inventory](/defender-vulnerability-management/tvm-software-inventory), and [Microsoft Secure Score for Devices](/defender-vulnerability-management/tvm-microsoft-secure-score-devices). |
| Streamlined management and operations | Defender for Endpoint on Windows integrates with your existing management tools, including [Microsoft Intune](/mem/intune/protect/advanced-threat-protection) and [Group Policy](configure-endpoints-gp.md). <br/><br/> [Security settings management](/intune/intune-service/protect/mde-security-integration) lets you manage security policies directly from the Microsoft Defender portal. <br/><br/> Defender for Endpoint provides a comprehensive set of [management APIs](api/management-apis.md) for programmatic access to device management, vulnerability management, and threat intelligence. [Partner integrations](partner-integration.md) enable integration with Microsoft and non-Microsoft security solutions. |
| Enterprise-grade scale, performance, and reliability | Microsoft Defender for Endpoint on Windows ensures stable and durable performance with a lightweight behavioral sensor built into the operating system. <br/><br/> Defender for Endpoint integrates seamlessly with the broader Microsoft Defender suite, offering extensibility through [API integration](api/apis-intro.md), SIEM connectors, [Power BI support](api/api-power-bi.md), and role-based access control (RBAC). |
| Automated investigation and response | [Automated investigation and response (AIR)](automated-investigations.md) automatically investigates alerts and remediates threats, reducing the burden on security teams. <br/><br/> [Device isolation](respond-machine-alerts.md#isolate-devices-from-the-network) isolates compromised devices to prevent lateral movement. |
| Device and network discovery | [Endpoint and network device discovery](device-discovery.md) discovers unmanaged endpoints, network devices, and IoT devices on the corporate network, helping you maintain visibility and protection. |

> [!TIP]
> For a detailed comparison of supported features for all Defender for Endpoint platforms (Windows, macOS, and Linux), see [Defender for Endpoint capabilities](microsoft-defender-endpoint.md#defender-for-endpoint-capabilities).

## Core security features

The following table summarizes the core security features available on Windows:

| Feature | Description |
|---|---|
| [Next-generation protection](next-generation-protection.md) | Antivirus and antimalware protection that uses behavior-based, cloud-delivered, and machine-learning techniques. |
| [Behavioral blocking and containment](behavioral-blocking-containment.md) | Detects and blocks malicious behaviors and helps contain compromised devices. |
| [Web protection](web-protection-overview.md) | Protects devices from malicious websites, phishing attempts, and web-based threats. |
| [Firewall](configure-environment.md) | Configure firewall and proxy settings to enable Defender for Endpoint service connectivity. |
| [Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) | Prevents unauthorized changes to critical security settings on endpoints. |
| [Passive mode](microsoft-defender-passive-mode.md) | Runs Microsoft Defender Antivirus in monitoring mode alongside a non-Microsoft antivirus. |

## Attack surface reduction

[Attack surface reduction](overview-attack-surface-reduction.md) capabilities help you reduce exposure to common attack techniques:

| Feature | Description |
|---|---|
| [Attack surface reduction rules](attack-surface-reduction.md) | Block common attack techniques, such as credential theft and malware execution. |
| [Device control](device-control-overview.md) | Manage and audit the use of removable storage and peripheral devices. |
| [Network protection](network-protection.md) | Block connections to malicious network destinations. |

## Threat and vulnerability management

These capabilities help you identify, assess, and remediate vulnerabilities and misconfigurations to reduce risk:

| Feature | Description |
|---|---|
| [Vulnerability assessment](/defender-vulnerability-management/defender-vulnerability-management) | Identifies software vulnerabilities and misconfigurations on devices. |
| [Security recommendations](/defender-vulnerability-management/tvm-security-recommendation) | Actionable guidance to reduce endpoint risk. |
| [Remediation tracking](/defender-vulnerability-management/tvm-remediation) | Tracks remediation activities and exposure reduction. |
| [Microsoft Secure Score for Devices](/defender-vulnerability-management/tvm-microsoft-secure-score-devices) | Assesses the security state of your network, identifies unprotected systems, and provides actions to improve your organization's overall security. |

## Device and network discovery

| Feature | Description |
|---|---|
| [Endpoint and network device discovery](device-discovery.md) | Discovers unmanaged endpoints, network devices, and IoT devices on the corporate network. |

## Endpoint detection and response (EDR)

These capabilities help you detect, investigate, and respond to advanced threats that might bypass preventative defenses:

| Feature | Description |
|---|---|
| [Endpoint detection and response](overview-endpoint-detection-response.md) | Detects advanced threats and suspicious activity on endpoints and provides investigation capabilities. |
| [Advanced hunting](/defender-xdr/advanced-hunting-overview) | Query-based threat hunting for endpoint telemetry. |
| [Threat analytics](threat-analytics.md) | Curated intelligence reports about active and emerging threats. |
| [EDR in block mode](edr-in-block-mode.md) | Enables Defender for Endpoint to block and remediate threats even when Microsoft Defender Antivirus runs in passive mode. |
| [Live response](live-response.md) | Provides a secure remote shell to investigate and remediate compromised devices in real time. |
| [Endpoint Attack Notifications](endpoint-attack-notifications.md) | Proactive hunting and prioritization that helps identify and respond to the most critical threats. |

## Automated investigation and response

| Feature | Description |
|---|---|
| [Automated investigation and response (AIR)](automated-investigations.md) | Automatically investigates alerts and remediates threats. |
| [Device isolation](respond-machine-alerts.md#isolate-devices-from-the-network) | Isolates compromised devices to prevent lateral movement. |

## Investigation and response actions

| Feature | Description |
|---|---|
| [Collect investigation package](investigate-machines.md) | Collects forensic data from a device for offline analysis. |
| [Run antivirus scan](run-scan-microsoft-defender-antivirus.md) | Initiates on-demand antivirus scans on a device. |
| [Collect file and deep analysis](respond-file-alerts.md) | Collects files from devices and submits them to a secure cloud sandbox for deep analysis. |
| [Block, stop, and quarantine files](respond-file-alerts.md) | Stops malicious processes and quarantines files in the environment. |

## Indicators and custom detections

| Feature | Description |
|---|---|
| [Custom file indicators](indicator-file.md) | Create allow or block rules based on file hashes. |
| [Custom network indicators](indicator-ip-domain.md) | Allow or block IP addresses, URLs, or domains based on custom threat intelligence. |

## APIs and integrations

| Feature | Description |
|---|---|
| [Management and automation APIs](api/management-apis.md) | Automate workflows and integrate Defender for Endpoint into your existing processes. |
| [Partner integrations](partner-integration.md) | Integration with Microsoft and non-Microsoft security solutions. |

## Antivirus solution compatibility

The Microsoft Defender for Endpoint agent depends on Microsoft Defender Antivirus for some capabilities, such as file scanning.

| Feature | Description |
|---|---|
| [Microsoft Defender Antivirus dependency](microsoft-defender-antivirus-compatibility.md) | Defender for Endpoint relies on Microsoft Defender Antivirus for selected capabilities, including file scanning. |
| [Security intelligence updates](microsoft-defender-antivirus-updates.md#security-intelligence-updates) | Keep security intelligence and the scan engine up to date on onboarded devices. |
| [Platform updates](microsoft-defender-endpoint-releases.md#microsoft-defender-antivirus-releases) | Keep the Microsoft Defender Antivirus platform current on onboarded devices. |
| [Passive mode with non-Microsoft antimalware](microsoft-defender-antivirus-compatibility.md) | When a non-Microsoft antimalware client is active, Microsoft Defender Antivirus runs in passive mode, continues to receive updates, and `msmpeng.exe` remains running. |

> [!IMPORTANT]
> Endpoint detection and response (EDR) in Microsoft Defender for Endpoint doesn't adhere to the Microsoft Defender Antivirus Exclusions settings.

For optimal protection, configure [security intelligence updates](microsoft-defender-antivirus-updates.md#security-intelligence-updates) and [platform updates](microsoft-defender-endpoint-releases.md#microsoft-defender-antivirus-releases) for onboarded devices, whether Microsoft Defender Antivirus is the active antimalware solution or not.

When an onboarded device uses a non-Microsoft antimalware client and Microsoft Defender Antivirus is in passive mode, Microsoft Defender Antivirus doesn't perform real-time protection scans, scheduled scans, or on-demand scans, and it doesn't replace the non-Microsoft antimalware client. In addition, the Microsoft Defender Antivirus user interface is disabled, and users can't run on-demand scans or configure most options (for example, Attack Surface Reduction (ASR) rules, Network Protection, Indicators - File/IP address/URL/Certificates allow/block, Web Content Filtering, and Controlled Folder Access).

For more information, see [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md) and [Microsoft Defender Antivirus and Microsoft Defender for Endpoint compatibility topic](microsoft-defender-antivirus-compatibility.md).

## Related content

- [Review the minimum requirements for Defender for Endpoint](minimum-requirements.md)
- [Onboard devices and configure capabilities](onboard-configure.md)
- [Configure Defender for Endpoint security settings](/intune/intune-service/protect/mde-security-integration)

