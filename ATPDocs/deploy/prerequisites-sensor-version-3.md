---
title: Prerequisites | Microsoft Defender for Identity
description: This article describes the prerequisites required for a successful Microsoft Defender for Identity deployment.
ms.date: 06/18/2025
ms.topic: install-set-up-deploy
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity sensor v3.x prerequisites

This article describes the requirements for the Microsoft Defender for Identity sensor v3.x.

## Licensing requirements

Deploying Defender for Identity requires one of the following Microsoft 365 licenses:

[!INCLUDE [licenses](../includes/licenses.md)]

For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).

## Roles and permissions

- To create your Defender for Identity workspace, you need a Microsoft Entra ID tenant.
- You must have a user with a [Security administrator](/azure/active-directory/users-groups-roles/directory-assign-admin-roles#available-roles) role. For more information, see [Microsoft Defender for Identity role groups](../role-groups.md).
- We recommend using at least one Directory Service account, with read access to all objects in the monitored domains. For more information, see [Configure a Directory Service account for Microsoft Defender for Identity](directory-service-accounts.md).

## Sensor requirements and recommendations

The following table summarizes the server requirements and recommendations for the Defender for Identity sensor.

| Prerequisite / Recommendation |Description  |
|---------|---------|
|**Operating Sytem**| - Windows Server 2019 and later<br> - [March 2024 Cumulative Update](https://support.microsoft.com/topic/march-12-2024-kb5035857-os-build-20348-2340-a7953024-bae2-4b1a-8fc1-74a17c68203c)     |
|**Specifications**     |  A domain controller server with a minimum of:<br><br>- two cores<br>- 6 GB of RAM<br>- 6 GB of disk space required, 10 GB recommended, including space for Defender for Identity binaries and logs.|
|**Performance**   | For optimal performance, set the **Power Option** of the machine running the Defender for Identity sensor to **High Performance**.        |
|**Connectivity**|Requires Microsoft Defender for Endpoint [streamlined URLs](../../defender-endpoint/configure-device-connectivity.md#option-1-configure-connectivity-using-the-simplified-domain).   |
|**Network interface configuration** | If you're using VMware virtual machines, make sure the virtual machine's NIC configuration has Large Send Offload (LSO) disabled. See [VMware virtual machine sensor issue](../troubleshooting-known-issues.md#vmware-virtual-machine-sensor-issue) for more details.|
|**Maintenance window**     |   We recommend scheduling a maintenance window for your domain controllers, as a restart might be required if the installation runs and a restart is already pending, or if .NET Framework needs to be installed. <br><br>If .NET Framework version 4.7 or later isn't already found on the system, .NET Framework version 4.7 is installed, and might require a restart.      |

### Required ports

|**Protocol**   |**Transport**         |**Port**         |**From**       |**To**   |
|------------|---------|---------|-------|--------------|
|**DNS**            |TCP and UDP           |53  |Defender for Identity sensor|DNS Servers           |
|**Netlogon**  <br>(SMB, CIFS, SAM-R)|TCP/UDP  |445 |Defender for Identity sensor|All devices on the network|
|**RADIUS**         |UDP      |1813|RADIUS         |Defender for Identity sensor      |
|**Localhost ports**: Required for the sensor service updater  <br><br>By default, *localhost* to *localhost* traffic is allowed unless a custom firewall policy blocks it.    | | | | |
|**SSL** |TCP      |444 |Sensor service|Sensor updater service            |
|**Network Name Resolution (NNR) ports** <br><br>To resolve IP addresses to computer names, we recommend opening all ports listed. However, only one port is required.     | | | | |
|**NTLM over RPC**  |TCP      |Port 135         |Defender for Identity sensor|All devices on network|
|**NetBIOS**        |UDP      |137 |Defender for Identity sensor|All devices on network|
|**RDP**         <br><br>Only the first packet of **Client hello** queries the DNS server using reverse DNS lookup of the IP address (UDP 53)   |TCP      |3389 |Defender for Identity sensor|All devices on network|

### Dynamic memory requirements

The following table describes memory requirements on the server used for the Defender for Identity sensor, depending on the type of virtualization you're using:

|VM running on|Description|
|------------|-------------|
|**Hyper-V**|Ensure that **Enable Dynamic Memory** isn't enabled for the VM.|
|**VMware**|Ensure that the amount of memory configured and the reserved memory are the same, or select the **Reserve all guest memory (All locked)** option in the VM settings.|
|**Other virtualization host**|Refer to the vendor supplied documentation on how to ensure that memory is fully allocated to the VM at all times. |

> [!IMPORTANT]
> When running as a virtual machine, all memory must be allocated to the virtual machine at all times.

## Time synchronization
The servers and domain controllers onto which the sensor is installed must have time synchronized to within five minutes of each other.

## Test your prerequisites

We recommend running the [*Test-MdiReadiness.ps1*](https://github.com/microsoft/Microsoft-Defender-for-Identity/tree/main/Test-MdiReadiness) script to test and see if your environment has the necessary prerequisites.

The *Test-MdiReadiness.ps1* script is also available from Microsoft Defender XDR, on the **Identities > Tools** page (Preview).

## Next step
[Plan capacity for Microsoft Defender for Identity](capacity-planning.md)
