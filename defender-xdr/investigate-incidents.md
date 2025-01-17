---
title: Investigate incidents in the Microsoft Defender portal
description: Investigate incidents on various assets from correlated signals of various Defender services and other Microsoft security products like Microsoft Sentinel.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
ms.topic: conceptual
search.appverid: 
  - MOE150
  - MET150
ms.date: 01/17/2025
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Investigate incidents in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The Microsoft Defender portal presents correlated alerts, assets, investigations, and evidence from across all your assets into an incident to give you a comprehensive look into the entire breadth of an attack.

Within an incident, you analyze the alerts, understand what they mean, and collate the evidence so that you can devise an effective remediation plan.

## Initial investigation

Before diving into the details, take a look at the properties and the entire attack story of the incident.

You can start by selecting the incident from the check mark column. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incidents-ss-incident-select.png" alt-text="Selecting an incident in the Microsoft Defender portal" lightbox="/defender/media/investigate-incidents/incidents-ss-incident-select.png":::

When you do, a summary pane opens with key information about the incident, like the incident's details, recommended actions, and related threats. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-pane-small.png" alt-text="The pane that displays the summary details for an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-pane.png":::

From here, you can select **Open incident page**. This opens the main page for the incident where you'll find the full attack story information and tabs for alerts, devices, users, investigations, and evidence. You can also open the main page for an incident by selecting the incident name from the incident queue.

> [!NOTE]
> Users with provisioned access to Microsoft Security Copilot will see the Copilot pane on the right side of the screen when they open an incident. Copilot provides real-time insights and recommendations to help you investigate and respond to incidents. For more information, see [Microsoft Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md).

## Attack story

Attack stories help you to quickly review, investigate, and remediate attacks while viewing the full story of the attack on the same tab. It also allows you to review the entity details and take remediation actions, such as deleting a file or isolating a device without losing context.

