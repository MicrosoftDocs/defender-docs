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
|Next-generation protection|Defender for Endpoint on Linux includes [next-generation antivirus protection](next-generation-protection.md) using local and cloud-based machine learning models, behavior analysis, and heuristics. <br/><br/> Cloud protection provides near-instant detection and blocking of new/emerging threats. <br/><br/> You get dedicated, continuous protection with regular security intelligence and product updates. You can [configure security settings](linux-preferences.md) including antivirus, cloud protection, and scan options. You can [schedule antivirus scans](schedule-anti-virus-scans-linux.md) and [detect and block potentially unwanted applications](linux-pua.md). <br/><br/> [Network protection](network-protection.md) and [web protection](web-protection-overview.md) (both currently in preview) help protect your Linux devices from web-based threats by controlling connections to malicious or unwanted sites. <br/><br/> You can also investigate and define policies for custom IP-based and URL-based [indicators of compromise](indicator-ip-domain.md) (also currently in preview on Linux).|
|Endpoint detection and response (EDR)|Defender for Endpoint on Linux uses AI and advanced analytics to [detect and respond to threats](overview-endpoint-detection-response.md) close to real time. <br/><br/> The Microsoft Defender portal at <https://security.microsoft.com> provides a central location to view detections across the Microsoft Defender suite and your organization's devices. <br/><br/> You can use [advanced hunting](/defender-xdr/advanced-hunting-overview) to view raw data and get more insight into your network events. <br/><br/> [Response actions](respond-machine-alerts.md) on Linux include: running antivirus scans, isolating devices, collecting investigation packages, and collecting files for deep analysis. You can also use [live response](live-response.md) for remote shell connections to perform in-depth investigations. <br/><br/> Automated investigation and response, EDR in block mode, and blocking/stopping/quarantining files and processes aren't available on Linux. For a complete comparison, see [Defender for Endpoint capabilities](microsoft-defender-endpoint.md#defender-for-endpoint-capabilities).|
|Posture management|Defender for Endpoint on Linux combines monitoring and risk-based [vulnerability management](/defender-vulnerability-management/defender-vulnerability-management) with intelligent prioritization, remediation, and tracking. These features enable you to manage and secure your Linux servers. <br/><br/> Your security team gains a singular, comprehensive view of your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score), [security recommendations](/defender-vulnerability-management/tvm-security-recommendation), [remediation activities](/defender-vulnerability-management/tvm-remediation), [software inventory](/defender-vulnerability-management/tvm-software-inventory), and more.|
|Streamlined management and operations|Defender for Endpoint on Linux offers broad coverage across a breadth of Linux distributions while making operations easier for your security team. <br/><br/> The Microsoft Defender portal allows you to manage your [security settings](linux-preferences.md) and plan your [update cycles](linux-updates.md) in advance. You can support your Linux servers with offline and multicloud options. <br/><br/> Defender for Endpoint provides a comprehensive set of [management APIs](api/management-apis.md) for programmatic access to device management, vulnerability management, and threat intelligence. For a full list of available APIs, see [Supported APIs](api/exposed-apis-list.md).|
|Seamless integration and extensibility|Microsoft Defender for Endpoint on Linux ensures stable and durable performance with a rich sensor framework that operates without kernel modules and integrates [eBPF](linux-support-ebpf.md) for operational stability. <br/><br/> Defender for Endpoint seamlessly integrates with the larger Microsoft Defender suite, offering extensibility through [API integration](api/apis-intro.md), SIEM connectors, [Power BI support](api/api-power-bi.md), role-based access control (RBAC), and MSPP support.|

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

## Server licenses

To onboard servers to Defender for Endpoint, you need server licenses. You can choose from the following options:

