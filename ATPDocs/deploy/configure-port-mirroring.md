---
title: Configure port mirroring  | Microsoft Defender for Identity
description: Learn about Defender for Identity port mirroring options.
ms.date: 08/10/2023
ms.topic: how-to
---

# Configure port mirroring

This article describes port mirroring options for Microsoft Defender for Identity, and is relevant only for standalone sensors. Defender for Identity mainly uses deep packet inspection over network traffic to and from your domain controllers. For Defender for Identity standalone sensors to see network traffic, you must either configure port mirroring, or use a Network TAP. Port mirroring copies the traffic from one port (the source port) to another port (the destination port).

When using port mirroring, configure port mirroring for each domain controller that you're monitoring as the source of your network traffic. We recommend working with your networking or virtualization team to configure port mirroring.

> [!IMPORTANT]
> Defender for Identity standalone sensors do not support the collection of Event Tracing for Windows (ETW) log entries that provide the data for multiple detections. For full coverage of your environment, we recommend deploying the Defender for Identity sensor.
>

## Choose a port mirroring method

Your domain controllers and Defender for Identity standalone sensor can be either physical or virtual. The following are common methods for port mirroring and some considerations. For more information, see your switch or virtualization server product documentation. Your switch manufacturer might use different terminology.


|Method  |Description  |
|---------|---------|
|**Switched Port Analyzer (SPAN)**     | Copies network traffic from one or more switch ports to another switch port on the same switch. Both the Defender for Identity standalone sensor and domain controllers must be connected to the same physical switch.        |
|**Remote Switch Port Analyzer (RSPAN)**     |   Allows you to monitor network traffic from source ports distributed over multiple physical switches. RSPAN copies the source traffic into a special RSPAN configured VLAN. This VLAN needs to be trunked to the other switches involved. RSPAN works at Layer 2.      |
|**Encapsulated Remote Switch Port Analyzer (ERSPAN)**     |    A Cisco proprietary technology working at Layer 3. ERSPAN allows you to monitor traffic across switches without the need for VLAN trunks and uses generic routing encapsulation (GRE) to copy monitored network traffic. <br><br>    Defender for Identity currently cannot directly receive ERSPAN traffic. Instead: <br>    1. Configure the ERSPAN destination where the traffic is decapsulated as a switch or router that can decapsulate the traffic.  <br> 1. Configure the switch or router to forward the decapsulated traffic to the Defender for Identity standalone sensor using either SPAN or RSPAN.|

> [!NOTE]
> - If the domain controller being port mirrored is connected over a WAN link, make sure the WAN link can handle the additional load of the ERSPAN traffic.
>
> - Defender for Identity only supports traffic monitoring when the traffic reaches the NIC and the domain controller in the same manner. Defender for Identity does not support traffic monitoring when the traffic is broken out to different ports.

## Supported port mirroring options

The following table describes Defender for Identity's support for port mirroring configurations:

|Defender for Identity standalone sensor|Domain controller|Considerations|
|---------------|---------------------|------------------|
|Virtual|Virtual on same host|The virtual switch needs to support port mirroring.<br /><br />Moving one of the virtual machines to another host by itself may break the port mirroring.|
|Virtual|Virtual on different hosts|Make sure your virtual switch supports this scenario.|
|Virtual|Physical|Requires a dedicated network adapter otherwise Defender for Identity sees all of the traffic coming in and out of the host, even the traffic it sends to the Defender for Identity cloud service.|
|Physical|Virtual|Make sure your virtual switch supports this scenario - and port mirroring configuration on your physical switches based on the scenario:<br /><br />If the virtual host is on the same physical switch, you need to configure a switch level span.<br /><br />If the virtual host is on a different switch, you need to configure RSPAN or ERSPAN&#42;.|
|Physical|Physical on the same switch|Physical switch must support SPAN/Port Mirroring.|
|Physical|Physical on a different switch|Requires physical switches to support RSPAN or ERSPAN <br><br>ERSPAN is only supported when decapsulation is performed before the traffic is analyzed by Defender for Identity.|

> [!NOTE]
> The time on your domain controllers and the connected Defender for Identity sensor must be synchronized to within 5 minutes of eachother.
>

## Related content

For more information, see:

- [Event collection with Microsoft Defender for Identity](event-collection-overview.md)
- [Configure audit policies for Windows event logs](configure-windows-event-collection.md)
- [Listen for SIEM events on your Defender for Identity standalone sensor](configure-event-collection.md)
