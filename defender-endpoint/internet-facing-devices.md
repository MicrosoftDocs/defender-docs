---
title: Identify internet-facing devices in Microsoft Defender for Endpoint
description: Identify internet-facing devices in the device inventory list
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
search.appverid: met150
ms.date: 07/31/2024
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Identify internet-facing devices

Internet-facing devices can be connected to or reached from the outside, posing a significant threat to your organization. Mapping your organization's external attack surface is a key part of security posture management. Microsoft Defender for Endpoint automatically identifies and flags onboarded, exposed, internet-facing devices in the [Microsoft Defender portal](https://security.microsoft.com/).

> [!NOTE]
> Currently, only Windows devices onboarded to Microsoft Defender for Endpoint can be identified as internet-facing. Support for other platforms will be available in upcoming releases.

## How devices are flagged as internet-facing

Devices that are successfully connected through TCP or identified as host reachable through UDP are flagged as internet-facing. Defender for Endpoint uses two data sources:

| Data source | Description |
|-------------|-------------|
| **External scans** | Identify which devices are approachable from the outside |
| **Device network connections** | Captured as part of Defender for Endpoint signals to identify external incoming connections that reach internal devices |

Devices can be flagged when a configured firewall policy (host firewall rule or enterprise firewall rule) allows inbound internet communication. Understanding your firewall policy and distinguishing devices that are intentionally internet-facing from those that may compromise your organization provides critical information for mapping your external attack surface.

## View internet-facing devices

To view internet-facing devices in the Microsoft Defender portal:

