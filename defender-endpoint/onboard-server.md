---
title: Onboard servers through Microsoft Defender for Endpoint's onboarding experience
description: Learn how to onboard servers running Windows Server or Linux to Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
ms.reviewer: pahuijbr
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 04/02/2025
---

# Onboard servers through Microsoft Defender for Endpoint's onboarding experience

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

## Overview

[Defender for Endpoint](microsoft-defender-endpoint.md) can help protect your organization's servers with capabilities that include posture management, threat protection, and endpoint detection and response. Defender for Endpoint provides your security team with deeper insight into server activities, coverage for kernel and memory attack detection, and the ability to take response actions when necessary. Defender for Endpoint also integrates with Microsoft Defender for Cloud, providing your organization with a comprehensive server protection solution. 

Depending on your particular environment, you can choose from several options to onboard servers to Defender for Endpoint. This article describes available options and includes links to additional resources.

## Server plans

To onboard servers to Defender for Endpoint, [server licenses](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint) are required. You can choose from these options:

- [Microsoft Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) (as part of the Defender for Cloud) offering
- Microsoft Defender for Endpoint for servers
- [Microsoft Defender for Business servers](/defender-business/get-defender-business#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)

## Server onboarding options

The following table summarizes various deployment methods for onboarding servers:

|Operating system| Deployment method |
|---|---|
| Windows Server 2025 <br/>Windows Server 2022 <br/>Windows Server 2019<br/>Windows Server, version 1803 | [Local script](configure-endpoints-script.md) (uses an onboarding package)<br/>[Defender for Servers](/azure/defender-for-cloud/tutorial-enable-servers-plan)<br/> [Microsoft Configuration Manager](/mem/configmgr/protect/deploy-use/defender-advanced-threat-protection) <br/> [Group Policy](configure-endpoints-gp.md) <br/>[VDI scripts](configure-endpoints-vdi.md) <br/>[Onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)|
| Windows Server 2016 <br/>Windows Server 2012 R2 | [Onboard Windows Server 2012 R2 and Windows Server 2016 using the modern, unified solution](onboard-windows-server-2012r2-2016.md) |
|Linux |[Installer script based deployment](/defender-endpoint/linux-installer-script) <br/>[Ansible](linux-install-with-ansible.md) <br/>[Chef](linux-deploy-defender-for-endpoint-with-chef.md)<br/>[Puppet](linux-install-with-puppet.md) <br/>[Saltstack](linux-install-with-saltack.md)<br/> [Manual deployment](linux-install-manually.md) (uses a local script) <br/>[Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)<br/>[Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/quickstart-onboard-machines)<br/>[Defender for Endpoint on Linux for ARM64-based devices (preview)](mde-linux-arm.md)<br/>[Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md) |

## 

## See also

- [Microsoft Defender for Endpoint - Mobile Threat Defense](mtd.md) (for iOS and Android devices)
- [Onboard Windows and Mac client devices to Microsoft Defender for Endpoint](onboard-client.md)