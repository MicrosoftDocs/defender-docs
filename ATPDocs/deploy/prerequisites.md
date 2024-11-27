---
title: Prerequisites | Microsoft Defender for Identity
description: This article describes the prerequisites required for a successful Microsoft Defender for Identity deployment.
ms.date: 08/28/2023
ms.topic: conceptual
---

# Microsoft Defender for Identity prerequisites

This article describes the requirements for a successful Microsoft Defender for Identity deployment.

## Licensing requirements

Deploying Defender for Identity requires one of the following Microsoft 365 licenses:

[!INCLUDE [licenses](../includes/licenses.md)]

For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).

## Required permissions

- To create your Defender for Identity workspace, you need a Microsoft Entra ID tenant with at least one Security administrator.

    You need at least [Security administrator](/azure/active-directory/users-groups-roles/directory-assign-admin-roles#available-roles) access on your tenant to access the **Identity** section of the Microsoft Defender XDR **Settings** area and create the workspace.

    For more information, see [Microsoft Defender for Identity role groups](../role-groups.md).

- We recommend using at least one Directory Service account, with read access to all objects in the monitored domains. For more information, see [Configure a Directory Service account for Microsoft Defender for Identity](directory-service-accounts.md).

## Connectivity requirements

The Defender for Identity sensor must be able to communicate with the Defender for Identity cloud service, using one of the following methods:

|Method  |Description  |Considerations |Learn more |
|---------|---------|---------|---------|
|**Set up a proxy**     | Customers who have a forward proxy deployed can take advantage of the proxy to provide connectivity to the MDI cloud service.  <br><br> If you choose this option, you'll configure your proxy later in the deployment process. Proxy configurations include allowing traffic to the sensor URL, and configuring Defender for Identity URLs to any explicit allowlists used by your proxy or firewall. |  Allows access to the internet for a single URL  <br><br>SSL inspection isn't supported      |    [Configure endpoint proxy and internet connectivity settings](configure-proxy.md) <br><br>[Run a silent installation with a proxy configuration](install-sensor.md#command-for-running-a-silent-installation-with-a-proxy-configuration)   |
|**ExpressRoute**     | ExpressRoute can be configured to forward MDI sensor traffic over customer's express route. <br><br> To route network traffic destined to the Defender for Identity cloud servers use ExpressRoute Microsoft peering and add the Microsoft Defender for Identity (12076:5220) service BGP community to your route filter.    |  Requires ExpressRoute      |       [Service to BGP community value](/azure/expressroute/expressroute-routing#service-to-bgp-community-value)  |
|**Firewall, using the Defender for Identity Azure IP addresses**     | Customers who don't have a proxy or ExpressRoute can configure their firewall with the IP addresses assigned to the MDI cloud service. This requires that the customer monitor the Azure IP address list for any changes in the IP addresses used by the MDI cloud service.  <br><br> If you chose this option, we recommend that you download the [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519) file and use the **AzureAdvancedThreatProtection** service tag to add the relevant IP addresses.      |  Customer must monitor Azure IP assignments       |   [Virtual network service tags](/azure/virtual-network/service-tags-overview)      |

For more information, see [Microsoft Defender for Identity architecture](../architecture.md).


## Sensor requirements and recommendations

The following table summarizes requirements and recommendations for the domain controller, AD FS, AD CS, Entra Connect server where you'll install the Defender for Identity sensor.

| Prerequisite / Recommendation |Description  |
|---------|---------|
|**Specifications**     |  Make sure to install Defender for Identity on Windows version 2016 or higher, on a domain controller server with a minimum of:<br><br>- 2 cores<br>- 6 GB of RAM<br>- 6 GB of disk space required, 10 GB recommended, including space for Defender for Identity binaries and logs <br><br>Defender for Identity supports read-only domain controllers (RODC).     |
|**Performance**   | For optimal performance, set the **Power Option** of the machine running the Defender for Identity sensor to **High Performance**.        |
|**Network interface configuration** | If you are using VMware virtual machines, make sure the virtual machine's NIC configuration has Large Send Offload (LSO) disabled. See [VMware virtual machine sensor issue](../troubleshooting-known-issues.md#vmware-virtual-machine-sensor-issue) for more details.|
|**Maintenance window**     |   We recommend scheduling a maintenance window for your domain controllers, as a restart might be required if the installation runs and a restart is already pending, or if .NET Framework needs to be installed. <br><br>If .NET Framework version 4.7 or later isn't already found on the system, .NET Framework version 4.7 is installed, and may require a restart.      |

### Minimum operating system requirements

[!INCLUDE [server-requirements](../includes/server-requirements.md)]

#### Legacy operating systems

Windows Server 2012 and Windows Server 2012 R2 reached extended end of support on October 10, 2023.

We recommend that you plan to upgrade those servers as Microsoft no longer supports the Defender for Identity sensor on devices running Windows Server 2012 and Windows Server 2012 R2.

Sensors running on these operating systems will continue to report to Defender for Identity and even receive the sensor updates, but some of the new functionalities will not be available as they might rely on operating system capabilities.

### Required ports

|**Protocol**   |**Transport**         |**Port**         |**From**       |**To**   |
|------------|---------|---------|-------|--------------|
|**Internet ports**          | | | | |
|**SSL** (\*.atp.azure.com) <br><br>Alternately, [configure access through a proxy](configure-proxy.md).   |TCP      |443 |Defender for Identity sensor|Defender for Identity cloud service|
|**Internal ports**          | | | | |
|**DNS**            |TCP and UDP           |53  |Defender for Identity sensor|DNS Servers           |
|**Netlogon**  <br>(SMB, CIFS, SAM-R)|TCP/UDP  |445 |Defender for Identity sensor|All devices on the network|
|**RADIUS**         |UDP      |1813|RADIUS         |Defender for Identity sensor      |
|**Localhost ports**: Required for the sensor service updater  <br><br>By default, *localhost* to *localhost* traffic is allowed unless a custom firewall policy blocks it.    | | | | |
|**SSL** |TCP      |444 |Sensor service|Sensor updater service            |
|**Network Name Resolution (NNR) ports** <br><br>To resolve IP addresses to computer names, we recommend opening all ports listed. However, only one port is required.     | | | | |
|**NTLM over RPC**  |TCP      |Port 135         |Defender for Identity sensor|All devices on network|
|**NetBIOS**        |UDP      |137 |Defender for Identity sensor|All devices on network|
|**RDP**         <br><br>Only the first packet of **Client hello** queries the DNS server using reverse DNS lookup of the IP address (UDP 53)   |TCP      |3389 |Defender for Identity sensor|All devices on network|

If you're working with [multiple forests](multi-forest.md), make sure that the following ports are opened on any machine where a Defender for Identity sensor is installed:

|Protocol|Transport|Port|To/From|Direction|
|----|----|----|----|----|
|**Internet ports**||||
|**SSL** (*.atp.azure.com)|TCP|443|Defender for Identity cloud service|Outbound|
|**Internal ports**||||
|**LDAP**|TCP and UDP|389|Domain controllers|Outbound|
|**Secure LDAP** (LDAPS)|TCP|636|Domain controllers|Outbound|
|**LDAP to Global Catalog**|TCP|3268|Domain controllers|Outbound|
|**LDAPS to Global Catalog**|TCP|3269|Domain controllers|Outbound|


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

The link to the *Test-MdiReadiness.ps1* script is also available from Microsoft Defender XDR, on the **Identities > Tools** page (Preview).

## Related content

This article lists prerequisites required for a basic installation. Additional prerequisites are required when installing on an AD FS / AD CS server or Entra Connect, to support multiple Active Directory forests, or when you're installing a standalone Defender for Identity sensor.

For more information, see:

- [Deploying Microsoft Defender for Identity on AD FS and AD CS servers](active-directory-federation-services.md)
- [Microsoft Defender for Identity multi-forest support](multi-forest.md)
- [Microsoft Defender for Identity standalone sensor prerequisites](prerequisites-standalone.md)
- [Defender for Identity architecture](../architecture.md)

## Next step

> [!div class="step-by-step"]
> [Plan capacity for Microsoft Defender for Identity »](capacity-planning.md)
