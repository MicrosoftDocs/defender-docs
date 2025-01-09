---
title: Investigate incidents and alerts in Microsoft Defender for IoT in the Defender portal
description: This article describes how to investigate incidents and alerts in Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/26/2024
ms.topic: how-to
---

# Investigate incidents and alerts

Microsoft Defender for IoT in the Microsoft Defender portal displays incidents and alerts, which enhance your network security and operations with real-time details about events logged in your operational technology (OT) network.

Alerts are the basis of all incidents and indicate the occurrence of malicious or suspicious events in your environment. Within an incident, you analyze the alerts that affect your network, understand what they mean, and collate the evidence so that you can devise an effective remediation plan.

Learn more about [alerts](/defender-xdr/investigate-alerts) and [incidents](/defender-xdr/investigate-incidents) in the Defender portal.

In this article, you learn how to investigate a Microsoft Defender for IoT incident and its associated alerts, and how to remediate the security issues raised by the alert.

Alerts in the **Incidents** page uniquely combine IT and OT environment signals to detect potential threats and data leaks. The **Incidents** page displays:

- A history of the alerts connected to the incident and an incident graph. The graph shows other devices connected to the affected OT device that might also be compromised.
- Alert descriptions, which explain the type of detected security issue.
- Remediation options to solve the security problem.

> [!NOTE]
> Incident and alert data for Defender for IoT only appear once you have a site set up and your devices are sending data to the Defender portal. Learn how to [set up a site](set-up-sites.md).

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Investigate alerts

To investigate an alert:

1. In the [Microsoft Defender portal](https://security.microsoft.com/machines) menu, select **Incidents & alerts > Incidents**.

1. To display OT related incidents:

    1. Select **Add filter**.
    1. Select **Product name** and select **Add**.
    1. Select the **Product names** tab that appears and type: *Defender for IoT*.
    1. Select **Apply**.

1. Locate and select an incident.

    The specific incident page shows the attack story made up of the alert timeline, an incident graph and the incident details.

1. Select an alert from the alerts list.

    The incident graph and incident details display specific data for this alert.

1. In the **Incident** panel, review the information, read the **Alert description**, **Evidence** and **Impacted assetts** and follow the **Alert recommended actions** to remediate the issue.

## Defender for IoT alert

Defender for IoT generates its own unique alert.

| Name | Description |
|----|----|
|**Possible operational impact due to a compromised device** |A compromised device communicated with an operational technology (OT) asset. An attacker might be attempting to control or disrupt physical operations. |

## Advanced hunting

Use the **Site** property listed in the **DeviceInfo** table to write queries for advanced hunting. This allows you to filter devices according to a specific site, for example, all devices that communicated with malicious devices at a specific site.

The following query lists all endpoint devices with the specific IP address at the San Francisco site.

```kusto
DeviceInfo
|where Site == "SanFrancisco" and PublicIP == "192.168.1.1" and DeviceCategory == "Endpoint"
```

This is relevant for both the device inventory and site security. For more information, see [Advanced hunting](/../defender-xdr/advanced-hunting-overview) and the [Advanced hunting DeviceInfo schema](/../defender-xdr/advanced-hunting-deviceinfo-table).
