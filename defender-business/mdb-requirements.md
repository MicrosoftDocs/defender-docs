---
title: Requirements for Microsoft Defender for Business
description: Microsoft Defender for Business license, hardware, and software requirements
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: bagol
audience: Admin
ms.topic: overview
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 09/11/2025
ms.reviewer: nehabha
f1.keywords: NOCSH
ms.collection:
 - SMB
 - m365-security
 - m365solution-mdb-setup
 - highpri
 - tier1
---

# Microsoft Defender for Business requirements

This article describes the requirements for Defender for Business.

## What to do

1. [Review the requirements and make sure you meet them](#review-the-requirements).
2. [Proceed to your next steps](#next-steps).

## Review the requirements

The following table lists the basic requirements you need to configure and use Defender for Business.

|Requirement|Description|
|---|---|
|Subscription|Microsoft 365 Business Premium or Defender for Business (standalone). <br/> For more information, see [How to get Defender for Business](get-defender-business.md).|
|Datacenter|One of the following datacenter locations: <ul><li>European Union</li><li>United Kingdom</li><li>United States</li><li>Australia</li></ul>|
|User accounts|<ul><li>User accounts are created in the Microsoft 365 admin center ([https://admin.microsoft.com](https://admin.microsoft.com)).</li><li>Licenses for Defender for Business (or Microsoft 365 Business Premium) are assigned in the Microsoft 365 admin center.</li></ul> <br/> To get help with this task, see [Add users and assign licenses](mdb-add-users.md).|
|Permissions|To use the Microsoft Defender portal to view or manage devices and security policies, users must have an appropriate [role assigned in Microsoft Entra ID](mdb-roles-permissions.md): <ul><li>Security Reader <br/>- Security Administrator </li></ul> <br/> To learn more, see [Roles and permissions in Defender for Business](mdb-roles-permissions.md).|
|Browser|Microsoft Edge or Google Chrome|
|Client computer operating system|To manage devices in the Microsoft Defender portal, your devices must be running one of the following operating systems: <ul><li>Windows 10 or 11 Business</li><li>Windows 10 or 11 Professional</li><li>Windows 10 or 11 Enterprise</li><li>Mac (the three most-current releases are supported) </li></ul> <br/> Make sure that [KB5006738](https://support.microsoft.com/topic/october-26-2021-kb5006738-os-builds-19041-1320-19042-1320-and-19043-1320-preview-ccbce6bf-ae00-4e66-9789-ce8e7ea35541) is installed on the Windows devices.|
|Mobile devices|To onboard mobile devices, such as iOS or Android OS, you can use [Mobile threat defense capabilities](mdb-mtd.md) or Microsoft Intune. <br/><br/> For more information about onboarding devices, including requirements for mobile threat defense, see [Onboard devices to Microsoft Defender for Business](mdb-onboard-devices.md).|
|Server license|To onboard a device running Windows Server or Linux Server, you need another license, such as [Microsoft Defender for Business servers](get-defender-business.md#how-to-get-microsoft-defender-for-business-servers) (see note 1 below).|
|Server requirements|Windows Server endpoints must meet the [requirements for Defender for Endpoint](/defender-endpoint/minimum-requirements#hardware-and-software-requirements), and enforcement scope must be turned on. <ol><li>In the Microsoft Defender portal, go to **Settings** \> **Endpoints** \> **Configuration management** \> **Enforcement scope**.</li><li>Select **Use MDE to enforce security configuration settings from MEM**, select  **Windows Server**.</li><li>Select **Save**. </li></ol> <br/> Linux Server endpoints must meet the [prerequisites for Microsoft Defender for Endpoint on Linux](/defender-endpoint/microsoft-defender-endpoint-linux#prerequisites).|

> [!NOTE]
>
> 1. To onboard servers, we recommend using [Microsoft Defender for Business servers](get-defender-business.md#how-to-get-microsoft-defender-for-business-servers). Alternately, you could use [Microsoft Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/plan-defender-for-servers). For more information, see [Onboard devices to Microsoft Defender for Business](mdb-onboard-devices.md).
>
> 2. [Microsoft Entra ID](/entra/fundamentals/what-is-entra) is used to manage user permissions and device groups. Microsoft Entra ID is included in your Defender for Business subscription.
>    - If you don't have a Microsoft 365 subscription before you start your trial, Microsoft Entra ID is provisioned for you during the activation process.
>    - If you do have another Microsoft 365 subscription when you start your Defender for Business trial, you can use your existing Microsoft Entra service.
>
> 3. Security defaults are included in Defender for Business. If you prefer to use Conditional Access policies instead, you need Microsoft Entra ID P1 or P2 (P1 is included in [Microsoft 365 Business Premium](/microsoft-365/business-premium/m365bp-overview)). For more information, see [Multifactor authentication in Microsoft 365](/microsoft-365/admin/security-and-compliance/multi-factor-authentication-microsoft-365).

## Next steps

- If you don't already have Defender for Business, see [Get and provision Microsoft Defender for Business](get-defender-business.md).
- If you're starting a trial subscription, see the [Trial user guide: Microsoft Defender for Business](trial-playbook-defender-business.md).
- If you're ready to set up Defender for Business for your organization, see [Set up and configure Microsoft Defender for Business](mdb-setup-configuration.md).
