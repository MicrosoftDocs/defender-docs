---
title: Investigate assets
description: This article explains how to investigate suspicious users, computers, and devices with Microsoft Defender for Identity.
ms.date: 01/17/2024
ms.topic: how-to
---

# Investigate assets

Microsoft Defender for Identity provides Microsoft Defender XDR users with evidence of when users, computers, and devices have performed suspicious activities or show signs of being compromised.

This article gives recommendations for how to determine risks to your organization, decide how to remediate, and determine the best way to prevent similar attacks in the future.

## Investigation steps for suspicious users

> [!NOTE]
> For information on how to view user profiles in Microsoft Defender XDR, see [Microsoft Defender XDR documentation](/microsoft-365/security/defender/investigate-users).

If an alert or incident indicates that a user may be suspicious or compromised, check and investigate the user profile for the following details and activities:

- **User identity**
    - Is the user a [sensitive user](entity-tags.md) (such as admin, or on a watchlist, etc.)?
    - What is their role within the organization?
    - Are they significant in the organizational tree?

- **Investigate suspicious activities, such as:**
    - Does the user have other opened alerts in Defender for Identity, or in other security tools such as Microsoft Defender for Endpoint, Microsoft Defender for Cloud and/or Microsoft Defender for Cloud Apps?
    - Did the user have failed sign-ins?
    - Which resources did the user access?
    - Did the user access high value resources?
    - Was the user supposed to access the resources they accessed?
    - Which devices did the user sign in to?
    - Was the user supposed to sign in to those devices?
    - Is there a [lateral movement path](/defender-for-identity/understand-lateral-movement-paths) (LMP) between the user and a sensitive user?

Use the answers to these questions to determine if the account appears compromised or if the suspicious activities imply malicious actions.

Find identity information in the following Microsoft Defender XDR areas:

- Individual identity details pages
- Individual alert or incident details page
- Device details pages
- Advanced hunting queries
- The **Action center** page

For example, the following image shows the details on an identity details page:

:::image type="content" source="media/investigate-assets/identity-details.png" alt-text="Screenshot of an identity details page." lightbox="media/investigate-assets/identity-details.png":::

### Identity details

When you investigate a specific identity, you'll see the following details on an identity details page:


|Identity details page area  |Description  |
|---------|---------|
|[Overview tab](/microsoft-365/security/defender/investigate-users#overview)       | General identity data, such as the Microsoft Entra identity risk level, the number of devices the user is signed in to, when the user was first and last seen, the user's accounts and more important information.  <br><br>Use the **Overview** tab to also view graphs for incidents and alerts, the investigation priority score, an organizational tree, entity tags, and a scored activity timeline.       |
|[Incidents and alerts](/microsoft-365/security/defender/investigate-users#incidents-and-alerts)     | Lists active incidents and alerts involving the user from the last 180 days, including details like alert severity and the time the alert was generated. |
|[Observed in organization](/microsoft-365/security/defender/investigate-users#observed-in-organization)     |   Includes the following sub-areas: <br>- **Devices**: The devices that the identity signed in to, including most and least used in the last 180 days. <br>- **Locations**: The identity's observed locations over the last 30 days. <br>- **Groups**: All observed on-premises groups for the identity. <br> - **Lateral movement paths** - all profiled lateral movement paths from the on-premises environment. |
|[Identity timeline](/microsoft-365/security/defender/investigate-users#timeline)     | The timeline represents activities and alerts observed from a user's identity from the last 180 days, unifying identity entries across Microsoft Defender for Identity, Microsoft Defender for Cloud Apps, and Microsoft Defender for Endpoint. <br><br>Use the timeline to focus on activities a user performed or were performed on them in specific timeframes. Select the default **30 days** to change the time range to another built-in value, or to a custom range.       |
|[Remediation actions](/microsoft-365/security/defender/investigate-users#remediation-actions)      |     Respond to compromised users by disabling their accounts or resetting their password. After taking action on users, you can check on the activity details in the Microsoft Defender XDR **Action center.|

For more information, see [Investigate users](/microsoft-365/security/defender/investigate-users) in the Microsoft Defender XDR documentation.

## Investigation steps for suspicious groups

If an alert or incident investigation is related to an Active Directory group, check the group entity for the following details and activities:

- **Group entity**
    - Is the group a [sensitive group](entity-tags.md), such as *Domain Admins*?
    - Does the group include sensitive users?

- **Investigate suspicious activities, such as:**
    - Does the group have other opened, related alerts in Defender for Identity, or in other security tools such as Microsoft Defender for Endpoint, Microsoft Defender for Cloud and/or Microsoft Defender for Cloud Apps?
    - What users were recently added to or removed from the group?
    - Was the group recently queried, and by whom?

Use the answers to these questions to help in your investigation.

From a group entity details pane, select **Go hunt** or **Open timeline** to investigate. You can also find group information in the following Microsoft Defender XDR areas:

- Individual alert or incident details page
- Device or user details pages
- Advanced hunting queries

For example, the following image shows the **Server Operators** activity timeline, including related alerts and activities from the last 180 days:

:::image type="content" source="media/investigate-assets/group-timeline.png" alt-text="Screenshot of the group Timeline tab." lightbox="media/investigate-assets/group-timeline.png":::

## Investigation steps for suspicious devices

Microsoft Defender XDR alert lists all devices and users connected to each suspicious activity. Select a device to view the device details page, and then investigate for the following details and activities:


- **What happened around the time of the suspicious activity?**  
    - Which user was signed in to the device?
    - Does that user normally sign into or access the source or destination device?
    - Which resources were accessed? By which users? If resources were accessed, were they high-value resources?
    - Was the user supposed to access those resources?
    - Did the user that accessed the device perform other suspicious activities?

- **More suspicious activities to investigate**:
    - Were other alerts opened around the same time as this alert in Defender for Identity, or in other security tools such as Microsoft Defender for Endpoint, Microsoft Defender for Cloud and/or Microsoft Defender for Cloud Apps?
    - Were there failed sign-ins?
    - Were any new programs deployed or installed?

Use the answers to these questions to determine if the device appears compromised or if the suspicious activities imply malicious actions.

For example, the following image shows a device details page:

:::image type="content" source="media/investigate-assets/device-details.png" alt-text="Screenshot of a device details page." lightbox="media/investigate-assets/device-details.png":::

For more information, see [Investigate devices](/microsoft-365/security/defender-endpoint/investigate-machines) in the Microsoft Defender XDR documentation.


## Next steps

- [Investigate Lateral Movement Paths (LMPs)](understand-lateral-movement-paths.md)
- [Investigate users in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-users)
- [Investigate incidents in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-incidents)

> [!TIP]
> Try our interactive guide: [Investigate and respond to attacks with Microsoft Defender for Identity](https://mslearn.cloudguides.com/guides/Investigate%20and%20respond%20to%20attacks%20with%20Microsoft%20Defender%20for%20Identity)
> 
