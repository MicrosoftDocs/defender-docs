---
title: Microsoft Defender for Identity sensor v3.x prerequisites | Microsoft Defender for Identity
description: This article describes the prerequisites for installing the Microsoft Defender for Identity sensor version 3.x.
ms.date: 10/24/2025
ms.topic: install-set-up-deploy
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity sensor v3.x prerequisites

This article describes the requirements for installing the Microsoft Defender for Identity sensor v3.x.

## Before you begin

Before activating the Defender for Identity sensor v3.x, keep in mind that the server on which you are activating the sensor:

- Must have Defender for Endpoint deployed
- Must have a Microsoft Defender Antivirus component running in either active or passive mode.
- Can't have a Defender for Identity sensor V2.x already deployed.

## Sensor version limitations

Before activating the Defender for Identity sensor v3.x, keep in mind that v3.x:

- Doesn't currently support VPN integration.
- Doesn't currently support ExpressRoute.

## Licensing requirements

Deploying Defender for Identity requires one of the following Microsoft 365 licenses:

Enterprise Mobility + Security E5 (EMS E5/A5)
Microsoft 365 E5 (Microsoft E5/A5/G5)
Microsoft 365 E5/A5/G5/F5* Security
Microsoft 365 F5 Security + Compliance*

- Both F5 licenses require Microsoft 365 F1/F3 or Office 365 F3 and Enterprise Mobility + Security E3.

You can purchase licenses in the Microsoft 365 portal, or with Cloud Solution Partner (CSP) licensing. For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).

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
|Identity and response actions| - The sensor uses the Local System identity on the server to query Active Directory and perform response actions. The local system identity is used even if if credentials are entered in the portal. If a **Group Managed Service Account (gMSA)** is configured for response actions, the response actions are disabled.<br> - In environments that use both v2 and v3 sensors, use local system accounts for all of your sensors. |

### Dynamic memory requirements
The new sensor is capped at 30% CPU utilization and 1.5 GB of memory usage. The resource caps significantly improve coexistence by preventing the sensor from overusing CPU or memory. However, if Falcon Identity already consumes substantial system resources, the Domain Controller may still experience performance strain. The sensor v3.x is more efficient than the v2 version, making coexistence much more feasible—as long as the DC is properly sized and maintained.

The following table describes memory requirements on the server used for the Defender for Identity sensor, depending on the type of virtualization you're using:

|VM running on|Description|
|------------|-------------|
|Hyper-V|Ensure that **Enable Dynamic Memory** isn't enabled for the VM.|
|VMware|Ensure that the amount of memory configured and the reserved memory are the same, or select the **Reserve all guest memory (All locked)** option in the VM settings.|
|Other virtualization host|Refer to the vendor supplied documentation on how to ensure that memory is fully allocated to the VM at all times. |

> [!IMPORTANT]
> When running as a virtual machine, all memory must be allocated to the virtual machine at all times.

## Configure RPC auditing on sensors v3.x to support advanced identity detections

Applying the **Unified Sensor RPC Audit** tag enables a new, tested capability on the machine, improving security visibility and unlocking additional identity detections. Once applied, the configuration is enforced on **existing and future devices** that match the rule criteria. You can see the tag is visible in the Device Inventory for transparency and auditing capabilities.

1. In the **Microsoft Defender portal**, navigate to: **System > Settings > Microsoft Defender XDR > Asset Rule Management**.
1. Select **Create a new rule**.

    :::image type="content" source="media/prerequisites-sensor-version-3/new-rule.png" alt-text="Screenshot that shows how to add a new rule." lightbox="media/prerequisites-sensor-version-3/new-rule.png":::

1. In the side panel:

   1. Enter a **Rule name** and **Description**.   
   1. Set **rule conditions** using `Device name`, `Domain`, or `Device tag` to target the desired machines.Target domain controllers with the sensor v3.x installed.
   1. Make sure that the **Defender for Identity sensor v3.x** is already deployed on the selected devices.

1. Add the **Unified Sensor RPC Audit** tag to the selected devices.

    ![Screenshot that shows the config tag.](media/prerequisites-sensor-version-3/tag.png)

1. Select **Next** to review and finish creating the rule, and then select **Submit**. Allow up to one hour for the rule to take effect.


### Updating rules
   Offboarding a device from this configuration can be done **only** from **deleting the asset rule** or **modifying the rule conditions** so the device no longer matches.

> [!NOTE]
> It may take up to 1 hour for changes to be reflected in the portal.

Learn more about Asset Management Rule [here](/defender-xdr/configure-asset-rules).

## Configure Windows event auditing
Defender for Identity uses Windows event log entries to detect specific activities. This data is used in various detection scenarios and can be used in advanced hunting queries. For optimal protection and monitoring, make sure that collection of windows events is properly configured.

See [Configure Defender for Identity to collect Windows events automatically (Preview)](configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically-preview).

If you do not select automatic Windows auditing configuration, you must [configure Windows event auditing manually](configure-windows-event-collection.md#configure-windows-event-collection-manually) or [using PowerShell](configure-windows-event-collection.md#configure-windows-event-collection-using-powershell). 

 
## Test your prerequisites

We recommend running the [*Test-MdiReadiness.ps1*](https://github.com/microsoft/Microsoft-Defender-for-Identity/tree/main/Test-MdiReadiness) script to test and see if your environment has the necessary prerequisites.

The *Test-MdiReadiness.ps1* script is also available from Microsoft Defender XDR, on the **Identities > Tools** page (Preview).

## Next step
[Activate the Microsoft Defender for Identity sensor](activate-sensor.md)