1. Go to **Assets** \> **Device** in the [Microsoft Defender portal](https://security.microsoft.com/machines/).

   :::image type="content" source="/defender/media/defender-endpoint/internet-facing-tag.png" alt-text="Screenshot of the internet-facing tag" lightbox="/defender/media/defender-endpoint/internet-facing-tag.png":::

1. Look for devices with the **internet facing** tag in the **Tags** column.

1. Hover over the tag to see why it was applied:
   - This device was detected by an external scan
   - This device received external incoming communication

At the top of the page, you can view a counter that shows the number of devices identified as internet-facing and potentially less secure.

### Filter for internet-facing devices

Use filters to focus on internet-facing devices and investigate the risk they may introduce:

   :::image type="content" source="/defender/media/defender-endpoint/internet-facing-filter.png" alt-text="Screenshot of the internet-facing filter" lightbox="/defender/media/defender-endpoint/internet-facing-filter.png":::

The internet-facing device tag also appears in Microsoft Defender Vulnerability Management, allowing you to filter for internet-facing devices from the [weaknesses](/defender-vulnerability-management/tvm-weaknesses) and [security recommendations](/defender-vulnerability-management/tvm-security-recommendation) pages in the Microsoft Defender portal.

   :::image type="content" source="/defender/media/defender-endpoint/internet-facing-weaknesses.png" alt-text="Screenshot of the internet-facing weaknesses" lightbox="/defender/media/defender-endpoint/internet-facing-weaknesses.png":::

> [!NOTE]
> If no new events for a device occur for 48 hours, the Internet-facing tag is removed and it will no longer be visible in the Microsoft Defender portal.

## Investigate internet-facing devices

To view detailed information about an internet-facing device, select the device in the device inventory to open its flyout pane:

   :::image type="content" source="/defender/media/defender-endpoint/internet-facing-details.png" alt-text="Screenshot of the internet facing device details page" lightbox="/defender/media/defender-endpoint/internet-facing-details.png":::

The flyout includes:

| Information | Description |
|-------------|-------------|
| **Detection method** | Whether the device was detected by a Microsoft external scan or received an external incoming communication |
| **External network interface** | External IP address and port that were scanned when the device was identified as internet facing |
| **Local network interface** | Local network interface address and port for this device |
| **Last seen** | The last time the device was identified as internet facing |

### Use advanced hunting queries

Use advanced hunting queries to gain visibility and insights into internet-facing devices in your organization.

#### Get all internet facing devices

Use this query to find all devices that are internet facing:

```kusto
// Find all devices that are internet-facing
DeviceInfo
| where Timestamp > ago(7d)
| where IsInternetFacing
| extend InternetFacingInfo = AdditionalFields
| extend InternetFacingReason = extractjson("$.InternetFacingReason", InternetFacingInfo, typeof(string)), InternetFacingLocalPort = extractjson("$.InternetFacingLocalPort", InternetFacingInfo, typeof(int)), InternetFacingScannedPublicPort = extractjson("$.InternetFacingPublicScannedPort", InternetFacingInfo, typeof(int)), InternetFacingScannedPublicIp = extractjson("$.InternetFacingPublicScannedIp", InternetFacingInfo, typeof(string)), InternetFacingLocalIp = extractjson("$.InternetFacingLocalIp", InternetFacingInfo, typeof(string)),   InternetFacingTransportProtocol=extractjson("$.InternetFacingTransportProtocol", InternetFacingInfo, typeof(string)), InternetFacingLastSeen = extractjson("$.InternetFacingLastSeen", InternetFacingInfo, typeof(datetime))
| summarize arg_max(Timestamp, *) by DeviceId
```

This query returns the following fields for each internet-facing device:

| Field | Description |
|-------|-------------|
| **InternetFacingReason** | Whether the device was detected by an external scan or received incoming communication from the internet |
| **InternetFacingLocalIp** | The local IP address of the internet facing interface |
| **InternetFacingLocalPort** | The local port where internet facing communication was observed |
| **InternetFacingPublicScannedIp** | The public IP address that was externally scanned |
| **InternetFacingPublicScannedPort** | The internet facing port that was externally scanned |
| **InternetFacingTransportProtocol** | The transport protocol used (TCP/UDP) |

#### Get information on inbound connections

For TCP connections, gain insights into applications or services identified as listening on a device by querying [DeviceNetworkEvents](/defender-xdr/advanced-hunting-devicenetworkevents-table).

| Scenario | Query | Notes |
|----------|-------|-------|
| **Device received external incoming communication** | `InboundExternalNetworkEvents("<DeviceId>")` | Returns the last 7 days of device incoming communication from public IP addresses. Replace `<DeviceId>` with the device ID you want to investigate. Process-related information is only available for TCP connections. |
| **Device detected by external scan (TCP)** | `DeviceNetworkEvents`<br>`\| where Timestamp > ago(7d)`<br>`\| where DeviceId == ""`<br>`\| where Protocol == "Tcp"`<br>`\| where ActionType == "InboundInternetScanInspected"` | Use for devices tagged with **This device was detected by an external scan**. Replace the empty `DeviceId` value with the device ID you want to investigate. |
| **Device detected by external scan (UDP)** | `DeviceNetworkEvents`<br>`\| where Timestamp > ago(7d)`<br>`\| where DeviceId == ""`<br>`\| where Protocol == "Udp"`<br>`\| where ActionType == "InboundInternetScanInspected"` | Identifies devices that were host reachable but may not have established a connection (for example, as a result of the host firewall policy). Replace the empty `DeviceId` value with the device ID you want to investigate. |

If the above queries fail to provide the relevant connections, you can use socket collection methods to retrieve the source process. To learn more about different tools and capabilities available to do this, see:

- [Defender for Endpoint live response](live-response.md)
- [Microsoft Network Monitor](/troubleshoot/windows-client/networking/collect-data-using-network-monitor)
- [Netstat for Windows](/windows-server/administration/windows-commands/netstat)

## Report inaccuracy

If a device has incorrect internet-facing information, you can report an inaccuracy:

1. Open the device flyout from the Device inventory page.
1. Select **Report device inaccuracy**.
1. In the **What part is inaccurate** dropdown, select **Device information**.
1. For **Which information is inaccurate** select the **internet facing classification** checkbox from the dropdown.
1. Fill in the requested details about what the correct information should be.
1. Provide an email address (optional).
1. Select **Submit Report**.

## Related articles

- [Explore devices in the device inventory](machines-view-overview.md)
- [Investigate devices in the Defender for Endpoint Devices list](investigate-machines.md)



