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
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
ms.date: 02/25/2025
---

# Microsoft Defender for Endpoint on Linux

>[!TIP]  We're excited to share that Microsoft Defender for Endpoint on Linux now extends support to Arm64-based Linux servers in preview. For more information, see [Microsoft Defender for Endpoint on Linux for Arm64-based devices (preview)](https://learn.microsoft.com/en-us/defender-endpoint/mde-linux-arm).

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

want to experience Microsoft Defender for Endpoint?[Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

# What is Microsoft Defender for Endpoint on Linux 

Microsoft Defender for Endpoint is an enterprise endpoint security platform designed to help organizations prevent, detect, investigate, and respond to advanced threats. Defender for Endpoint protects devices, including Windows & Mac client computers, Windows & Linux servers, and iOS & Android mobile devices.

The following table describes capabilities in Defender for Endpoint: 


|Category|Description|
|---|---|

|Posture management|Defender for Endpoint combines asset discovery & monitoring, risk-based vulnerability management with intelligent prioritization, remediation, and tracking to help effectively manage and ring fence your secure posture across your Linux servers. A single pane-of-glass experience gives your security team a high-level view of your organization's exposure score, recommendations, remediations, inventories, and more.|

|Threat protection|Defender for Endpoint includes next-generation antivirus/anti-malware protection using local & cloud-based machine learning models, behavior analysis, and heuristics. Cloud protection provides near-instant detection and blocking of new/emerging threats. You get dedicated, continuous protection with regular security intelligence and product updates. And, you can investigate and define policies for customer IP- and URL-based indicators of compromise.|

|Endpoint detection and response| Defender for Endpoint uses AI and advanced analytics to detect and respond to threats in near real time. In the Microsoft Defender portal, you have a central location to view detections across the Microsoft Defender suite and your organization's devices. You can use advanced hunting to view raw data and get more insight into your network events. Response actions are available to act swiftly and nimbly on security alerts.|

|Streamlined management and operations|Defender for Endpoint offers broad coverage across a breadth of Linux distributions while making operations easier for your security team. You can manage your security policies and settings in the Microsoft Defender portal. You can also plan your update cycles in advance, and support your Linux servers where they are, with offline and multicloud options.|

|Enterprise-grade scale, performance, and reliability| Defender for Endpoint helps ensure stable, durable performance. A rich sensor framework with no kernel modules and eBPF integration provide operational stability. Defender for Endpoint integrates with the larger Microsoft Defender suite. And, you get extensibility with API integration, SIEM connectors, Power BI support, role-based access control (RBAC), and MSPP support.|

# Server licenses 

To deploy Defender for Endpoint on servers, server licenses are required. You can choose from these options: 

- Microsoft Defender for Servers Plan 1 or Plan 2 (as part of the [Defender for Cloud](https://review.learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-cloud-introduction?branch=main)) offering;

- Microsoft Defender for Endpoint Server
  
# Deploy and configure policies for Defender for Endpoint on Linux 

There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux. Before you begin, make sure [the Minimum requirements for Microsoft Defender for Endpoint](https://review.learn.microsoft.com/en-us/defender-endpoint/mde-linux-requirements?branch=pr-en-us-2468) are met.

- [Installer script based deployment](https://learn.microsoft.com/en-us/defender-endpoint/linux-installer-script)

- [Ansible based deployment](https://learn.microsoft.com/en-us/defender-endpoint/linux-install-with-ansible)

- [Chef based deployment](https://learn.microsoft.com/en-us/defender-endpoint/linux-deploy-defender-for-endpoint-with-chef)

- [Puppet based deployment](https://learn.microsoft.com/en-us/defender-endpoint/linux-install-with-puppet)

- [SaltStack based deployment](https://learn.microsoft.com/en-us/defender-endpoint/linux-install-with-saltack)

- [Manual deployment](https://learn.microsoft.com/en-us/defender-endpoint/linux-install-manually)

- To use Microsoft Defender for Cloud, see [Enable Defender for Endpoint integration](https://learn.microsoft.com/en-us/azure/defender-for-cloud/enable-defender-for-endpoint)

- To install on Arm64-based Linux servers, see [Microsoft Defender for Endpoint on Linux for Arm64-based devices (preview)](https://learn.microsoft.com/en-us/defender-endpoint/mde-linux-arm)

- To install on Linux Server with SAP, see [Deployment guidance for Defender for Endpoint on Linux Server with SAP](https://learn.microsoft.com/en-us/defender-endpoint/mde-linux-deployment-on-sap)

If you experience any installation failures, see [Troubleshooting installation failures in Microsoft Defender for Endpoint on Linux](https://learn.microsoft.com/en-us/defender-endpoint/linux-support-install)

>[!important] Installing Microsoft Defender for Endpoint in any location other than the default install path isn't supported. Microsoft Defender for Endpoint on Linux creates an mdatp user with random UID and GID. If you want to control the UID and GID values, create an mdatp user before installation using the /usr/sbin/nologin shell option. Here's an example:  
mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin.

>To configure Defender for Endpoint on Linux, you can choose from two options to configure policies:

>- [Set up a configuration profile that uses a json file](https://review.learn.microsoft.com/en-us/defender-endpoint/linux-preferences?branch=main&branchFallbackFrom=pr-en-us-2468%22%20%5Cl%20%22configuration-profile)
>- [Use the Microsoft Defender portal (this method is also referred to as Defender for Endpoint security settings management)](https://learn.microsoft.com/en-us/defender-endpoint/mde-security-settings-management)  
>For more information, see [Security policies in Microsoft Defender for Endpoint on Linux](https://review.learn.microsoft.com/en-us/defender-endpoint/linux-preferences?branch=pr-en-us-2468)

# Software updates

Microsoft publishes software updates for Defender for Endpoint on Linux to improve performance, improve security, and deliver new features. Software updates are released on a monthly basis, following testing, and verification. Occasionally, it can take more than 30 days between releases. For more information, see [What’s new in Defender for Endpoint on Linux](https://learn.microsoft.com/en-us/defender-endpoint/linux-whatsnew)

Each version of Defender for Endpoint on Linux is set to expire automatically after nine months. Although expired versions continue to receive security intelligence updates, we recommend using current versions so you get available enhancements and fixes. For more information, see [How to deploy updates for Microsoft Defender for Endpoint on Linux](https://learn.microsoft.com/en-us/defender-endpoint/linux-updates)

# Device health reporting

The Device Health report provides information about the antivirus status of Linux servers, including details such as antivirus mode, scan results, platform version, antivirus engine version, and security intelligence version. You can access this information either through the portal or via API. For more information, see the following articles:

- [Device health reporting in Microsoft Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/device-health-microsoft-defender-antivirus-health)
- [Microsoft Defender Antivirus export device antivirus health details API methods and properties](https://learn.microsoft.com/en-us/defender-endpoint/device-health-microsoft-defender-antivirus-health)

# Response actions and live response 

The security operations team can remotely connect to a device and execute various response actions such as running an antivirus scan, isolating the device, and collecting investigation packages. Additionally, they can use live response for a remote shell connection to perform in-depth investigative work. For more information, see the following articles: 

- [Take response actions on a device](https://review.learn.microsoft.com/en-us/defender-endpoint/respond-machine-alerts?branch=pr-en-us-2468) 
- [Investigate entities on devices using live response](https://review.learn.microsoft.com/en-us/defender-endpoint/live-response?branch=pr-en-us-2468)

# Privacy

  Microsoft is committed to provide you with the information and controls you need to make choices about how your data is collected and used when you're using Defender for Endpoint on Linux. For more information, see [Privacy for Microsoft Defender for Endpoint on Linux](https://review.learn.microsoft.com/en-us/defender-endpoint/linux-privacy?branch=pr-en-us-2468)

# Resources for troubleshooting, diagnostics, and configuration 

If you run into any issues with Defender for Endpoint on Linux, or you just want some tips on configuring capabilities or exclusions, see [Resources](https://learn.microsoft.com/en-us/defender-endpoint/linux-resources)

# Common applications that Defender for Endpoint impacts 

High I/O workloads from certain applications can experience performance issues when Microsoft Defender for Endpoint is installed. Such applications for developer scenarios include Jenkins and Jira, and database workloads like OracleDB and Postgres. If you see performance degradation, consider setting exclusions for trusted applications. See the following articles: 

- [Configure and validate exclusions for Defender for Endpoint on Linux](https://learn.microsoft.com/en-us/defender-endpoint/linux-exclusions)
- [Common Exclusion Mistakes for Microsoft Defender Antivirus](https://learn.microsoft.com/en-us/defender-endpoint/common-exclusion-mistakes-microsoft-defender-antivirus) 
  
If you’re using non-Microsoft applications, also see their documentation regarding antivirus exclusions.

# Next steps 

- [Requirements for Defender for Endpoint on Linux](https://review.learn.microsoft.com/en-us/defender-endpoint/mde-linux-requirements?branch=pr-en-us-2468) 
- [Deploy Defender for Endpoint on Linux](https://review.learn.microsoft.com/en-us/defender-endpoint/mde-linux-deployment?branch=pr-en-us-2468)
- [Configure Defender for Endpoint on Linux](https://review.learn.microsoft.com/en-us/defender-endpoint/linux-preferences?branch=pr-en-us-2468)
- [Deploy updates for Defender for Endpoint on Linux](https://learn.microsoft.com/en-us/defender-endpoint/linux-updates)

 [!Tip]: Do you want to learn more? Engage with the Microsoft Security community in our Tech Community: [Microsoft Defender for Endpoint Tech Community](https://techcommunity.microsoft.com/category/microsoft-defender-for-endpoint/discussions/microsoftdefenderatp)