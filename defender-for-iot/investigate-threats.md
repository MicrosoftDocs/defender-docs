---
title: Investigate incidents and alerts in Microsoft Defender for IoT in the Defender portal
description: This article describes how to investigate incidents and alerts in Microsoft Defender for IoT in the Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Investigate incidents and alerts

Incidents and alerts are an integral part of the Microsoft Defender portal and Microsoft Defender for Endpoints. For more information, see [Investigate alerts in Defender XDR](/defender-xdr/investigate-alerts.md).

The **Incidents** page lists possible security breaches that could compromise your network. The incident page displays a history of the alerts connected to the incident and an incident graph showing the other devices connected to the affected OT device which might also be compromised.

The alert description explains the type of security issue detected and lists remidiation options to solve the security problem. The Incident page alerts are based on the Defender for Endpoints network signals and uniquely combine IT and OT environment signals to detect potential threats and data leaks across this boundary.

In this article you learn to investigate a Microsoft Defender for IoT incident, it's associated alerts, and to remidiate them.
<!-- Amit wanted this note, although it might not really be relevant here. -->
>[!Note]
>Incident and alert data for Defender for IoT will only appear once you have a site set up and the devices are sending data to the Defender portal.

## Investigate alerts

Investigate threats that impact on your operational environment using the **Incidents** page, which shows the list of security events affecting your IT and OT devices.

1. In the Defender portal, go to **Incidents & alerts > Incidents**.

1. To display OT related incidents:
    1. Select **Add filter**.
    1. Check the **Product name** box, select **Add**.
    1. Select the new **Product names** tab that appears and type **Defender for IoT**.
    1. Select **Apply**.

1. Locate and select an incident.

    The specific incident page shows the Attack story made up of the alert timeline, an Incident graph and the Incident details panel. The Incident graph will show you the OT device and the other IT or IoT devices that it connects with to show the possible vulnerabilities.

1. Choose an alert from the Alerts list and the Incident graph and Incident details panel updates with specific data for this alert.

1. In the Incident panel, scroll through the information, read the **Alert description** and follow the **Alert recommended actions** to remediate the problem.

## Defender for IoT alerts in Defender for Endpoints

Defender for IoT produces its own unique alert. This is described in the table below:

| Name | Description |
|----|----|
| Possible OT device impact due to compromised device | A compromised endpoint device was observed recently communicating with an OT device. An attacker might be trying to cross from an IT to OT device and cause operational impact.  |
