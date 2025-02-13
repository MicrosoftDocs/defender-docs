---
title: View and manage incidents and alerts in Microsoft Defender multitenant management
description: Learn about incidents and alerts in Microsoft Defender multitenant management
search.appverid: met150
ms.service: defender-xdr
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
ms.topic: conceptual
ms.date: 08/19/2024
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
---

# View and manage incidents and alerts in Microsoft Defender multitenant management

Multitenant management for Microsoft Defender XDR and the Microsoft unified security operations platform enables security operation center (SOC) analysts to access and analyze data from multiple tenants in one place, allowing them to quickly identify and respond to threats. Triage incidents and alerts across security information and event management (SIEM) and extended detection and response (XDR) data for tenants that onboarded a Microsoft Sentinel workspace to the unified security operations platform.

Manage incidents & alerts originating from multiple tenants under **Incidents & alerts**.

## View and investigate incidents

To view or investigate an incident: 

1. Go to the [Incidents page](https://mto.security.microsoft.com/incidents) in Microsoft Defender multitenant management. The **Tenant name** column shows which tenant the incident originates from:

   :::image type="content" source="/defender/media/defender/mto-incidents.png" alt-text="Screenshot of the Microsoft Defender multitenant incidents page." lightbox="/defender/media/defender/mto-incidents.png":::

2. Select the incident you want to view. A flyout panel opens with the incident details page:

   :::image type="content" source="/defender/media/defender/mto-incident-details.png" alt-text="Screenshot of the Microsoft Defender multitenant incidents details page." lightbox="/defender/media/defender/mto-incident-details.png":::

3. From the incident details page you can:

- Select **Open incident page** to view this incident in a new tab for the specific tenant in the [Microsoft Defender portal](https://security.microsoft.com).
- Select **Manage incident** to assign the incident, set incident tags, set the incident status, and classify the incident.

To learn more, see [Investigate incidents](/defender-endpoint/investigate-incidents).

## Manage multiple incidents

To manage incidents across multiple tenants:

1. Go to the [Incidents page](https://mto.security.microsoft.com/incidents) in Microsoft Defender multitenant management.
2. Choose the incidents you want to manage from the incidents list and select **Manage incidents**.

   :::image type="content" source="/defender/media/defender/mto-manage-incidents.png" alt-text="Screenshot that highlights the manage incidents option on the incidents page in Microsoft Defender multitenant management." lightbox="/defender/media/defender/mto-manage-incidents.png":::

On the incidents fly-out you can assign incidents, assign incidents tags, set the incident status, and classify multiple incidents for multiple tenants simultaneously.

>[!Note]
> Currently, you can only assign multiple incidents from same tenant.

To learn more about incidents in the Microsoft Defender portal, see [Manage incidents](/defender-endpoint/manage-incidents).

## View and investigate alerts

To view or investigate an alert:

1. Go to the [Alerts page](https://mto.security.microsoft.com/alerts) in multitenant management and select the alert you want to view. A flyout panel opens with the alert details page:

   :::image type="content" source="/defender/media/defender/mto-alerts-details.png" alt-text="Screenshot of alert details page for an alert in Microsoft Defender multitenant management." lightbox="/defender/media/defender/mto-alerts-details.png":::

2. From the alert details page you can:

- Select actions such as **Open alerts page**, **See in timeline**, and **Tune alert** to view this alert in a new tab for the specific tenant in the [Microsoft Defender portal](https://security.microsoft.com).
- Select **Manage alert** to assign the alert, set the alert status, and classify the alert.

To learn more, see [Investigate alerts](/defender-endpoint/investigate-alerts).

## Manage multiple alerts

To manage alerts across multiple tenants:

1. Go to the [Alerts page](https://mto.security.microsoft.com/alerts) in Microsoft Defender multitenant management.
2. Choose the alerts you want to manage from the alerts list and select **Manage alerts**.

   :::image type="content" source="/defender/media/defender/mto-manage-alerts.png" alt-text="Screenshot that highlights the manage alerts option for selected alerts in Microsoft Defender multitenant management." lightbox="/defender/media/defender/mto-manage-alerts.png":::

On the alert fly-out you can assign alerts, set the alert status, and classify the alerts for multiple tenants simultaneously.

> [!Note]
> Currently, you can only assign multiple alerts from same tenant.
To learn more about alerts in the Microsoft Defender portal, see [Manage alerts](/defender-endpoint/manage-alerts).

## Related content

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
- [Connect Microsoft Sentinel to Microsoft Defender XDR](/unified-secops-platform/microsoft-sentinel-onboard)
- [Advanced hunting in Microsoft Defender multitenant management](mto-advanced-hunting.md)

