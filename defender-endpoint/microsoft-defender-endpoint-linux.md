---
title: Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Describes how to install and use Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: article
ms.subservice: linux
search.appverid: met150
ms.date: 03/31/2025
---

# Microsoft Defender for Endpoint on Linux

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

> [!TIP]
> We're excited to share that Microsoft Defender for Endpoint on Linux now extends support to Arm64-based Linux servers. For more information, see [April 2025 updates](whats-new-in-microsoft-defender-endpoint.md#april-2025).

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

## What is Microsoft Defender for Endpoint on Linux?

Microsoft Defender for Endpoint is a comprehensive enterprise endpoint security platform designed to help organizations prevent, detect, investigate, and respond to advanced threats. It safeguards a wide range of devices, including Windows and Mac client computers, Windows and Linux servers, as well as iOS and Android mobile devices.

The following table describes capabilities in Defender for Endpoint on Linux:

|Category|Description|
|---|---|
|Posture management| Defender for Endpoint on Linux combines monitoring and risk-based vulnerability management with intelligent prioritization, remediation, and tracking to help effectively manage and secure your Linux servers. <br><br>With a single pane-of-glass experience, your security team gains a comprehensive view of your organization's exposure score, recommendations, remediation, inventories, and more.|
|Threat protection| Defender for Endpoint on Linux includes next-generation antivirus protection using local & cloud-based machine learning models, behavior analysis, and heuristics. <br><br>Cloud protection provides near-instant detection and blocking of new/emerging threats.<br><br>You get dedicated, continuous protection with regular security intelligence and product updates. <br><br>You can also investigate and define policies for customer IP- and URL-based indicators of compromise.|
|Endpoint detection and response| Defender for Endpoint on Linux uses AI and advanced analytics to detect and respond to threats close to real time. <br><br> In the Microsoft Defender portal, you have a central location to view detections across the Microsoft Defender suite and your organization's devices. <br><br>You can use advanced hunting to view raw data and get more insight into your network events. <br><br>Response actions are available to act swiftly and nimbly on security alerts.|
|Streamlined management and operations| Defender for Endpoint on Linux offers broad coverage across a breadth of Linux distributions while making operations easier for your security team. <br><br>You can manage your security settings in the Microsoft Defender portal and plan your update cycles in advance, while supporting your Linux servers where they are, with offline and multicloud options.|
|Enterprise-grade scale, performance, and reliability| Microsoft Defender for Endpoint on Linux ensures stable and durable performance with a rich sensor framework that operates without kernel modules and integrates eBPF for operational stability. <br><br>Defender for Endpoint seamlessly integrates with the larger Microsoft Defender suite, offering extensibility through API integration, SIEM connectors, Power BI support, role-based access control (RBAC), and MSPP support.|

## Server licenses 

To onboard servers to Defender for Endpoint, server licenses are required. You can choose from the following options:

