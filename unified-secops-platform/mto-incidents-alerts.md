---
title: View and manage incidents and alerts in Microsoft Defender multitenant management
description: View, triage, and manage incidents and alerts across multiple tenants and Microsoft Sentinel workspaces in Microsoft Defender multitenant management.
author: guywi-ms
ms.author: guywild
ms.collection: 
  - m365-security
  - highpri
  - tier1
  - usx-security
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---

# View and manage incidents and alerts in Microsoft Defender multitenant management

Multitenant management in the Defender portal brings together data from multiple tenants and Microsoft Sentinel workspaces in one place. Security operations center (SOC) analysts can use it to quickly find and respond to threats across Microsoft Defender XDR and Microsoft Sentinel. You can triage incidents and alerts that span SIEM and XDR data for any tenant with a Microsoft Sentinel workspace onboarded to the Defender platform.

This article shows you how to view, investigate, and manage incidents and alerts from multiple tenants and workspaces by using the **Incidents & alerts** pages.

## View and investigate incidents

To view or investigate an incident:

1. Go to the [Incidents page](https://mto.security.microsoft.com/incidents) in Microsoft Defender multitenant management. The **Tenant name** and **Workspaces** columns show which tenant the incident originates from:

   :::image type="content" source="media/mto-incidents-alerts/mto-incidents.png" alt-text="Screenshot of the Microsoft Defender multitenant incidents page." lightbox="media/mto-incidents-alerts/mto-incidents.png":::

1. Select the incident you want to view. A flyout opens with the incident details pane, where you can:

    - Select **Open incident page** to open the incident in a new tab for that tenant in the [Microsoft Defender portal](https://security.microsoft.com).
    - Select **Manage incident** to assign, tag, classify, or change the status of the incident.

To learn more, see [Investigate incidents](/defender-endpoint/investigate-incidents).

## Manage multiple incidents

> [!Note]
> Currently, you can only assign multiple incidents from same tenant.

To manage incidents across multiple tenants and workspaces:

1. Go to the [Incidents page](https://mto.security.microsoft.com/incidents) in Microsoft Defender multitenant management.
2. Choose the incidents you want to manage from the incidents list and select **Manage incidents**.

   :::image type="content" source="media/mto-incidents-alerts/mto-manage-incidents.png" alt-text="Screenshot that highlights the manage incidents option on the incidents page in Microsoft Defender multitenant management." lightbox="media/mto-incidents-alerts/mto-manage-incidents.png":::

On the flyout pane, you can assign, tag, classify, or change the status of incidents across multiple tenants at once.

To learn more about incidents in the Microsoft Defender portal, see [Manage incidents](/defender-endpoint/manage-incidents).

## View and investigate alerts

To view or investigate an alert:

1. Go to the [Alerts page](https://mto.security.microsoft.com/alerts) in multitenant management and select the alert you want to view. A flyout panel opens with the alert details page:

   :::image type="content" source="media/mto-incidents-alerts/mto-alerts-details.png" alt-text="Screenshot of alert details page for an alert in Microsoft Defender multitenant management." lightbox="media/mto-incidents-alerts/mto-alerts-details.png":::

1. From the alert details pane you can:

    - Select **Open alerts page**, **Move alert to another incident**, or **Tune alert** to open the alert in a new tab for that tenant in the [Microsoft Defender portal](https://security.microsoft.com).
    - Select **Manage alert** to assign, classify, or change the status of the alert.

To learn more, see [Investigate alerts](/defender-endpoint/investigate-alerts).

## Manage multiple alerts

To manage alerts across multiple tenants and workspaces:

1. Go to the [Alerts page](https://mto.security.microsoft.com/alerts) in Microsoft Defender multitenant management.
1. Choose the alerts you want to manage from the alerts list and select **Manage alerts**.

   :::image type="content" source="media/mto-incidents-alerts/mto-manage-alerts.png" alt-text="Screenshot that highlights the manage alerts option for selected alerts in Microsoft Defender multitenant management." lightbox="media/mto-incidents-alerts/mto-manage-alerts.png":::

Use the **Manage alerts** pane to set the status, assign, classify, and add comments for multiple alerts at once. You can set status, classifications, and comments across tenants. However, you can only assign alerts from the same tenant.

For more information, see [Manage alerts](/defender-xdr/investigate-alerts#manage-alerts).

## Move alerts

Move an alert to a different incident to help you better organize and correlate related security events. For example, you might find that multiple alerts are part of the same security breach, and want to include them all in the same incident. Grouping related alerts into the same incident ensures that all relevant information is grouped together, enabling more efficient investigation and response.

To move one or more alerts:

- On the **Alerts** page, select one or more alerts and then select **Move alerts**
- On an alert details pane or alert details page, select **Move alert to another incident**

In the **Move alert to another incident** pane, define whether you want to create a new incident, or use an existing incident. If you choose to use an existing incident, search for the incident by name or ID and add a reason for the change. In all cases, add a comment describing your change before you select **Save**.

## Related content

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
- [Connect Microsoft Sentinel to Microsoft Defender XDR](microsoft-sentinel-onboard.md)
- [Advanced hunting in Microsoft Defender multitenant management](mto-advanced-hunting.md)
- [Multiple Microsoft Sentinel workspaces in the Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2310579)