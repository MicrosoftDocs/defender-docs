---
title: Audit Microsoft Defender for IoT user activity
description: Learn how to track and audit user activity across Microsoft Defender for IoT.
ms.date: 07/03/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Audit user activity

After you've set up user access in the [Azure portal](manage-users-portal.md) and on your [OT network sensors](manage-users-sensor.md), you can track and audit user activity across Microsoft Defender for IoT.

## Audit Azure user activity

Use Microsoft Entra user auditing resources to audit Azure user activity across Defender for IoT. For more information, see:

- [Audit logs in Microsoft Entra ID](/azure/active-directory/reports-monitoring/concept-audit-logs)
- [Microsoft Entra audit activity reference](/azure/active-directory/reports-monitoring/reference-audit-activities)

## Audit user activity on an OT network sensor

Audit and track user activity on a sensor's **Event timeline**. The **Event timeline** displays events that occurred on the sensor, affected devices for each event, and the time and date that the event occurred.

### Prerequisites

You must be a default, privileged *admin* user or have an **Admin** role on the sensor.

**To use the sensor's Event Timeline**:

1. Sign into the sensor console as the default, privileged *admin* users or any user with an **Admin** role.

1. On the sensor, select **Event Timeline** from the left-hand menu. Make sure that the filter is set to show **User Operations**.

    For example:

    :::image type="content" source="media/manage-users-sensor/track-user-activity.png" alt-text="Screenshot of the Event Timeline on the sensor showing user activity.":::

1. Use additional filters or search using **CTRL+F** to find the information of interest to you.

    For more information on the event timeline, see [Track network and sensor activity with the event timeline](how-to-track-sensor-activity.md)

## Next steps

For more information, see:

- [Microsoft Defender for IoT user management](manage-users-overview.md)
- [Azure user roles and permissions for Defender for IoT](roles-azure.md)
- [On-premises users and roles for OT monitoring with Defender for IoT](roles-on-premises.md)
- [Create and manage users on an OT network sensor](manage-users-sensor.md)
