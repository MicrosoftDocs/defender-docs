---
title: Onboard Windows or Linux server devices to Microsoft Defender for Endpoint
description: Learn how to onboard servers running Windows Server or Linux Server to Microsoft Defender for Endpoint.
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
ms.date: 12/13/2024
---

# Onboard servers to Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

You can choose from several options to onboard a server to Microsoft Defender for Endpoint. Make sure to review the [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md). 

To onboard servers to Defender for Endpoint, [server licenses](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint) are required. You can choose from these options:

- Microsoft Defender for Servers Plan 1 or Plan 2 (as part of the [Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction)) offering; or
- Microsoft Defender for Endpoint Server

The following table lists deployment methods for onboarding servers:

|Operating system|Deployment method|
|---|---|
| Windows Server 2022 <br/>Windows Server 2019<br/>Windows Server, version 1803 | [Local script](configure-endpoints-script.md) (uses an onboarding package)<br/>[Defender for Cloud](/azure/defender-for-cloud/plan-defender-for-servers), which [integrates with Defender for Endpoint](azure-server-integration.md)<br/> [Microsoft Configuration Manager](/mem/configmgr/protect/deploy-use/defender-advanced-threat-protection) <br/> [Group Policy](configure-endpoints-gp.md) <br/>[VDI scripts](configure-endpoints-vdi.md) |
| Windows Server 2016 <br/>Windows Server 2012 R2 | [Modern unified solution in Defender for Endpoint](/defender-endpoint/configure-server-endpoints#windows-server-2016-and-windows-server-2012-r2) |
|Linux Server <br/>(see [System requirements](microsoft-defender-endpoint-linux.md#system-requirements)) |[Local script](linux-install-manually.md) (manual deployment) <br/> [Puppet](linux-install-with-puppet.md) <br/> [Ansible](linux-install-with-ansible.md) <br/> [Chef](linux-deploy-defender-for-endpoint-with-chef.md)<br/> [Saltstack](linux-install-with-saltack.md)<br/>[Defender for Endpoint on Linux for ARM64-based devices (preview)](mde-linux-arm.md)<br/>[Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md) <br/>[Advanced deployment guidance for Microsoft Defender for Endpoint on Linux](comprehensive-guidance-on-linux-deployment.md)|

## See also

- [Microsoft Defender for Endpoint - Mobile Threat Defense](mtd.md) (for iOS and Android devices)
- [Onboard Windows and Mac client devices to Microsoft Defender for Endpoint](onboard-client.md)