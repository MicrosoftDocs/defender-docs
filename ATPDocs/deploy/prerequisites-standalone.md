---
title: Standalone sensor prerequisites | Microsoft Defender for Identity
description: This article describes the prerequisites required for a successful Microsoft Defender for Identity deployment using a standalone sensor.
ms.date: 11/26/2023
ms.topic: conceptual
#CustomerIntent: As a Defender for Identity admin, I want to understand extra prerequisites for deploying a Defender for Identity standalone sensor so that I can be prepared for a successful deployment.
---

# Microsoft Defender for Identity standalone sensor prerequisites

This article lists prerequisites for deploying a Microsoft Defender for Identity standalone sensor where they differ from the [main deployment prerequisites](../prerequisites.md). 

For more information, see [Plan capacity for Microsoft Defender for Identity deployment](../capacity-planning.md).

> [!IMPORTANT]
> Defender for Identity standalone sensors do not support the collection of Event Tracing for Windows (ETW) log entries that provide the data for multiple detections. For full coverage of your environment, we recommend deploying the Defender for Identity sensor.

## Extra system requirements for standalone sensors

Standalone sensors differ from Defender for Identity sensor [prerequisites](../prerequisites.md) as follows:

- Standalone sensors require a minimum of 5 GB of disk space

- Standalone sensors can also be installed on servers that are in a workgroup.

- Standalone sensors can support monitoring multiple domain controllers, depending on the amount of network traffic to and from the domain controllers.

- If you're working with [multiple forests](multi-forest.md), your standalone sensor machines must be allowed to communicate with all remote forest domain controllers using LDAP.

For information on using virtual machines with the Defender for Identity standalone sensor, see [Configure port mirroring](configure-port-mirroring.md).

## Network adapters for standalone sensors

Standalone sensors require at least one of each of the following network adapters:

- **Management adapters** - used for communications on your corporate network. The sensor uses this adapter to query the DC it's protecting and performing resolution to machine accounts.

    Configure management adapters with static IP addresses, including a default gateway, and preferred and alternate DNS servers.

    The **DNS suffix for this connection** should be the DNS name of the domain for each domain being monitored. 

    > [!NOTE]
    > If the Defender for Identity standalone sensor is a member of the domain, this may be configured automatically.

- **Capture adapter** - used to capture traffic to and from the domain controllers.

    > [!IMPORTANT]
    >
    > - [Configure port mirroring](configure-port-mirroring.md) for the capture adapter as the destination of the domain controller network traffic. Typically, you need to work with the networking or virtualization team to configure port mirroring.
    > - Configure a static non-routable IP address (with /32 mask) for your environment with no default sensor gateway and no DNS server addresses. For example: `10.10.0.10/32. This configuration ensures that the capture network adapter can capture the maximum amount of traffic and that the management network adapter is used to send and receive the required network traffic.

>[!NOTE]
>If you run Wireshark on Defender for Identity standalone sensor, restart the Defender for Identity sensor service after you've stopped the Wireshark capture. If you don't restart the sensor service, the sensor stops capturing traffic.

If you attempt to install the Defender for Identity sensor on a machine configured with a NIC Teaming adapter, you receive an installation error. If you want to install the Defender for Identity sensor on a machine configured with NIC teaming, see [Defender for Identity sensor NIC teaming issue](../troubleshooting-known-issues.md#defender-for-identity-sensor-nic-teaming-issue).

### Ports for standalone sensors

The following table lists the extra ports that the Defender for Identity standalone sensor requires configured on the management adapter, in addition to ports listed for the [Defender for Identity sensor](../prerequisites.md#required-ports).

|Protocol|Transport|Port|From|To|
|------------|-------------|--------|-----------|---|
|**Internal ports**||||
|**LDAP**|TCP and UDP|389|Defender for Identity sensor|Domain controllers|
|**Secure LDAP (LDAPS)**|TCP|636|Defender for Identity sensor|Domain controllers|
|**LDAP to Global Catalog**|TCP|3268|Defender for Identity sensor|Domain controllers|
|**LDAPS to Global Catalog**|TCP|3269|Defender for Identity sensor|Domain controllers|
|**Kerberos**|TCP and UDP|88|Defender for Identity sensor|Domain controllers|
|**Windows Time**|UDP|123|Defender for Identity sensor|Domain controllers|
|**Syslog** (optional)|TCP/UDP|514, depending on configuration|SIEM Server|Defender for Identity sensor|


## Windows event log requirements

Defender for Identity detection relies on specific [Windows Event logs](event-collection-overview.md) that the sensor parses from your domain controllers. For the correct events to be audited and included in the Windows Event log, your domain controllers require accurate Windows Advanced Audit Policy settings.

For more information, see, [Advanced audit policy check](../configure-windows-event-collection.md) and [Advanced security audit policies](/windows/security/threat-protection/auditing/advanced-security-auditing) in the Windows documentation.

- To make sure that [Windows Event 8004 is audited](../configure-windows-event-collection.md#configure-ntlm-auditing) as needed by the service, review your [NTLM audit settings](/archive/blogs/askds/ntlm-blocking-and-you-application-analysis-and-auditing-methodologies-in-windows-7).

- For sensors running on AD FS / AD CS servers, configure the auditing level to **Verbose**. For more information, see [Event auditing information for AD FS](/windows-server/identity/ad-fs/troubleshooting/ad-fs-tshoot-logging#event-auditing-information-for-ad-fs-on-windows-server-2016) and [Event auditing information for AD CS](/windows-server/identity/ad-fs/troubleshooting/ad-fs-tshoot-logging).

## Next steps

> [!div class="step-by-step"]
> [Configure port mirroring](configure-port-mirroring.md)

