---
title: Investigate assets
description: This article explains how to investigate suspicious users, computers, and devices with Microsoft Defender for Identity.
ms.date: 07/01/2025
ms.topic: how-to
ms.reviewer: LiorShapiraa
---

# Investigate assets

Microsoft Defender for Identity gives Microsoft Defender XDR users evidence when users, computers, and devices show signs of suspicious activities or compromise.

This article gives recommendations for how to determine risks to your organization, decide how to remediate, and determine the best way to prevent similar attacks in the future.

## Investigation steps for suspicious users

> [!NOTE]
> For information on how to view user profiles in Microsoft Defender XDR, see [Microsoft Defender XDR documentation](/microsoft-365/security/defender/investigate-users).

If an alert or incident indicates that a user might be suspicious or compromised, check and investigate the user profile for the following details and activities:

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

:::image type="content" source="media/investigate-assets/investigate-assets.png" alt-text="Screenshot that shows a specific user's page in the Microsoft Defender portal." lightbox="media/investigate-assets/investigate-assets.png":::


### Identity details

When you investigate a specific identity, you'll see the following details on an identity details page:


|Identity details page area  |Description  |
|---------|---------|
|[Overview tab](/microsoft-365/security/defender/investigate-users#overview)       | Use the **Overview** tab to view graphs for incidents and alerts, an organizational tree, and entity tags. <br> General identity data includes: <br> - Microsoft Entra identity risk level <br> - The number of devices the identity is signed in to <br> - When the identity was first and last seen <br> - The identity's accounts and more important information.  <br><br>      |
|[Incidents and alerts](/microsoft-365/security/defender/investigate-users#incidents-and-alerts)     | Lists active incidents and alerts involving the user from the last 180 days, including details like alert severity and the time the alert was generated. |
|[Observed in organization](/microsoft-365/security/defender/investigate-users#observed-in-organization)     |   Includes the following sub-areas: <br>- **Devices**: The devices that the identity signed in to, including most and least used in the last 180 days. <br>- **Locations**: The identity's observed locations over the last 30 days. <br>- **Groups**: All observed on-premises groups for the identity. <br> - **Lateral movement paths** - all profiled lateral movement paths from the on-premises environment. <br> - **Accounts** View all accounts linked to a specific identity. |
|[Identity timeline](/microsoft-365/security/defender/investigate-users#timeline)     | The timeline represents activities and alerts observed from a user's identity within the last 180 days, to help unify identity entries across Microsoft Defender for Identity, Microsoft Defender for Cloud Apps, and Microsoft Defender for Endpoint. <br><br> You can use the timeline to focus on activities a user performed or were performed on them in specific timeframes. Select the default **30 days** to change the time range to another built-in value, or to a custom range.       |
|Security recommendations|This tab displays all active security posture assessments (ISPMs) associated with an identity account. It includes Defender for Identity recommendations across available identity providers such as Active Directory, Okta, and others. Selecting an ISPM pivots you to the recommendation page in Microsoft Secure Score for additional details.|
|Attack paths|This tab provides visibility into potential attack paths leading to a critical identity or involving it within the path, helping assess security risks. For more information, see Overview of attack path within Exposure Management.|
|[Remediation actions](/microsoft-365/security/defender/investigate-users#remediation-actions)      |Respond to compromised users by disabling their accounts or resetting their password. After taking action on users, you can check on the activity details in the Microsoft Defender XDR **Action center.|


> [!NOTE]
> **Investigation Priority Score** was deprecated on December 3, 2024. As a result, the Investigation Priority Score breakdown and the scored activity timeline cards are no longer available.



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
