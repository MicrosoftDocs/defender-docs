---
title: Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Learn about Microsoft Defender for Endpoint on Linux capabilities, including threat protection, EDR, vulnerability management, and deployment options for Linux servers.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: article
ms.subservice: linux
search.appverid: met150
ms.date: 05/18/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Microsoft Defender for Endpoint on Linux

> [!TIP]
> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial](https://go.microsoft.com/fwlink/p/?linkid=2225630).

Microsoft Defender for Endpoint on Linux helps organizations prevent, detect, investigate, and respond to advanced threats on Linux servers. The following table describes capabilities in Defender for Endpoint on Linux:

|Category|Description|
|---|---|
|**Next-generation protection**|Defender for Endpoint on Linux includes [next-generation antivirus protection](next-generation-protection.md) using local and cloud-based machine learning models, behavior analysis, and heuristics. <br/><br/> Cloud protection provides near-instant detection and blocking of new/emerging threats. <br/><br/> You get dedicated, continuous protection with regular security intelligence and product updates. You can [configure security settings](linux-preferences.md) including antivirus, cloud protection, and scan options. You can [schedule antivirus scans](schedule-anti-virus-scans-linux.md) and [detect and block potentially unwanted applications](linux-pua.md). <br/><br/> [Network protection](network-protection.md) and [web protection](web-protection-overview.md) (both currently in preview) help protect your Linux devices from web-based threats by controlling connections to malicious or unwanted sites. <br/><br/> You can also investigate and define policies for custom IP-based and URL-based [indicators of compromise](indicator-ip-domain.md) (also currently in preview on Linux).|
|**Endpoint detection and response (EDR)**|Defender for Endpoint on Linux uses AI and advanced analytics to [detect and respond to threats](overview-endpoint-detection-response.md) close to real time. <br/><br/> The Microsoft Defender portal at <https://security.microsoft.com> provides a central location to view detections across the Microsoft Defender suite and your organization's devices. <br/><br/> You can use [advanced hunting](/defender-xdr/advanced-hunting-overview) to view raw data and get more insight into your network events. <br/><br/> [Response actions](respond-machine-alerts.md) on Linux include: running antivirus scans, isolating devices, collecting investigation packages, and collecting files for deep analysis. You can also use [live response](live-response.md) for remote shell connections to perform in-depth investigations. <br/><br/> Automated investigation and response, EDR in block mode, and blocking/stopping/quarantining files and processes aren't available on Linux. For a complete comparison, see [Defender for Endpoint capabilities](microsoft-defender-endpoint.md#defender-for-endpoint-capabilities).|
|**Posture management**|Defender for Endpoint on Linux combines monitoring and risk-based [vulnerability management](/defender-vulnerability-management/defender-vulnerability-management) with intelligent prioritization, remediation, and tracking. These features enable you to manage and secure your Linux servers. <br/><br/> Your security team gains a singular, comprehensive view of your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score), [security recommendations](/defender-vulnerability-management/tvm-security-recommendation), [remediation activities](/defender-vulnerability-management/tvm-remediation), [software inventory](/defender-vulnerability-management/tvm-software-inventory), and more.|
|**Streamlined management and operations**|Defender for Endpoint on Linux offers broad coverage across a breadth of Linux distributions while making operations easier for your security team. <br/><br/> The Microsoft Defender portal allows you to manage your [security settings](linux-preferences.md) and plan your [update cycles](linux-updates.md) in advance. You can support your Linux servers with offline and multicloud options. <br/><br/> Defender for Endpoint provides a comprehensive set of [management APIs](api/management-apis.md) for programmatic access to device management, vulnerability management, and threat intelligence. For a full list of available APIs, see [Supported APIs](api/exposed-apis-list.md).|
|**Seamless integration and extensibility**|Microsoft Defender for Endpoint on Linux ensures stable and durable performance with a rich sensor framework that operates without kernel modules and integrates [eBPF](linux-support-ebpf.md) for operational stability. <br/><br/> Defender for Endpoint seamlessly integrates with the larger Microsoft Defender suite, offering extensibility through [API integration](api/apis-intro.md), SIEM connectors, [Power BI support](api/api-power-bi.md), role-based access control (RBAC), and MSPP support.|

> [!TIP]
>
> - All supported capabilities in Defender for Endpoint on Linux on AMD64 devices are also supported on the following Linux distributions on ARM64-based servers:
>   - Ubuntu
>   - RHEL
>   - Debian
>   - SUSE Linux
>   - Amazon Linux
>   - Oracle Linux
> - For a detailed comparison of supported features for all Defender for Endpoint platforms (Windows, macOS, and Linux), see [Defender for Endpoint capabilities](microsoft-defender-endpoint.md#defender-for-endpoint-capabilities).

## Deployment, configuration, and operations

For detailed guidance on licensing, prerequisites, deployment methods, policy configuration, software updates, device health reporting, response actions, and performance considerations for Defender for Endpoint on Linux, see the following resources:

- [Prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md) covers server licensing requirements and all supported deployment methods, including the recommended Deployment Tool, Ansible, Puppet, Chef, SaltStack, and manual options.
- [Configure Defender for Endpoint on Linux](linux-preferences.md) and [Security settings management in Microsoft Defender for Endpoint](/intune/device-security/microsoft-defender/security-settings-management) describe how to set up and manage security policies.
- [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md) and [Deploy updates for Defender for Endpoint on Linux](linux-updates.md) provide information about software updates and version management.
- [Device health reporting](device-health-microsoft-defender-antivirus-health.md) explains how to monitor antivirus status, scan results, and platform versions for your Linux servers.
- [Take response actions on a device](respond-machine-alerts.md) covers remote response actions and live response capabilities on Linux devices.
- [Configure and validate exclusions for Defender for Endpoint on Linux](linux-exclusions.md) helps you address performance issues with high I/O workloads from applications like Jenkins, Jira, OracleDB, and Postgres.

## Privacy

Microsoft is committed to providing the information and controls you need to choose how your data is collected and used in Defender for Endpoint on Linux.

For more information, see [Privacy for Microsoft Defender for Endpoint on Linux](linux-privacy.md).

## Next steps

- [Review the prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md)
- [Deploy Defender for Endpoint on Linux](linux-installer-script.md)
- [Configure Defender for Endpoint on Linux](linux-preferences.md)

## See also

- <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus</a>
- [Linux Resources](linux-resources.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)
- [Investigate agent health issues](health-status.md)
- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](linux-support-events.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)
