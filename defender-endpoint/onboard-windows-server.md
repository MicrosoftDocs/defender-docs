---
title: Onboard Windows Server, version 1803, Windows Server 2019, and later to Microsoft Defender for Endpoint
description: Onboard Windows Server, version 1803, Windows Server 2019, and Windows Server 2025 to Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 02/25/2025
---

# Onboard Windows Server, version 1803, Windows Server 2019, and Windows Server 2025 to the Microsoft Defender for Endpoint service

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Defender for Endpoint extends support to include the Windows Server operating system. This support provides advanced attack detection and investigation capabilities seamlessly through the Microsoft Defender XDR console. Support for Windows Server provides deeper insight into server activities, coverage for kernel and memory attack detection, and enables response actions.

> [!NOTE]
> To onboard servers to Defender for Endpoint, [server licenses](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint) are required. You can choose from these options:
> 
> - [Microsoft Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) (as part of the Defender for Cloud) offering
> - Microsoft Defender for Endpoint for servers
> - [Microsoft Defender for Business servers](/defender-business/get-defender-business#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)
> 

This article describes how to onboard Windows Server, version 1803, Windows Server 2109, and Windows Server 2025 to Defender for Endpoint.

For guidance on how to onboard Windows Server 2012 R2 and Windows Server 2016, see [Onboard Windows Server 2012 R2 and Windows Server 2016 to Microsoft Defender for Endpoint](onboard-windows-server-2012r2-2016.md).

For guidance on how to download and use Windows Security Baselines for Windows servers, see [Windows Security Baselines.](/windows/security/threat-protection/windows-security-configuration-framework/windows-security-baselines)

> [!TIP]
> As a companion to this article, see our [Security Analyzer setup guide](https://go.microsoft.com/fwlink/p/?linkid=2268522) to review best practices and learn to fortify defenses, improve compliance, and navigate the cybersecurity landscape with confidence. For a customized experience based on your environment, you can access the [Security Analyzer automated setup guide](https://go.microsoft.com/fwlink/p/?linkid=2268615) in the Microsoft 365 admin center.
> 
## Windows Server onboarding overview

You need to complete the general steps depicted in the following image to successfully onboard Windows servers. 

:::image type="content" source="media/server-onboarding-diagram-2025.png" alt-text="Server Onboarding" lightbox="media/server-onboarding-diagram-2025.png":::

For Windows Server 2012 R2 and Windows Server 2016, see [Onboard Windows servers to the Microsoft Defender for Endpoint service](onboard-windows-server-2012r2-2016.md).

> [!NOTE]
> Windows Hyper-V server editions aren't supported.

## Integration with Microsoft Defender for Servers

Microsoft Defender for Endpoint integrates seamlessly with Microsoft Defender for Servers and Microsoft Defender for Cloud. If your subscription includes Defender for Servers Plan 1 or Plan 2, you can:
- Onboard servers automatically
- Have servers that are monitored by Defender for Cloud appear in Defender for Endpoint
- Conduct detailed investigations as a Defender for Cloud customer

For more information, see [Protect your endpoints with Defender for Endpoint integration with Defender for Cloud](/azure/defender-for-cloud/integration-defender-for-endpoint). 

> [!NOTE]
> - When you use Defender for Cloud to monitor servers, a Defender for Endpoint tenant is created automatically. Data collected by Defender for Endpoint is stored in the geographical location of the tenant, identified during provisioning. (For example, in the US for customers in the USA; in EU for European customers; and in the UK for customers in the United Kingdom.)
> - If you use Defender for Endpoint before using Defender for Cloud, your data is stored in the location you specified when you created your tenant, even if you integrate with Defender for Cloud at a later time.
> - Once configured, you can't change the location of where your data is stored. To move your data to another location, [contact support](contact-support.md) to reset your tenant.
> - Server endpoint monitoring utilizing this integration has been disabled for Office 365 GCC customers.
> - Previously, the use of the Microsoft Monitoring Agent (MMA) on Windows Server 2016, Windows Server 2012 R2, and previous versions of Windows Server allowed for the OMS / Log Analytics gateway to provide connectivity to Microsoft Defender cloud services. The new solution, such as Defender for Endpoint on Windows Server 2019 (and later) and Windows 10 (and later) doesn't support this gateway.
> - Linux servers onboarded through Defender for Cloud have their initial configuration set to run Microsoft Defender Antivirus in [passive mode](/defender-endpoint/microsoft-defender-antivirus-compatibility#microsoft-defender-antivirus-and-non-microsoft-antivirusantimalware-solutions). For information on how to deploy Defender for Endpoint on Linux server, start with the [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md). 
> - For Windows Server 2012 R6 and Windows Server 2016, you can either manually install/upgrade the modern, unified solution on these servers, or use the integration to automatically deploy or upgrade servers covered by your respective Defender for Server plans. For more inforamtion, see [Protect your endpoints with Defender for Endpoint integration with Defender for Cloud](/azure/defender-for-cloud/integration-defender-for-endpoint). 
> - To onboard Windows Server 2012 R2 and Windows Server 2016, see [Onboard Windows Server 2012 R2 and Windows Server 2016 to Microsoft Defender for Endpoint](onboard-windows-server-2012r2-2016.md). 

### Windows Server 2012 R2 and Windows Server 2016

- Download installation and onboarding packages.
- Apply the installation package.
- Follow the onboarding steps for the corresponding tool.

### Windows Server Semi-Annual Enterprise Channel and Windows Server 2019

- Download the onboarding package.
- Follow the onboarding steps for the corresponding tool.

## Offboard Windows servers

You can offboard Windows Server 2012 R2, Windows Server 2016, Windows Server (SAC), Windows Server 2019, Windows Server 2019 Core edition, Windows Server 2022, and Windows Server 2025 with the same method available for Windows 10 client devices.

- [Offboard devices using Configuration Manager](configure-endpoints-sccm.md#offboard-devices-using-configuration-manager)
- [Offboard devices using Mobile Device Management tools](configure-endpoints-mdm.md#offboard-devices-using-mobile-device-management-tools)
- [Offboard devices using Group Policy](configure-endpoints-gp.md#offboard-devices-using-group-policy)
- [Offboard devices using a local script](configure-endpoints-script.md#offboard-devices-using-a-local-script)

After offboarding, you can proceed to uninstall the unified solution package on Windows Server 2012 R2 and Windows Server 2016.

For other Windows server versions, you have two options to offboard Windows servers from the service:

- Uninstall the MMA agent
- Remove the Defender for Endpoint workspace configuration

> [!NOTE]
> The offboarding instructions in this article apply to previous versions of Windows Server, such as Windows Server 2016 and Windows Server 2012 R2 using the MMA. To migrate to the new, unified solution, see [Server migration scenarios in Microsoft Defender for Endpoint](server-migration.md).

## Related articles

- [Onboard Windows devices using Microsoft Endpoint Configuration Manager](configure-endpoints-sccm.md)
- [Onboard Windows devices using Group Policy](configure-endpoints-gp.md)
- [Onboard non-persistent virtual desktop infrastructure (VDI) devices](configure-endpoints-vdi.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
