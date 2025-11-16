---
title: Microsoft Defender for Identity sensor v3.x prerequisites | Microsoft Defender for Identity
description: This article describes the prerequisites for installing the Microsoft Defender for Identity sensor version 3.x.
ms.date: 10/24/2025
ms.topic: install-set-up-deploy
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity sensor v3.x prerequisites

This article describes the requirements for installing the Microsoft Defender for Identity sensor v3.x.

## Sensor version limitations 

Before activating the Defender for Identity sensor v3.x, keep these limitations in mind before activating the sensor.
The Defender for Identity sensor v3.x:
- Requires that Defender for Endpoint is deployed and that the Microsoft Defender Antivirus component is running in either active mode or passive mode.
 - Can't be activated on a server that has a Defender for Identity sensor V2.x already deployed.
 - Doesn't currently support VPN integration.
 - Doesn't currently support ExpressRoute.

## Licensing requirements

Deploying Defender for Identity requires one of the following Microsoft 365 licenses:

[!INCLUDE [licenses](../includes/licenses.md)]

For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).

## Roles and permissions

- To create your Defender for Identity workspace, you need a Microsoft Entra ID tenant.
- You must either be a [Security Administrator](/entra/identity/role-based-access-control/permissions-reference), or have the following [Unified RBAC](../role-groups.md#unified-role-based-access-control-rbac) permissions:
    - `System settings (Read and manage)`
    - `Security settings (All permissions)`

## Sensor requirements and recommendations 

The following table summarizes the server requirements and recommendations for the Defender for Identity sensor.

|Prerequisite / Recommendation |Description  |
|---------|---------|
|Operating System|The domain controller must have both:<br> - Windows Server 2019 or later<br> - [October 2025 Cumulative Update](https://support.microsoft.com/en-us/topic/october-14-2025-kb5066782-os-build-20348-4294-f4af3c9e-7a60-4d17-a964-cfe1f1dd15f6) or later.|
|Previous installations| Before activating the sensor on a domain controller, make sure that the domain controller doesn't have Defender for Identity sensor V2.x already deployed.|
|Specifications|  A domain controller server with a minimum of:<br> - two cores<br>- 6 GB of RAM|
|Performance| For optimal performance, set the **Power Option** of the machine running the Defender for Identity sensor to **High Performance**.        |
|Connectivity|Requires a Microsoft Defender for Endpoint deployment. If Microsoft Defender for Endpoint is installed on the domain controller, there are no additional connectivity requirements.   |
|Server time synchronization|The servers and domain controllers onto which the sensor is installed must have time synchronized to within five minutes of each other.|
|ExpressRoute|This version of the sensor doesn't support ExpressRoute. If your environment uses ExpressRoute,  we recommend [deploying the Defender for Identity sensor v2.x](install-sensor.md).|
|Identity and response actions|The sensor doesn't require credentials to be provided in the portal. Even if credentials are entered, the sensor uses the **Local System identity** on the server to query Active Directory and perform response actions. If a **Group Managed Service Account (gMSA)** is configured for response actions, the response actions are disabled. |

### Dynamic memory requirements

The following table describes memory requirements on the server used for the Defender for Identity sensor, depending on the type of virtualization you're using:

|VM running on|Description|
|------------|-------------|
|Hyper-V|Ensure that **Enable Dynamic Memory** isn't enabled for the VM.|
|VMware|Ensure that the amount of memory configured and the reserved memory are the same, or select the **Reserve all guest memory (All locked)** option in the VM settings.|
|Other virtualization host|Refer to the vendor supplied documentation on how to ensure that memory is fully allocated to the VM at all times. |

> [!IMPORTANT]
> When running as a virtual machine, all memory must be allocated to the virtual machine at all times.

## Configure RPC on V3.x sensors to support advanced identity detections

Applying the **Unified Sensor RPC Audit** tag enables a new, tested capability on the machine, improving security visibility and unlocking additional identity detections. Once applied, the configuration is enforced on **existing and future devices** that match the rule criteria. The tag itself is visible in the Device Inventory, providing admins with transparency and auditing capabilities.

**Steps to apply the configuration:**

1. In the **Microsoft Defender portal**, navigate to: **System > Settings > Microsoft Defender XDR > Asset Rule Management**.
1. Select **Create a new rule**.

    ![Screenshot that shows how to add a new rule.](media/prerequisites-sensor-version-3/new-rule.png)

1. In the side panel:

   1. Enter a **Rule name** and **Description**.
   
   1. Set **rule conditions** using `Device name`, `Domain`, or `Device tag` to target the desired machines.
   
   1. Ensure that the **Defender for Identity V3.x sensor** is already deployed on the selected devices.
    
   1. Matching should primarily target **domain controllers** with the V3.x sensor installed.
    
1. **Add the tag** `Unified Sensor RPC Audit` to the selected devices.    

    ![Screenshot that shows the config tag.](media/prerequisites-sensor-version-3/tag.png)

1. Select **Next** to review and finish creating the rule and then select **Submit**.

### Updating rules
   Offboarding a device from this configuration can be done **only** from **deleting the asset rule** or **modifying the rule conditions** so the device no longer matches.

> [!NOTE]
> It may take up to 1 hour for changes to be reflected in the portal.

Learn more about Asset Management Rule [here](/defender-xdr/configure-asset-rules).

## Configure Windows auditing

Defender for Identity detections rely on specific Windows Event Log entries to enhance detections and provide extra information about the users performing specific actions, such as NTLM sign-ins and security group modifications.

Defender for Identity detections rely on specific Windows event log entries to enhance detections and provide extra information about the users performing specific actions, such as NTLM sign-ins and security group modifications.

To turn on automatic windows auditing:
1. Sign in the Defender portal. 
1. To to **Settings**, and then **Identities**. 
1. In the **General** section, select **Advanced features**.
1. Turn on **Automatic Windows auditing configuration**.

If you do not select automatic Windows auditing configuration, you must manually configure Windows event collection on your domain controller to support Defender for Identity detections. For more information, see [Configure audit policies for Windows event logs](configure-windows-event-collection.md).
 

## Test your prerequisites

We recommend running the [*Test-MdiReadiness.ps1*](https://github.com/microsoft/Microsoft-Defender-for-Identity/tree/main/Test-MdiReadiness) script to test and see if your environment has the necessary prerequisites.

The *Test-MdiReadiness.ps1* script is also available from Microsoft Defender XDR, on the **Identities > Tools** page (Preview).

## Next step
[Plan capacity for Microsoft Defender for Identity](capacity-planning.md)
