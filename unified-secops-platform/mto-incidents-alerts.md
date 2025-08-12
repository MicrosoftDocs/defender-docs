---
title: View and manage incidents and alerts in Microsoft Defender multitenant management
description: Learn about incidents and alerts in Microsoft Defender multitenant management
search.appverid: met150
ms.service: unified-secops-platform
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - highpri
  - tier1
  - usx-security
ms.topic: how-to
ms.date: 03/20/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
---

# View and manage incidents and alerts in Microsoft Defender multitenant management

Multi-tenant management for Microsoft Defender XDR and Microsoft Sentinel in the Defender portal enables security operation center (SOC) analysts to access and analyze data from multiple tenants and workspaces in one place, allowing them to quickly identify and respond to threats. Triage incidents and alerts across security information and event management (SIEM) and extended detection and response (XDR) data for tenants that onboarded a Microsoft Sentinel workspace to the Defender platform.

Manage incidents & alerts originating from multiple tenants and workspaces under **Incidents & alerts**.

## View and investigate incidents

To view or investigate an incident:

1. Go to the [Incidents page](https://mto.security.microsoft.com/incidents) in Microsoft Defender multitenant management. The **Tenant name** and **Workspaces** columns show which tenant the incident originates from:

   :::image type="content" source="media/mto-incidents-alerts/mto-incidents.png" alt-text="Screenshot of the Microsoft Defender multitenant incidents page." lightbox="media/mto-incidents-alerts/mto-incidents.png":::

1. Select the incident you want to view. A flyout opens with the incident details pane, where you can:

    - Select **Open incident page** to view this incident in a new tab for the specific tenant in the [Microsoft Defender portal](https://security.microsoft.com).
    - Select **Manage incident** to assign the incident, set incident tags, set the incident status, and classify the incident.

To learn more, see [Investigate incidents](/defender-endpoint/investigate-incidents).

## Manage multiple incidents

To manage incidents across multiple tenants and workspaces:

1. Go to the [Incidents page](https://mto.security.microsoft.com/incidents) in Microsoft Defender multitenant management.
2. Choose the incidents you want to manage from the incidents list and select **Manage incidents**.

   :::image type="content" source="media/mto-incidents-alerts/mto-manage-incidents.png" alt-text="Screenshot that highlights the manage incidents option on the incidents page in Microsoft Defender multitenant management." lightbox="media/mto-incidents-alerts/mto-manage-incidents.png":::

On the incidents flyout pane you can assign incidents, assign incidents tags, set the incident status, and classify multiple incidents for multiple tenants simultaneously.

>[!Note]
> Currently, you can only assign multiple incidents from same tenant.

To learn more about incidents in the Microsoft Defender portal, see [Manage incidents](/defender-endpoint/manage-incidents).

## View and investigate alerts

To view or investigate an alert:

1. Go to the [Alerts page](https://mto.security.microsoft.com/alerts) in multitenant management and select the alert you want to view. A flyout panel opens with the alert details page:

   :::image type="content" source="media/mto-incidents-alerts/mto-alerts-details.png" alt-text="Screenshot of alert details page for an alert in Microsoft Defender multitenant management." lightbox="media/mto-incidents-alerts/mto-alerts-details.png":::

1. From the alert details pane you can:

    - Select actions such as **Open alerts page**, **Move alert to another incident**, and **Tune alert** to view this alert in a new tab for the specific tenant in the [Microsoft Defender portal](https://security.microsoft.com).
    - Select **Manage alert** to assign the alert, set the alert status, and classify the alert.

To learn more, see [Investigate alerts](/defender-endpoint/investigate-alerts).

## Manage multiple alerts

To manage alerts across multiple tenants and workspaces:

1. Go to the [Alerts page](https://mto.security.microsoft.com/alerts) in Microsoft Defender multitenant management.
1. Choose the alerts you want to manage from the alerts list and select **Manage alerts**.

   :::image type="content" source="media/mto-incidents-alerts/mto-manage-alerts.png" alt-text="Screenshot that highlights the manage alerts option for selected alerts in Microsoft Defender multitenant management." lightbox="media/mto-incidents-alerts/mto-manage-alerts.png":::

Use the **Manage alerts** pane to set alert status, assign alerts, set classifications, and add comments for multiple alerts simultaneously. While alert status, classifications, and comments can be added across tenants, assigning alerts can only be done for alerts from the same tenant.

For more information, see [Manage alerts](/defender-xdr/investigate-alerts#manage-alerts).

## Move alerts

Move an alert to a different incident to help you better organize and correlate related security events. For example, you might find that multiple alerts are part of the same security breach, and want to include them all in the same incident. This ensures that all relevant information is grouped together, enabling more efficient investigation and response.

To move one or more alerts:

- On the **Alerts** page, select one or more alerts and then select **Move alerts**
- On an alert details pane or alert details page, select **Move alert to another incident**

In the **Move alert to another incident** pane, define whether you want to create a new incident, or use an existing incident. If you choose to use an existing incident, search for the incident by name or ID and add a reason for the change. In all cases, add a comment describing your change before you select **Save**.

## Related content

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
- [Connect Microsoft Sentinel to Microsoft Defender XDR](microsoft-sentinel-onboard.md)
- [Advanced hunting in Microsoft Defender multitenant management](mto-advanced-hunting.md)
- [Multiple Microsoft Sentinel workspaces in the Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2310579)