---
title: Investigate a user account in Microsoft Defender for Endpoint
description: Investigate a user account in Microsoft Defender for Endpoint to assess possible credential compromise, review related activity, and pivot to associated investigation data.
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
# Investigate a user account in Microsoft Defender for Endpoint


## Investigate user account entities

Identify user accounts with the most active alerts (displayed on dashboard as "Users at risk") and investigate cases of potential compromised credentials, or pivot on the associated user account when investigating an alert or device to identify possible lateral movement between devices with that user account.

You can find user account information in the following views:

- Dashboard
- Alert queue
- Device details page

In the Dashboard, Alert queue, and Device details page views, a clickable user account link takes you to the user account details page, where you can see more information about the account.

When you investigate a user account entity, you can see:

- User account details, Microsoft Defender for Identity alerts, and logged on devices, role, logon type, and other details
- Overview of the incidents and user's devices
- Alerts related to this user
- Observed in organization (devices logged on to)

:::image type="content" source="media/atp-user-details-view.png" alt-text="The user account entity details page" lightbox="media/atp-user-details-view.png":::

<a name="user-details"></a>
### Review user details

The **User details** pane on left provides information about the user, such as related open incidents, active alerts, Security Account Manager (SAM) name, security identifier (SID), Microsoft Defender for Identity alerts, number of devices the user is logged on to, when the user was first and last seen, role, and logon types. Depending on the integration features you've enabled, you can see other details. For example, if you enable the Skype for business integration, you're able to contact the user from the portal. The **Azure ATP alerts** section contains a link to the user's alerts page in Microsoft Defender for Identity, if you've enabled the Microsoft Defender for Identity feature and there are alerts related to the user. The user's alerts page in Microsoft Defender for Identity provides more information about the alerts.

> [!NOTE]
> You'll need to enable the integration on both Microsoft Defender for Identity and Defender for Endpoint to use this feature. In Defender for Endpoint, you can enable this feature in advanced features. For more information on how to enable advanced features, see [Turn on advanced features](advanced-features.md).

On the user account details page, the Overview, Alerts, and Observed in organization tabs display various attributes for the selected user account.

> [!NOTE]
> For Linux devices, information about logged in users isn't displayed.

> [!NOTE]
> Microsoft Defender for Business doesn't include Microsoft Defender for Identity (MDI) by default. In SMB-based environments, Logon User data won't be available unless MDI sensors (installed on domain controllers to collect identity-related signals) are deployed. To ensure visibility into logon events, customers must deploy MDI sensors.

### Overview

The **Overview** tab shows the incident details and a list of the devices that the user has logged on to. You can expand each device entry to see details of the logon events for that device.

<a name="alerts"></a>
### Review alerts associated with the user account

The **Alerts** tab provides a list of alerts that are associated with the user account. This list is a filtered view of the [Alert queue](alerts-queue.md), and shows alerts where the user context is the selected user account, the date when the last activity was detected, a short description of the alert, the device associated with the alert, the alert's severity, the alert's status in the queue, and who is assigned the alert.

<a name="observed-in-organization"></a>
### User account activity observed in the organization

The **Observed in organization** tab allows you to specify a date range to see a list of devices where the selected user account was observed logged on to, the most frequent and least frequent logged on user account for each of these devices, and total observed users on each device.

Selecting an item on the Observed in organization table expands the item, revealing more details about the device. Directly selecting a device link within an item opens the device details page for that device.

## Search for specific user accounts

To find a specific user account in Microsoft Defender for Endpoint, follow these steps:

1. Select **User** from the **Search bar** drop-down menu.
1. Enter the user account in the **Search** field.
1. Click the search icon or press **Enter**.

A list of users matching the query text is displayed. You can see the user account's domain and name, when the user account was last seen, and the total number of devices it was observed logged on to in the last 30 days.

You can filter the results by the following time periods:

- 1 day
- 3 days
- 7 days
- 30 days
- 6 months

<a name="related-articles"></a>
## Related content

- [View and organize the Microsoft Defender for Endpoint Alerts queue](alerts-queue.md)
- [Manage Microsoft Defender for Endpoint alerts](/defender-xdr/investigate-alerts?toc=/defender-endpoint/toc.json&bc=/defender-endpoint/breadcrumb/toc.json#manage-alerts)
- [Investigate Microsoft Defender for Endpoint alerts](investigate-alerts.md)
- [Investigate a file associated with a Defender for Endpoint alert](investigate-files.md)
- [Investigate devices in the Defender for Endpoint Devices list](investigate-machines.md)
- [Investigate an IP address associated with a Defender for Endpoint alert](investigate-ip.md)
- [Investigate a domain associated with a Defender for Endpoint alert](investigate-domain.md)