- Microsoft Defender for Servers Plan 1 or Plan 2
- Microsoft Defender for Endpoint for servers
- [Microsoft Defender for Business servers](/defender-business/get-defender-business?tabs=findpartner#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)

For more information about licensing requirements for Microsoft Defender for Endpoint, see [Microsoft Defender for Endpoint licensing information](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint).

For detailed licensing information, see [Product Terms: Microsoft Defender for Endpoint](https://www.microsoft.com/licensing/terms/productoffering/MicrosoftDefenderforEndpoint/EAEAS) and work with your account team to learn more about the terms and conditions.

<!---If/when we add a page about server licensing, let's add that link here.--->

## Deploy and configure policies for Defender for Endpoint on Linux

There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux. Make sure to meet the [prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md).

> [!NOTE]
> We recommend using [Deployment Tool based deployment](/defender-endpoint/linux-install-with-defender-deployment-tool). Deployment Tool based deployment simplifies the onboarding process, reduces manual tasks, and supports new installations, upgrades, and uninstalls.

- [Deployment tool based deployment (Recommended)](./linux-install-with-defender-deployment-tool.md)
- [Installer script based deployment](linux-installer-script.md)
- [Ansible based deployment](linux-install-with-ansible.md)
- [Chef based deployment](linux-deploy-defender-for-endpoint-with-chef.md)
- [Puppet based deployment](linux-install-with-puppet.md)
- [SaltStack based deployment](linux-install-with-saltack.md)
- [Golden Image based deployment](linux-deploy-defender-for-endpoint-using-golden-images.md)
- [Deployment to a custom location](linux-custom-location-installation.md)
- [Manual deployment](linux-install-manually.md)
- [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
- [Deployment guidance for Defender for Endpoint on Linux Server with SAP](mde-linux-deployment-on-sap.md)

> [!IMPORTANT]
> On Linux, Microsoft Defender for Endpoint creates an mdatp user with random UID and GID values. If you want to control these values, create an mdatp user before installation using the /usr/sbin/nologin shell option. Here's an example: `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

If you experience any installation issues, self-troubleshooting resources are available in the [See also](#see-also) section.

### Configure policies for Defender for Endpoint on Linux

To configure Defender for Endpoint on Linux, choose from the following options:

- <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Enroll in Defender for Endpoint security settings management</a> and use the Microsoft Defender portal to configure and manage your policies.
- [Set up a configuration profile that uses a JSON file](linux-preferences.md).

For more information, see [Configure security settings and policies for Defender for Endpoint on Linux](linux-preferences.md).

## Software updates

Microsoft publishes software updates for Defender for Endpoint on Linux to improve performance, improve security, and deliver new features. Software updates are released on a monthly basis, following testing, and verification. Occasionally, it can take more than 30 days between releases. For more information, see [What's new in Defender for Endpoint on Linux](linux-whatsnew.md).

Each version of Defender for Endpoint on Linux is set to expire automatically after nine months. We recommend using current versions so you get available enhancements and fixes. For more information, see [How to deploy updates for Microsoft Defender for Endpoint on Linux](linux-updates.md).

## Device health reporting

The Device Health report provides information about the antivirus status of Linux servers. For example:

- Antivirus mode.
- Scan results.
- Platform version.
- Antivirus engine version.
- Security intelligence version.

You can access this information through the portal or via API. For more information, see the following articles:

- [Device health reporting in Microsoft Defender for Endpoint](device-health-microsoft-defender-antivirus-health.md)
- [Export device antivirus health details API methods and properties](api/device-health-api-methods-properties.md)

## Response actions and live response

Your security operations team can remotely connect to a device and execute various response actions. For example:

- Run an antivirus scan.
- Isolate the device.
- Collect investigation packages.

Your team can also use live response for a remote shell connection to perform in-depth investigative work. For more information, see the following articles:

- [Take response actions on a device](respond-machine-alerts.md)
- [Investigate entities on devices using live response](live-response.md)

## Privacy

Microsoft is committed to providing the information and controls you need to choose how your data is collected and used in Defender for Endpoint on Linux.

For more information, see [Privacy for Microsoft Defender for Endpoint on Linux](linux-privacy.md).

## Common applications that Defender for Endpoint impacts

High I/O workloads from certain applications can experience performance issues when Defender for Endpoint is installed. Such applications for developer scenarios include Jenkins and Jira, and database workloads like OracleDB and Postgres.

If you see performance degradation, consider setting exclusions for trusted applications. For more information, see the following articles:

- [Configure and validate exclusions for Defender for Endpoint on Linux](linux-exclusions.md)
- [Review common Exclusion Mistakes for Microsoft Defender Antivirus](common-exclusion-mistakes-microsoft-defender-antivirus.md)

If you're using non-Microsoft applications, also see their documentation regarding antivirus exclusions.

## Next steps

- [Review the prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md)
- [Deploy Defender for Endpoint on Linux](linux-installer-script.md)
- [Configure Defender for Endpoint on Linux](linux-preferences.md)
- [Deploy updates for Defender for Endpoint on Linux](linux-updates.md)

## See also

- <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus</a>
- [Linux Resources](linux-resources.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)
- [Investigate agent health issues](health-status.md)
- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](linux-support-events.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)
