---
title: Identify your architecture and select a deployment method for Defender for Endpoint
description: Select the best Microsoft Defender for Endpoint deployment strategy for your environment.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
ms.topic: install-set-up-deploy
ms.subservice: onboard
search.appverid: met150
ms.date: 04/17/2025
---

# Identify your architecture and select a deployment method for Defender for Endpoint

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

If you're already completed the steps to [prepare your environment for Defender for Endpoint](production-deployment.md), and you have [assigned roles and permissions for Defender for Endpoint](prepare-deployment.md), your next step is to create a plan for onboarding. This plan should begin with identifying your architecture and choosing your deployment method.

We understand that every enterprise environment is unique, so we've provided several options to give you the flexibility in choosing how to deploy the service. Deciding how to onboard endpoints to the Defender for Endpoint service comes down to two important steps:

:::image type="content" source="/defender/media/defender-endpoint/onboarding-architecture-2.png" alt-text="The deployment flow":::

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

## Step 1: Identify your architecture

Depending on your environment, some tools are better suited for certain architectures. Use the following table to decide which Defender for Endpoint architecture best suits your organization.

|Architecture |Description |
|---|---|
|**Cloud-native**| We recommend using Microsoft Intune to onboard, configure, and remediate endpoints from the cloud for enterprises who don't have an on-premises configuration management solution or are looking to reduce their on-premises infrastructure. |
|**Co-management**| For organizations who host both on-premises and cloud-based workloads we recommend using Microsoft's ConfigMgr and Intune for their management needs. These tools provide a comprehensive suite of cloud-powered management features, and unique co-management options to provision, deploy, manage, and secure endpoints and applications across an organization. |
|**On-premises**|For enterprises who want to take advantage of the cloud-based capabilities of Microsoft Defender for Endpoint while also maximizing their investments in Configuration Manager or Active Directory Domain Services, we recommend this architecture.|
|**Evaluation and local onboarding**|We recommend this architecture for SOCs (Security Operations Centers) who are looking to evaluate or run a Microsoft Defender for Endpoint pilot, but don't have existing management or deployment tools. This architecture can also be used to onboard devices in small environments without management infrastructure, such as a DMZ (Demilitarized Zone).|

## Step 2: Select your deployment method

Once you have determined the architecture of your environment and have created an inventory as outlined in the [requirements section](mde-planning-guide.md#requirements), use the table below to select the appropriate deployment tools for the endpoints in your environment. This information will help you plan the deployment effectively.

|Endpoint|Deployment tool|
|---|---|
| **Windows client devices** |[Microsoft Intune / Mobile Device Management (MDM)](configure-endpoints-mdm.md) <br/>[Microsoft Configuration Manager](configure-endpoints-sccm.md)<br/>[Local script (up to 10 devices)](configure-endpoints-script.md)<br/>[Group Policy](configure-endpoints-gp.md)<br/>[Non-persistent virtual desktop infrastructure (VDI) devices](configure-endpoints-vdi.md)<br/>[Azure Virtual Desktop](onboard-windows-multi-session-device.md)<br/>[System Center Endpoint Protection and Microsoft Monitoring Agent](onboard-downlevel.md) (for previous versions of Windows) |
|**Windows Server** <br/>(Requires a server plan) | [Local script](configure-endpoints-script.md)<br/>[Integration with Microsoft Defender for Cloud](azure-server-integration.md)<br/>[Guidance for Windows Server with SAP](mde-sap-windows-server.md) |
|**macOS**| [Intune](mac-install-with-intune.md)<br/>[JAMF Pro](mac-install-with-jamf.md) <br/>[Local script](mac-install-manually.md)(manual deployment) <br/>[MDM tools](mac-install-with-other-mdm.md)|
|**Linux server**<br/>(Requires a server plan)|[Installer script based deployment](linux-installer-script.md)<br/>[Ansible](linux-install-with-ansible.md)<br/>[Chef](linux-deploy-defender-for-endpoint-with-chef.md)<br/>[Puppet](linux-install-with-puppet.md) <br/>[Saltstack](linux-install-with-saltack.md)<br/>[Manual deployment](linux-install-manually.md)<br/>[Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)<br/>[Guidance for Linux with SAP](mde-linux-deployment-on-sap.md)|
|**Android**|[Microsoft Intune](android-intune.md)|
|**iOS**|[Microsoft Intune](ios-install.md) <br/> [Mobile Application Manager](ios-install-unmanaged.md) |

> [!NOTE]
> For devices that aren't managed by Intune or Configuration Manager, you can use the Defender for Endpoint Security Settings Management to receive security configurations directly from Intune.
> To onboard servers to Defender for Endpoint, [server licenses](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint) are required. You can choose from these options:
>
> - [Microsoft Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) (as part of the Defender for Cloud) offering
> - Microsoft Defender for Endpoint for servers
> - [Microsoft Defender for Business servers](/defender-business/get-defender-business#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)


## Next step

After choosing your Defender for Endpoint architecture and deployment method continue to [Step 4 - Onboard devices](onboarding.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
