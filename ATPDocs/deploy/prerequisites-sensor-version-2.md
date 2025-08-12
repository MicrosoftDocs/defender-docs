---
title: Microsoft Defender for Identity sensor v2.x prerequisites | Microsoft Defender for Identity
description: This article describes the prerequisites for installing the Microsoft Defender for Identity sensor.
ms.date: 06/18/2025
ms.topic: install-set-up-deploy
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity prerequisites

This article describes the requirements for installing the Microsoft Defender for Identity sensor v2.x.

## Licensing requirements

Deploying Defender for Identity requires one of the following Microsoft 365 licenses:

[!INCLUDE [licenses](../includes/licenses.md)]

For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).

## Roles and permissions

- To create your Defender for Identity workspace, you need a Microsoft Entra ID tenant.
- You must have a user with a [Security administrator](/azure/active-directory/users-groups-roles/directory-assign-admin-roles#available-roles) role. For more information, see [Microsoft Defender for Identity role groups](../role-groups.md).
- We recommend using at least one Directory Service account, with read access to all objects in the monitored domains. For more information, see [Configure a Directory Service account for Microsoft Defender for Identity](directory-service-accounts.md).

## Connectivity requirements

The Defender for Identity sensor must be able to communicate with the Defender for Identity cloud service, using one of the following methods:

|Method  |Description  |Considerations |Learn more |
|---------|---------|---------|---------|
|Proxy | Customers who have a forward proxy deployed can take advantage of the proxy to provide connectivity to the MDI cloud service.<br><br> If you choose this option, you'll need to configure your proxy later in the deployment process. Proxy configurations include allowing traffic to the sensor URL, and configuring Defender for Identity URLs to any explicit allowlists used by your proxy or firewall. |  Allows access to the internet for a single URL  <br><br>SSL inspection isn't supported      |    [Configure endpoint proxy and internet connectivity settings](configure-proxy.md) <br><br>[Run a silent installation with a proxy configuration](install-sensor.md#command-for-running-a-silent-installation-with-a-proxy-configuration)   |
|ExpressRoute  | ExpressRoute can be configured to forward MDI sensor traffic over customer's express route. <br><br> To route network traffic destined to the Defender for Identity cloud servers use ExpressRoute Microsoft peering and add the Microsoft Defender for Identity (12076:5220) service BGP community to your route filter.    |  Requires ExpressRoute      |       [Service to BGP community value](/azure/expressroute/expressroute-routing#service-to-bgp-community-value)  |
|Firewall, using the Defender for Identity Azure IP addresses  | Customers who don't have a proxy or ExpressRoute can configure their firewall with the IP addresses assigned to the MDI cloud service. This requires that the customer monitor the Azure IP address list for any changes in the IP addresses used by the MDI cloud service.  <br><br> If you chose this option, we recommend that you download the [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519) file and use the **AzureAdvancedThreatProtection** service tag to add the relevant IP addresses.      |  Customer must monitor Azure IP assignments       |   [Virtual network service tags](/azure/virtual-network/service-tags-overview)      |

For more information, see [Microsoft Defender for Identity architecture](../architecture.md).


## Sensor requirements and recommendations

The following table summarizes the server requirements and recommendations for the Defender for Identity sensor.

| Prerequisite / Recommendation |Description  |
|---------|---------|
|Specifications  |  Make sure to install Defender for Identity on Windows version 2016 or higher, on a domain controller server with a minimum of:<br><br>- two cores<br>- 6 GB of RAM<br>- 6 GB of disk space required, 10 GB recommended, including space for Defender for Identity binaries and logs <br><br>Defender for Identity supports read-only domain controllers (RODC).     |
|Performance   | For optimal performance, set the **Power Option** of the machine running the Defender for Identity sensor to **High Performance**.        |
|Network interface configuration | If you're using VMware virtual machines, make sure the virtual machine's NIC configuration has Large Send Offload (LSO) disabled. See [VMware virtual machine sensor issue](../troubleshooting-known-issues.md#vmware-virtual-machine-sensor-issue) for more details.|
|Maintenance window|   We recommend scheduling a maintenance window for your domain controllers, as a restart might be required if the installation runs and a restart is already pending, or if .NET Framework needs to be installed. <br><br>If .NET Framework version 4.7 or later isn't already found on the system, .NET Framework version 4.7 is installed, and might require a restart.      |
|AD FS federation servers     |In AD FS environments, Defender for Identity sensors are supported only on the federation servers. They're not required on Web Application Proxy (WAP) servers.       |
|Microsoft Entra Connect servers     |For Microsoft Entra Connect servers, you need to install the sensors on both active and staging servers.       |
|AD CS servers    |Defender for Identity sensor for AD CS supports only AD CS servers with Certification Authority Role Service. You don't need to install sensors on any AD CS servers that are offline.       |
|Time synchronization|The servers and domain controllers onto which the sensor is installed must have time synchronized to within five minutes of each other.|

### Minimum operating system requirements

[!INCLUDE [server-requirements](../includes/server-requirements.md)]

#### Legacy operating systems

Windows Server 2012 and Windows Server 2012 R2 reached extended end of support on October 10, 2023. Sensors running on these operating systems continue to report to Defender for Identity and even receive the sensor updates, but some functionality that relies on operating system capabilities might not be available. We recommend that you upgrade any servers using these operating systems. 

### Required ports

|Protocol   |Transport         |Port         |From       |To   |Notes|
|------------|---------|---------|-------|--------------|------|
|Internet ports       | | | | |  |
|SSL (\*.atp.azure.com)   |TCP      |443 |Defender for Identity sensor|Defender for Identity cloud service|Alternately, [configure access through a proxy](configure-proxy.md).|
|Internal ports          | | | | |  |
|DNS     |TCP and UDP           |53  |Defender for Identity sensor|DNS Servers           |
|Netlogon  <br>(SMB, CIFS, SAM-R)|TCP/UDP  |445 |Defender for Identity sensor|All devices on the network|  |
|RADIUS         |UDP      |1813|RADIUS         |Defender for Identity sensor      |  |
|Localhost port    | | | | |Required for the sensor service updater. By default, *localhost* to *localhost* traffic is allowed unless a custom firewall policy blocks it.|
|SSL|TCP      |444 |Sensor service|Sensor updater service            |   |
|Network Name Resolution (NNR) ports    | | | | |To resolve IP addresses to computer names, we recommend opening all ports listed. However, only one port is required. |
|NTLM over RPC |TCP      |Port 135         |Defender for Identity sensor|All devices on network|  |
|NetBIOS        |UDP      |137 |Defender for Identity sensor|All devices on network|  |
|RDP      |TCP      |3389 |Defender for Identity sensor|All devices on network|Only the first packet of **Client hello** queries the DNS server using reverse DNS lookup of the IP address (UDP 53)|

If you're working with [multiple forests](multi-forest.md), make sure that the following ports are opened on any machine where a Defender for Identity sensor is installed:

|Protocol|Transport|Port|To/From|Direction|
|----|----|----|----|----|
|Internet ports||||
|SSL (*.atp.azure.com)|TCP|443|Defender for Identity cloud service|Outbound|
|Internal ports||||
|LDAP|TCP and UDP|389|Domain controllers|Outbound|
|Secure LDAP (LDAPS)|TCP|636|Domain controllers|Outbound|
|LDAP to Global Catalog|TCP|3268|Domain controllers|Outbound|
|LDAPS to Global Catalog|TCP|3269|Domain controllers|Outbound|


> [!TIP]
> By default, Defender for Identity sensors query the directory using LDAP on ports 389 and 3268. To switch to LDAPS on ports 636 and 3269, open a support case. For more information, see [Microsoft Defender for Identity support](../support.md).

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