The attack story is briefly described in the following video. 
 > [!VIDEO https://learn-video.azurefd.net/vod/player?id=7004c8ca-43e7-430c-92f5-562c2d240b91]

Within the attack story you can find the alert page and the incident graph.

The incident alert page has these sections:

- Alert story, which includes:

   - What happened
   - Actions taken
   - Related events

- Alert properties in the right pane (state, details, description, and others)

Note that not every alert will have all of the listed subsections in the **Alert story** section.

The graph shows the full scope of the attack, how the attack spread through your network over time, where it started, and how far the attacker went. It connects the different suspicious entities that are part of the attack with their related assets such as users, devices, and mailboxes.

From the graph, you can:

- Play the alerts and the nodes on the graph as they occurred over time to understand the chronology of the attack.
  
  :::image type="content" source="/defender/media/investigate-incidents/play-alert-attack-story.gif" alt-text="Screenshot that shows playing of the alerts and nodes on the attack story graph page.":::

- Open an entity pane, allowing you to review the entity details and act on remediation actions, such as deleting a file or isolating a device.

  :::image type="content" source="/defender/media/investigate-incidents/review-entity-details-attack-story.gif" alt-text="Screenshot that shows the review of the entity details on the attack story graph page.":::

- Highlight the alerts based on the entity to which they are related.

- Hunt for entity information of a device, file, IP address, URL, user, email, mailbox, or cloud resource.

### Go hunt

The ***go hunt*** action takes advantage of the [advanced hunting](advanced-hunting-go-hunt.md) feature to find relevant information about an entity. The *go hunt* query checks relevant schema tables for any events or alerts involving the specific entity you're investigating. You can select any of the options to find relevant information about the entity:

  - See all available queries – the option returns all available queries for the entity type you're investigating.
  - All Activity – the query returns all activities associated with an entity, providing you with a comprehensive view of the incident's context.
  - Related Alerts – the query searches for and returns all security alerts involving a specific entity, ensuring you don't miss any information.

:::image type="content" source="/defender/media/investigate-incidents/fig1-gohunt-attackstory.png" alt-text="Selecting the go hunt option on a device in an attack story" lightbox="/defender/media/investigate-incidents/fig1-gohunt-attackstory.png":::

The resulting logs or alerts can be linked to an incident by selecting a results and then selecting *Link to incident*.

:::image type="content" source="/defender/media/investigate-incidents/fig2-gohunt-attackstory.png" alt-text="Highlighting the link to incident option in go hunt query results" lightbox="/defender/media/investigate-incidents/fig2-gohunt-attackstory.png":::

If the incident or related alerts were the result of an analytics rule you've set, you can also select ***Run query*** to see other related results.

> [!IMPORTANT]
> Some information in this article relates to a prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

### Attack paths

The incident graph also contains information about **attack paths**. These paths allows security analysts to identify what other entities an attacker is likely to target next. To view an attack path, you can click on an entity in the incident graph and select **Show attack paths**. Attack paths are available for entities with the **critical asset** tag.

:::image type="content" source="/defender/media/investigate-incidents/attack-path-small.png" alt-text="Highlighting the Show attack paths action in the incident graph." lightbox="/defender/media/investigate-incidents/attack-path.png":::

Upon selecting **Show attack paths**, a side pane opens, displaying a list of attack paths for the selected entity. The attack paths are displayed in a table format, showing the attack path name, entry point, entry point type, target, target type, the target criticality.

Selecting an attack path from the list displays the attack path graph, which shows the attack path from the entry point to the target. Selecting **View map** opens a new window to view the attack path in full.

:::image type="content" source="/defender/media/investigate-incidents/attack-path-pane-small.png" alt-text="An example of the attack path graph shown in the side pane." lightbox="/defender/media/investigate-incidents/attack-path-pane.png":::

> [!NOTE]
> To view the details of an attack path, you must have read access permissions in the Microsoft Defender portal and the license for [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management). </br></br>
> To view attack path details in the unified security operations platform, a *Sentinel Reader* role is required. To create new attack paths, the Security Administrator role is required.

## Alerts

On the **Alerts** tab, you can view the alert queue for alerts related to the incident and other information about them like the following:

- Severity of the alerts.
- The entities that were involved in the alert.
- The source of the alerts (Microsoft Defender for Identity, Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Defender for Cloud Apps, and the app governance add-on).
- The reason they were linked together.

Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-page-alerts-small.png" alt-text="The Alerts pane for an incident in the Microsoft Defender portal" lightbox="/defender/media/investigate-incidents/incident-page-alerts.png":::

By default, the alerts are ordered chronologically to allow you to see how the attack played out over time. When you select an alert within an incident, Microsoft Defender XDR displays the alert information specific to the context of the overall incident.

You can see the events of the alert, which other triggered alerts caused the current alert, and all the affected entities and activities involved in the attack, including devices, files, users, cloud apps, and mailboxes.

Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-alert-page-small.png" alt-text="The details of an alert within an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-alert-page.png":::

Learn how to use the alert queue and alert pages in [investigate alerts](investigate-alerts.md).

> [!NOTE]
> If you have provisioned access to Microsoft Purview Insider Risk Management, you can view and manage insider risk management alerts and hunt for insider risk management events in the Microsoft Defender portal. For more information, see [Investigate insider risk threats in the Microsoft Defender portal](irm-investigate-alerts-defender.md).

## Assets

Easily view and manage all your assets in one place with the new **Assets** tab. This unified view includes Devices, Users, Mailboxes and Apps. 

The Assets tab displays the total number of assets beside its name. A list of different categories with the number of assets within that category is presented when selecting the Assets tab.

:::image type="content" source="/defender/media/investigate-incidents/incident-assetstab-small.png" alt-text="The Assets page for an incident in the Microsoft Defender portal" lightbox="/defender/media/investigate-incidents/incident-assetstab.png":::

### Devices

The **Devices** view lists all the devices related to the incident. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-devices2.png" alt-text="The Devices page for an incident in the Microsoft Defender portal" lightbox="/defender/media/investigate-incidents/incident-devices2.png":::

Selecting a device from the list opens a bar that allows you to manage the selected device. You can quickly export, manage tags, initiate automated investigation, and more. 

You can select the check mark for a device to see details of the device, directory data, active alerts, and logged on users. Select the name of the device to see device details in the Defender for Endpoint device inventory. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-devicebar.png" alt-text="The Devices options in the Assets page in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-devicebar.png":::

From the device page, you can gather additional information about the device, such as all of its alerts, a timeline, and security recommendations. For example, from the **Timeline** tab, you can scroll through the device timeline and view all events and behaviors observed on the machine in chronological order, interspersed with the alerts raised. 

### Users

The **Users** view lists all the users that have been identified to be part of or related to the incident. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-users2.png" alt-text="The Users page in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-users2.png":::

You can select the check mark for a user to see details of the user account threat, exposure, and contact information. Select the user name to see additional user account details.

Learn how to view additional user information and manage the users of an incident in [investigate users](investigate-users.md).

### Mailboxes

The **Mailboxes** view lists all the mailboxes that have been identified to be part of or related to the incident. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-mailboxes2.png" alt-text="The Mailboxes page for an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-mailboxes2.png":::

You can select the check mark for a mailbox to see a list of active alerts. Select the mailbox name to see additional mailbox details on the Explorer page for Defender for Office 365.

### Apps

The **Apps** view lists all the apps identified to be part of or related to the incident. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-apps.png" alt-text="The Apps page for an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-apps.png":::

You can select the check mark for an app to see a list of active alerts. Select the app name to see additional details on the Explorer page for Defender for Cloud Apps.

### Cloud resources

The **Cloud resources** view lists all the cloud resources identified to be part of or related to the incident. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-assets-cloudresource-small.png" alt-text="The Cloud resources page for an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-assets-cloudresource.png":::

You can select the check mark for a cloud resource to see the resource's details and a list of active alerts. Select *Open cloud resource page* to see additional details and to view its full details in Microsoft Defender for Cloud.

## Investigations

The **Investigations** tab lists all the [automated investigations](m365d-autoir.md) triggered by alerts in this incident. Automated investigations will perform remediation actions or wait for analyst approval of actions, depending on how you configured your automated investigations to run in Defender for Endpoint and Defender for Office 365.

:::image type="content" source="/defender/media/investigate-incidents/incident-investigationspage-small.png" alt-text="The Investigations page for an incident in the Microsoft Defender portal" lightbox="/defender/media/investigate-incidents/incident-investigationspage.png":::

Select an investigation to navigate to its details page for full information on the investigation and remediation status. If there are any actions pending for approval as part of the investigation, they will appear in the **Pending actions** tab. Take action as part of incident remediation.

There is also an **Investigation graph** tab that shows:

- The connection of alerts to the impacted assets in your organization.
- Which entities are related to which alerts and how they are part of the story of the attack.
- The alerts for the incident.

The investigation graph helps you quickly understand the full scope of the attack by connecting the different suspicious entities that are part of the attack with their related assets such as users, devices, and mailboxes.

For more information, see [Automated investigation and response in Microsoft Defender XDR](m365d-autoir.md).

## Evidence and Response

The **Evidence and Response** tab shows all the supported events and suspicious entities in the alerts in the incident. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incidents-evidenceresponse-small.png" alt-text="The Evidence and Response page for an incident in the Microsoft Defender portal" lightbox="/defender/media/investigate-incidents/incidents-evidenceresponse.png":::

Microsoft Defender XDR automatically investigates all the incidents' supported events and suspicious entities in the alerts, providing you with information about the important emails, files, processes, services, IP Addresses, and more. This helps you quickly detect and block potential threats in the incident.

Each of the analyzed entities is marked with a verdict (Malicious, Suspicious, Clean) and a remediation status. This helps you understand the remediation status of the entire incident and what next steps can be taken.

### Approve or reject remediation actions

For incidents with a remediation status of **Pending approval**, you can approve or reject a remediation action, open in Explorer, or Go hunt from within Evidence and Response tab. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/evidence-approve-small.png" alt-text="The Approve\Reject option in the Evidence and Response management pane for an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/evidence-approve.png":::

## Summary

Use the **Summary** page to assess the relative importance of the incident and quickly access the associated alerts and impacted entities. The **Summary** page gives you a snapshot glance at the top things to notice about the incident.

:::image type="content" source="/defender/media/investigate-incidents/incident-summary.png" alt-text="Screenshot that shows the summary information for an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-summary-small.png":::

Information is organized in these sections.

| Section | Description |
|:-------|:-----|
| Alerts and categories | A visual and numeric view of how advanced the attack has progressed against the kill chain. As with other Microsoft security products, Microsoft Defender XDR is aligned to the [MITRE ATT&CK&trade;](https://attack.mitre.org/) framework. The alerts timeline shows the chronological order in which the alerts occurred and for each, their status and name. |
| Scope |  Displays the number of impacted devices, users, and mailboxes and lists the entities in order of risk level and investigation priority. |
| Alerts |  Displays the alerts involved in the incident. |
| Evidence | Displays the number of entities affected by the incident. |
| Incident information | Displays the properties of the incident, such as tags, status, and severity. |

## Similar incidents

Some incidents might have similar incidents listed on the **Similar incidents** page. This section shows incidents that have similar alerts, entities, and other properties. This can help you understand the scope of the attack and identify other incidents that might be related. Here's an example.

:::image type="content" source="/defender/media/investigate-incidents/incident-similartab-small.png" alt-text="Screenshot that shows the Similar incidents tab for an incident in the Microsoft Defender portal." lightbox="/defender/media/investigate-incidents/incident-similartab.png":::

> [!TIP]
> **Defender Boxed**, a series of cards showcasing your organization's security successes, improvements, and response actions in the past six months/year, appears for a limited time during January and July of each year. Learn how you can share your [Defender Boxed](incident-queue.md#defender-boxed) highlights.

## Next steps

As needed:

- [Investigate the alerts of an incident](investigate-alerts.md)
- [Investigate the users of an incident](investigate-users.md)

## See also

- [Incidents overview](incidents-overview.md)
- [Prioritize incidents](incident-queue.md)
- [Manage incidents](manage-incidents.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
