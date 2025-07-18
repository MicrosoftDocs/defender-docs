---
title: Microsoft Defender for Identity sensor v3.x prerequisites | Microsoft Defender for Identity
description: This article describes the prerequisites for installing the Microsoft Defender for Identity sensor version 3.x.
ms.date: 06/30/2025
ms.topic: install-set-up-deploy
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity sensor v3.x prerequisites (Preview)

This article describes the requirements for installing the Microsoft Defender for Identity sensor v3.x.

## Sensor version limitations 

Before activating the Defender for Identity sensor v3.x, note that this version of the sensor is still in preview and has some limited functionality compared to version 2.x. Keep these limitations in mind before activating the sensor.
The Defender for Identity sensor v3.x:
 - Requires that Defender for Endpoint is deployed
 - Doesn't currently support VPN integration
 - Doesn't currently support ExpressRoute
 - Doesn't currently offer full functionality of health alerts, posture recommendations, security alerts or advanced hunting data.

## Licensing requirements

Deploying Defender for Identity requires one of the following Microsoft 365 licenses:

[!INCLUDE [licenses](../includes/licenses.md)]

For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).

## Roles and permissions

- To create your Defender for Identity workspace, you need a Microsoft Entra ID tenant.
- You must either be a [Security Administrator](/entra/identity/role-based-access-control/permissions-reference), or have the following [Unified RBAC](../role-groups.md#unified-role-based-access-control-rbac) permissions:
    - `System settings (Read and manage)`
    - `Security setting (All permissions)`
- We recommend using at least one Directory Service account, with read access to all objects in the monitored domains. For more information, see [Configure a Directory Service account for Microsoft Defender for Identity](directory-service-accounts.md).

## Sensor requirements and recommendations

The following table summarizes the server requirements and recommendations for the Defender for Identity sensor.

|Prerequisite / Recommendation |Description  |
|---------|---------|
|Operating System|The domain controller must have both:<br> - Windows Server 2019 or later<br> - [March 2024 Cumulative Update](https://support.microsoft.com/topic/march-12-2024-kb5035857-os-build-20348-2340-a7953024-bae2-4b1a-8fc1-74a17c68203c) or later.|
|Specifications|  A domain controller server with a minimum of:<br> - two cores<br>- 6 GB of RAM|
|Performance| For optimal performance, set the **Power Option** of the machine running the Defender for Identity sensor to **High Performance**.        |
|Connectivity|Requires a Microsoft Defender for Endpoint deployment. If Microsoft Defender for Endpoint is installed on the domain controller, there are no additional connectivity requirements.   |
|Previous installations| Before activating the sensor on a domain controller, make sure that the domain controller doesn't have another Defender for Identity sensor already deployed.|
|Server time synchronization|The servers and domain controllers onto which the sensor is installed must have time synchronized to within five minutes of each other.|
|ExpressRoute|This version of the sensor doesn't support ExpressRoute. If your environment uses ExpressRoute,  we recommend [deploying the Defender for Identity sensor v2.x](install-sensor.md).|

> [!NOTE]
> After the March 2024 Cumulative Update is installed, LSASS might experience a memory leak on domain controllers during on-premises and cloud-based Active Directory Domain Controllers service Kerberos authentication requests. [This out-of-band update: KB5037422](https://support.microsoft.com/en-gb/topic/march-22-2024-kb5037422-os-build-20348-2342-out-of-band-e8f5bf56-c7cb-4051-bd5c-cc35963b18f3) addresses this issue.

### Dynamic memory requirements

The following table describes memory requirements on the server used for the Defender for Identity sensor, depending on the type of virtualization you're using:

|VM running on|Description|
|------------|-------------|
|Hyper-V|Ensure that **Enable Dynamic Memory** isn't enabled for the VM.|
|VMware|Ensure that the amount of memory configured and the reserved memory are the same, or select the **Reserve all guest memory (All locked)** option in the VM settings.|
|Other virtualization host|Refer to the vendor supplied documentation on how to ensure that memory is fully allocated to the VM at all times. |

> [!IMPORTANT]
> When running as a virtual machine, all memory must be allocated to the virtual machine at all times.

## Configure Windows auditing

Defender for Identity detections rely on specific Windows Event Log entries to enhance detections and provide extra information about the users performing specific actions, such as NTLM sign-ins and security group modifications.

Configure Windows event collection on your domain controller to support Defender for Identity detections. For more information, see [Event collection with Microsoft Defender for Identity](event-collection-overview.md) and [Configure audit policies for Windows event logs](configure-windows-event-collection.md).

You might want to use the Defender for Identity PowerShell module to configure the required settings. For example, the following command defines all settings for the domain, creates group policy objects, and links them.

```powershell
Set-MDIConfiguration -Mode Domain -Configuration All
```
For more information, see:
- [DefenderForIdentity Module](/powershell/module/defenderforidentity/)
- [Defender for Identity in the PowerShell Gallery](https://www.powershellgallery.com/packages/DefenderForIdentity/)
 

## Test your prerequisites

We recommend running the [*Test-MdiReadiness.ps1*](https://github.com/microsoft/Microsoft-Defender-for-Identity/tree/main/Test-MdiReadiness) script to test and see if your environment has the necessary prerequisites.

The *Test-MdiReadiness.ps1* script is also available from Microsoft Defender XDR, on the **Identities > Tools** page (Preview).

## Next step
[Plan capacity for Microsoft Defender for Identity](capacity-planning.md)
