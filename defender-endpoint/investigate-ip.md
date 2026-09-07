---
title: Investigate an IP address associated with an alert
description: Use the investigation options to examine possible communication between devices and external IP addresses.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
- mde-edr
ms.topic: how-to
ms.date: 07/02/2026
ms.subservice: edr
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Investigate an IP address associated with a Microsoft Defender for Endpoint alert


Examine possible communication between your devices and external internet protocol (IP) addresses.

Identifying all devices in the organization that communicated with a suspected or known malicious IP address, such as Command and Control (C2) servers, helps determine the potential scope of breach, associated files, and infected devices.

You can find information from the following sections in the IP address view:

- IP geo information
- Alerts related to this IP
- IP in organization observations
- Prevalence in organization

<a name="ip-geo-information"></a>
## IP geolocation information

In the IP address view, the left pane provides IP details (if available). 
- Organization (ISP)
- ASN
- Country
- State
- City
- Carrier
- Latitude
- Longitude
- Postal code

<a name="alerts-related-to-this-ip"></a>
## Related alerts

The **Related alerts** section provides a list of alerts that are associated with the IP.

<a name="ip-observed-in-organization"></a>
## IP activity observed in the organization

The **IP activity observed in the organization** section provides a list of devices that have a connection with this IP and the last event details for each device (the list is limited to 100 devices).

<a name="prevalence"></a>
## IP prevalence in the organization

The **IP prevalence in the organization** section displays how many devices have connected to this IP address, and when the IP was first and last seen. You can filter the results of this section by time period; the default period is 30 days.

**Investigate an external IP:**

1. Enter the IP address in the **Search** field.
1. Select the IP suggestion box and open the IP side panel.
1. Select **Enter**.

Details about the IP address are displayed, including: registration details (if available), prevalence of devices in the organization that communicated with this IP Address (during selectable time period), and the devices in the organization that were observed communicating with this IP address.

> [!NOTE]
> Search results will only be returned for IP addresses observed in communication with devices in the organization.

Use the IP search filters at the top of the page to define the search criteria. You can also use the timeline search box to filter the displayed results of all devices in the organization observed communicating with the IP address, the file associated with the communication and the last date observed.

Clicking any of the device names will take you to that device's view, where you can continue to investigate reported alerts, behaviors, and events.

<a name="related-topics"></a>
## Related content

For more information, see the following articles:

- [View and organize the Microsoft Defender for Endpoint Alerts queue](alerts-queue.md)
- [Manage Microsoft Defender for Endpoint alerts](/defender-xdr/investigate-alerts?toc=/defender-endpoint/toc.json&bc=/defender-endpoint/breadcrumb/toc.json#manage-alerts)
- [Investigate Microsoft Defender for Endpoint alerts](investigate-alerts.md)
- [Investigate a file associated with a Microsoft Defender for Endpoint alert](investigate-files.md)
- [Investigate devices in the Microsoft Defender for Endpoint Devices list](investigate-machines.md)
- [Investigate a domain associated with a Microsoft Defender for Endpoint alert](investigate-domain.md)
- [Investigate a user account in Microsoft Defender for Endpoint](investigate-user.md)


