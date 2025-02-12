---
title: Identify Defender for Endpoint architecture and deployment method
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
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 12/12/2024
---

# Identify Defender for Endpoint architecture and deployment method

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

If you're already completed the steps to set up your Microsoft Defender for Endpoint deployment, and you have assigned roles and permissions for Defender for Endpoint, your next step is to create a plan for onboarding. Your plan begins with identifying your architecture and choosing your deployment method.

We understand that every enterprise environment is unique, so we've provided several options to give you the flexibility in choosing how to deploy the service. Deciding how to onboard endpoints to the Defender for Endpoint service comes down to two important steps:

:::image type="content" source="/defender/media/defender-endpoint/onboarding-architecture-2.png" alt-text="The deployment flow":::

## Step 1: Identify your architecture

Depending on your environment, some tools are better suited for certain architectures. Use the following table to decide which Defender for Endpoint architecture best suits your organization.

|Architecture |Description |
|---|---|
|**Cloud-native**| We recommend using Microsoft Intune to onboard, configure, and remediate endpoints from the cloud for enterprises who don't have an on-premises configuration management solution or are looking to reduce their on-premises infrastructure. |
|**Co-management**| For organizations who host both on-premises and cloud-based workloads we recommend using Microsoft's ConfigMgr and Intune for their management needs. These tools provide a comprehensive suite of cloud-powered management features, and unique co-management options to provision, deploy, manage, and secure endpoints and applications across an organization. |
|**On-premises**|For enterprises who want to take advantage of the cloud-based capabilities of Microsoft Defender for Endpoint while also maximizing their investments in Configuration Manager or Active Directory Domain Services, we recommend this architecture.|
|**Evaluation and local onboarding**|We recommend this architecture for SOCs (Security Operations Centers) who are looking to evaluate or run a Microsoft Defender for Endpoint pilot, but don't have existing management or deployment tools. This architecture can also be used to onboard devices in small environments without management infrastructure, such as a DMZ (Demilitarized Zone).|

## Step 2: Select deployment method

Once you have determined the architecture of your environment and have created an inventory as outlined in the [requirements section](mde-planning-guide.md#requirements), use the table below to select the appropriate deployment tools for the endpoints in your environment. This will help you plan the deployment effectively.

|Endpoint|Deployment tool|
|---|---|
|**Windows**|[Local script (up to 10 devices)](configure-endpoints-script.md) <br/>  [Group Policy](configure-endpoints-gp.md) <br/>  [Microsoft Intune/ Mobile Device Manager](configure-endpoints-mdm.md) <br/>   [Microsoft Configuration Manager](configure-endpoints-sccm.md) <br/> [VDI scripts](configure-endpoints-vdi.md)|
|**Windows servers<br/>Linux servers** <br/>(Requires a server license) | [Onboard Windows devices using a local script](configure-endpoints-script.md)<br/>[Integration with Microsoft Defender for Cloud](azure-server-integration.md) |
|**macOS**|[Local script](mac-install-manually.md) <br/> [Microsoft Intune](mac-install-with-intune.md) <br/> [JAMF Pro](mac-install-with-jamf.md) <br/> [Mobile Device Management](mac-install-with-other-mdm.md)|
|**Linux servers**|[Local script](linux-install-manually.md) <br/> [Puppet](linux-install-with-puppet.md) <br/> [Ansible](linux-install-with-ansible.md) <br/> [Chef](linux-deploy-defender-for-endpoint-with-chef.md)<br/> [Saltstack](linux-install-with-saltack.md)<br/>[Defender for Endpoint on Linux for ARM64-based devices (preview)](mde-linux-arm.md)|
|**Android**|[Microsoft Intune](android-intune.md)|
|**iOS**|[Microsoft Intune](ios-install.md) <br/> [Mobile Application Manager](ios-install-unmanaged.md) |

> [!NOTE]
> For devices that aren't managed by Microsoft Intune or Microsoft Configuration Manager, you can use the Security Management for Microsoft Defender for Endpoint to receive security configurations for Microsoft Defender directly from Intune.

## Next step

After choosing your Defender for Endpoint architecture and deployment method continue to [Step 4 - Onboard devices](onboarding.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