- Microsoft Defender for Servers Plan 1 or Plan 2
- Microsoft Defender for Endpoint for servers
- [Microsoft Defender for Business servers](/defender-business/get-defender-business?tabs=findpartner#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)

For more detailed information about licensing requirements for Microsoft Defender for Endpoint, see [Microsoft Defender for Endpoint licensing information](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint).

For detailed licensing information, see [Product Terms: Microsoft Defender for Endpoint]( https://www.microsoft.com/licensing/terms/productoffering/MicrosoftDefenderforEndpoint/EAEAS) and work with your account team to learn more about the terms and conditions.

<!---If/when we add a page about server licensing, let's add that link here.--->
  
## Deploy and configure policies for Defender for Endpoint on Linux 

There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux. Make sure to meet the [prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md).

- [Installer script based deployment](/defender-endpoint/linux-installer-script)
- [Ansible based deployment](/defender-endpoint/linux-install-with-ansible)
- [Chef based deployment](/defender-endpoint/linux-deploy-defender-for-endpoint-with-chef)
- [Puppet based deployment](/defender-endpoint/linux-install-with-puppet)
- [SaltStack based deployment](/defender-endpoint/linux-install-with-saltack)
- [Manual deployment](/defender-endpoint/linux-install-manually)
- [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
- [Deployment guidance for Defender for Endpoint on Linux Server with SAP](/defender-endpoint/mde-linux-deployment-on-sap)

> [!IMPORTANT]
> Installing Microsoft Defender for Endpoint in any location other than the default install path isn't supported. On Linux, Microsoft Defender for Endpoint creates an mdatp user with random UID and GID values. If you want to control these values, create an mdatp user before installation using the /usr/sbin/nologin shell option. Here's an example: `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

If you experience any installation issues, self-troubleshooting resources are available. See the links in the [See also](#see-also) section.

### Configure policies for Defender for Endpoint on Linux

To configure Defender for Endpoint on Linux, you can choose from two options to configure policies:

- [Enroll in Defender for Endpoint security settings management](/defender-endpoint/mde-security-settings-management) and use the Microsoft Defender portal to configure and manage your policies
- [Set up a configuration profile that uses a json file](/defender-endpoint/linux-preferences?branch=main&branchFallbackFrom=pr-en-us-2468%22%20%5Cl%20%22configuration-profile)

For more information, see [Configure security settings and policies for Defender for Endpoint on Linux](/defender-endpoint/linux-preferences).

## Software updates

Microsoft publishes software updates for Defender for Endpoint on Linux to improve performance, improve security, and deliver new features. Software updates are released on a monthly basis, following testing, and verification. Occasionally, it can take more than 30 days between releases. For more information, see [What's new in Defender for Endpoint on Linux](/defender-endpoint/linux-whatsnew)

Each version of Defender for Endpoint on Linux is set to expire automatically after nine months. We recommend using current versions so you get available enhancements and fixes. For more information, see [How to deploy updates for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-updates)

## Device health reporting

The Device Health report provides information about the antivirus status of Linux servers, including details such as antivirus mode, scan results, platform version, antivirus engine version, and security intelligence version. 

You can access this information either through the portal or via API. For more information, see the following articles:

- [Device health reporting in Microsoft Defender for Endpoint](/defender-endpoint/device-health-microsoft-defender-antivirus-health)
- [Microsoft Defender Antivirus export device antivirus health details API methods and properties](/defender-endpoint/device-health-microsoft-defender-antivirus-health)

## Response actions and live response 

The security operations team can remotely connect to a device and execute various response actions such as running an antivirus scan, isolating the device, and collecting investigation packages.

Additionally, they can use live response for a remote shell connection to perform in-depth investigative work. For more information, see the following articles:

- [Take response actions on a device](/defender-endpoint/respond-machine-alerts)
- [Investigate entities on devices using live response](/defender-endpoint/live-response)

## Privacy

Microsoft is committed to providing you with the information and controls you need to make choices about how your data is collected and used when you're using Defender for Endpoint on Linux.
  
For more information, see [Privacy for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-privacy).

## Common applications that Defender for Endpoint impacts 

High I/O workloads from certain applications can experience performance issues when Defender for Endpoint is installed. Such applications for developer scenarios include Jenkins and Jira, and database workloads like OracleDB and Postgres. 

If you see performance degradation, consider setting exclusions for trusted applications. See the following articles:

- [Configure and validate exclusions for Defender for Endpoint on Linux](/defender-endpoint/linux-exclusions)
- [Review common Exclusion Mistakes for Microsoft Defender Antivirus](/defender-endpoint/common-exclusion-mistakes-microsoft-defender-antivirus)
  
If you're using non-Microsoft applications, also see their documentation regarding antivirus exclusions.

## Next steps

- [Review the prerequisites for Defender for Endpoint on Linux](/defender-endpoint/mde-linux-prerequisites)
- [Deploy Defender for Endpoint on Linux](/defender-endpoint/linux-installer-script)
- [Configure Defender for Endpoint on Linux](/defender-endpoint/linux-preferences)
- [Deploy updates for Defender for Endpoint on Linux](/defender-endpoint/linux-updates)

## See also

- [Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus](mde-security-settings-management.md)
- [Linux Resources](linux-resources.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)
- [Investigate agent health issues](health-status.md)
- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](linux-support-events.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)

 > [!TIP]
> Do you want to learn more? Engage with the Microsoft Security community in our Tech Community: [Microsoft Defender for Endpoint Tech Community](https://techcommunity.microsoft.com/category/microsoft-defender-for-endpoint/discussions/microsoftdefenderatp)