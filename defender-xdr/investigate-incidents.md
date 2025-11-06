---
title: Investigate incidents in the Microsoft Defender portal
description: Investigate incidents on various assets from correlated signals of various Defender services and other Microsoft security products like Microsoft Sentinel.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: edbaynash
author: EdB-MSFT
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
ms.topic: article
search.appverid: 
  - MOE150
  - MET150
ms.date: 09/21/2025
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

:::image type="content" source="./media/investigate-incidents/incidents-ss-incident-select.png" alt-text="Selecting an incident in the Microsoft Defender portal" lightbox="./media/investigate-incidents/incidents-ss-incident-select.png":::

When you do, a summary pane opens with key information about the incident, like the incident's details, recommended actions, and related threats. Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-pane-small.png" alt-text="The pane that displays the summary details for an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-pane.png":::

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
  
  :::image type="content" source="./media/investigate-incidents/play-alert-attack-story.gif" alt-text="Screenshot that shows playing of the alerts and nodes on the attack story graph page.":::

- Open an entity pane, allowing you to review the entity details and act on remediation actions, such as deleting a file or isolating a device.

  :::image type="content" source="./media/investigate-incidents/review-entity-details-attack-story.gif" alt-text="Screenshot that shows the review of the entity details on the attack story graph page.":::

- Highlight the alerts based on the entity to which they are related.

- Hunt for entity information of a device, file, IP address, URL, user, email, mailbox, or cloud resource.

### Go hunt

The ***go hunt*** action takes advantage of the [advanced hunting](advanced-hunting-go-hunt.md) feature to find relevant information about an entity. The *go hunt* query checks relevant schema tables for any events or alerts involving the specific entity you're investigating. You can select any of the options to find relevant information about the entity:

  - See all available queries – the option returns all available queries for the entity type you're investigating.
  - All Activity – the query returns all activities associated with an entity, providing you with a comprehensive view of the incident's context.
  - Related Alerts – the query searches for and returns all security alerts involving a specific entity, ensuring you don't miss any information.
  - All User anomalies (Preview) – the query returns all anomalies associated with the user, helping you identify unusual behavior that might be relevant to the incident. Available only for user entities if you have enabled [Microsoft Sentinel User and Entity Behavior Analytics (UEBA)](/azure/sentinel/identify-threats-with-entity-behavior-analytics).

:::image type="content" source="./media/investigate-incidents/gohunt-attackstory.png" alt-text="Selecting the go hunt option on a device in an attack story" lightbox="./media/investigate-incidents/gohunt-attackstory.png":::

The resulting logs or alerts can be linked to an incident by selecting a results and then selecting *Link to incident*.

:::image type="content" source="./media/investigate-incidents/fig2-gohunt-attackstory.png" alt-text="Highlighting the link to incident option in go hunt query results" lightbox="./media/investigate-incidents/fig2-gohunt-attackstory.png":::

If the incident or related alerts were the result of an analytics rule you've set, you can also select ***Run query*** to see other related results.

> [!IMPORTANT]
> Some information in this article relates to a prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

### Blast radius analysis

Blast radius analysis is an advanced graph visualization integrated into incident investigation experience. Built on the Microsoft Sentinel data lake and graph infrastructure, it generates an interactive graph showing possible propagation paths from the selected node to predefined critical targets scoped to the user’s permissions.

> [!NOTE]
> Blast radius analysis extends and replaces Attack path analysis. 

The blast radius graph provides a unique unified view of both prebreach and post-breach information on the incident page. During an incident investigation, analysts can see the current impact of a breach and the possible future impact in one consolidated graph. Because it's integrated into the incident graph, the blast radius graph helps security teams better understand the scope of the security incident quicker and enhance their defensive measures to reduce the likelihood of widespread damage. Blast radius analysis helps analysts better assess the risk to highly regarded targets, and understand the business impact.

The following prerequisites are required to use the blast radius graph:
+	You must be onboarded to Microsoft Sentinel data lake. For more information, see [Onboarding to Microsoft Sentinel data lake and graph](/azure/sentinel/datalake/sentinel-lake-onboarding).
+	Exposure management (read) permission or higher. For more information, see [Manage permissions with Microsoft Defender XDR Unified role-based access control (RBAC)](/security-exposure-management/prerequisites#manage-permissions-with-microsoft-defender-xdr-unified-role-based-access-control-rbac).
> [!IMPORTANT]
> Attack paths and blast radius features are calculated based on the organization’s available environment data. The value in the graph increases as more data is available for its calculation. If no further workloads are enabled or critical assets aren't fully defined,blast radius graphs won't fully represent your environmental risks. For more information on defining critical assets, see [Review and classify critical assets](/security-exposure-management/classify-critical-assets).

The following table summarizes the blast radius analysis use cases for different user roles:

|User role| Use case|
|---|---|
|Security analyst| Use blast radius analysis to investigate an incident. Instantly see the compromised component at the center of the graph and the paths to potentially compromised targets. The graph provides an intuitive visual understanding of the incident and helps you quickly learn the potential scope of a breach. Based on the target and paths, you can escalate, and trigger actions to disrupt, isolate, and contain the incident on nodes along the paths to the target.|
|IT administrators and SOC engineers| Use blast radius analysis to mobilize resource based on business impact and potential damage estimation.  Engineers can prioritize the most critical vulnerabilities that require immediate attention. The engineer can proactively allocate the required resources based on the blast radius reach to critical targets in the organization by examining multiple nodes marked with vulnerabilities on the map. The engineer can clearly communicate what was protected and what was impacted and plan and prioritize additional defenses and network segmentations required to reduce further impact of future potential attacks.|
|Incident response team| Quickly determine the scope of incident, with a dynamic visual incident map enabling them to take targeted action on the systems indicated on the graph.|
|CISO or security leaders| Use the blast radius feature to indicate current status, set goals and metrics indicators, and use this to report and audit for compliance reasons. The feature can be used to track progress of defending actions and protection measures investments.|

#### View blast radius graphs

After selecting an incident from the list in the **Incidents** page, a graph view is displayed showing the entities and assets involved in the incident.

Select a node to open the context menu, then select **View blast radius**.  To view the blast radius of a single node in a group, use the **ungroup** toggle above the grid to present all nodes.

:::image type="content" source="./media/investigate-incidents/blast-radius.png" lightbox="./media/investigate-incidents/blast-radius.png" alt-text="Screenshot showing the blast radius context menu item." :::

A new graph view loads showing the 8 top-rated attack paths. A full list of the paths is visible on the right side panel when selecting **View full blast radius list** above the graph. From the list of reachable targets, you can further explore the path by selecting one of the listed targets. The right panel shows the potential path from the entry point to this target.  Some nodes may not have paths associated with them.

:::image type="content" source="./media/investigate-incidents/blast-radius-graph.png" lightbox="./media/investigate-incidents/blast-radius-graph.png" alt-text="Screenshot showing the blast radius graph." :::

For an explanation of the icons used for nodes and edges in the blast radius graph, see [Understanding graphs and visualizations in Microsoft Defender](understand-graph-icons.md).


Select **View blast radius list** to see a list of target assets.  Select a target asset from the list to view its details and potential attack paths. Selecting the badges in connections shows more details about the connection.

When paths lead to grouped targets of the same types, to view discrete paths to targets, select the grouped icons. A right-side panel opens showing all the targets in the group. Selecting the check box on the left and selecting the **Expand** button on top displays each target and its paths separately.

:::image type="content" source="./media/investigate-incidents/blast-radius-list.png" lightbox="./media/investigate-incidents/blast-radius-list.png" alt-text="Screenshot showing the blast radius list." :::

Hide the blast radius graph and return to the original incident graph by selecting the node and choosing **Hide blast radius**.

#### Limitations

The following limitations apply to the blast radius graph:

- **Path length limitations (scope of analysis):** Blast radius graph length calculations are bounded up to 7 hops from the source node. The blast radius is an approximation of the full attack reach. The maximum number of hops depends on the environment:
    - 5 hops for cloud
    - 5 hops for on-premises
    - 3 hops for hybrid

- **Data freshness:** Latencies may exist between a change in the organization's environment and the reflection of that change in the blast radius graph. During this time, the model might be incomplete.
- **Possible paths:** The blast radius graph shows possible paths. It doesn't guarantee that an attacker would take every path shown.
- **Known attack vectors:** The graph relies on known attack vectors. If attackers find a new lateral movement or new technique that has yet to be modeled, it won't be shown in the blast radius graph.
- **User scopes:** The graph displayed is based on the allowed scopes for the viewing user. Only nodes and edges that are scoped for the user based on the defined RBAC and scoping settings are visible on the graph. Paths containing out of scope nodes or edges aren't visible.
- **Island nodes:** Nonconnected nodes may appear on the graph due to changes that may occur between the time the data is collected and the calculation of the blast radius.
 


### Incident details

You can view an incident's details on the right pane of an incident page. The incident details include incident assignment, ID, classification, categories, and first and last activity date and time. It also includes a description of the incident, impacted assets, active alerts, and where applicable, the related threats, recommendations, and disruption summary and impact. Here's an example of the incident details where the incident description is highlighted.

:::image type="content" source="./media/investigate-incidents/incident-desc-small.png" alt-text="An example of incident details where the description is highlighted." lightbox="./media/investigate-incidents/incident-desc.png":::

The incident description provides a brief overview of the incident. In some cases, the first alert in the incident is used as the incident description. In this case, the description is only shown in the portal and not stored in the activity log, advanced hunting tables, or the Microsoft Sentinel in Azure portal.

> [!TIP]
> Microsoft Sentinel customers can also view and overwrite the same incident description in the Azure portal by setting the incident description through API or automation.

## Alerts

On the **Alerts** tab, you can view the alert queue for alerts related to the incident and other information about them like the following:

- Severity of the alerts.
- The entities that were involved in the alert.
- The source of the alerts (Microsoft Defender for Identity, Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Defender for Cloud Apps, and the app governance add-on).
- The reason they were linked together.

Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-page-alerts-small.png" alt-text="The Alerts pane for an incident in the Microsoft Defender portal" lightbox="./media/investigate-incidents/incident-page-alerts.png":::

By default, the alerts are ordered chronologically to allow you to see how the attack played out over time. When you select an alert within an incident, Microsoft Defender XDR displays the alert information specific to the context of the overall incident.

You can see the events of the alert, which other triggered alerts caused the current alert, and all the affected entities and activities involved in the attack, including devices, files, users, cloud apps, and mailboxes.

Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-alert-page-small.png" alt-text="The details of an alert within an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-alert-page.png":::

Learn how to use the alert queue and alert pages in [investigate alerts](investigate-alerts.md).

> [!NOTE]
> If you have provisioned access to Microsoft Purview Insider Risk Management, you can view and manage insider risk management alerts and hunt for insider risk management events in the Microsoft Defender portal. For more information, see [Investigate insider risk threats in the Microsoft Defender portal](irm-investigate-alerts-defender.md).

## Assets

Easily view and manage all your assets in one place with the new **Assets** tab. This unified view includes Devices, Users, Mailboxes and Apps. 

The Assets tab displays the total number of assets beside its name. A list of different categories with the number of assets within that category is presented when selecting the Assets tab.

:::image type="content" source="./media/investigate-incidents/incident-assetstab-small.png" alt-text="The Assets page for an incident in the Microsoft Defender portal" lightbox="./media/investigate-incidents/incident-assetstab.png":::

### Devices

The **Devices** view lists all the devices related to the incident. Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-devices2.png" alt-text="The Devices page for an incident in the Microsoft Defender portal" lightbox="./media/investigate-incidents/incident-devices2.png":::

Selecting a device from the list opens a bar that allows you to manage the selected device. You can quickly export, manage tags, initiate automated investigation, and more. 

You can select the check mark for a device to see details of the device, directory data, active alerts, and logged on users. Select the name of the device to see device details in the Defender for Endpoint device inventory. Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-devicebar.png" alt-text="The Devices options in the Assets page in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-devicebar.png":::

From the device page, you can gather additional information about the device, such as all of its alerts, a timeline, and security recommendations. For example, from the **Timeline** tab, you can scroll through the device timeline and view all events and behaviors observed on the machine in chronological order, interspersed with the alerts raised. 

### Users

The **Users** view lists all the users that have been identified to be part of or related to the incident. Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-users2.png" alt-text="The Users page in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-users2.png":::

You can select the check mark for a user to see details of the user account threat, exposure, and contact information. Select the user name to see additional user account details.

Learn how to view additional user information and manage the users of an incident in [investigate users](investigate-users.md).

### Mailboxes

The **Mailboxes** view lists all the mailboxes that have been identified to be part of or related to the incident. Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-mailboxes2.png" alt-text="The Mailboxes page for an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-mailboxes2.png":::

You can select the check mark for a mailbox to see a list of active alerts. Select the mailbox name to see additional mailbox details on the Explorer page for Defender for Office 365.

### Apps

The **Apps** view lists all the apps identified to be part of or related to the incident. Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-apps.png" alt-text="The Apps page for an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-apps.png":::

You can select the check mark for an app to see a list of active alerts. Select the app name to see additional details on the Explorer page for Defender for Cloud Apps.

### Cloud resources

The **Cloud resources** view lists all the cloud resources identified to be part of or related to the incident. Here's an example.

:::image type="content" source="./media/investigate-incidents/incident-assets-cloudresource-small.png" alt-text="The Cloud resources page for an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-assets-cloudresource.png":::

You can select the check mark for a cloud resource to see the resource's details and a list of active alerts. Select *Open cloud resource page* to see additional details and to view its full details in Microsoft Defender for Cloud.

## Investigations

The **Investigations** tab lists all the [automated investigations](m365d-autoir.md) triggered by alerts in this incident. Automated investigations will perform remediation actions or wait for analyst approval of actions, depending on how you configured your automated investigations to run in Defender for Endpoint and Defender for Office 365.

:::image type="content" source="./media/investigate-incidents/incident-investigationspage-small.png" alt-text="The Investigations page for an incident in the Microsoft Defender portal" lightbox="./media/investigate-incidents/incident-investigationspage.png":::

Select an investigation to navigate to its details page for full information on the investigation and remediation status. If there are any actions pending for approval as part of the investigation, they will appear in the **Pending actions** tab. Take action as part of incident remediation.

There is also an **Investigation graph** tab that shows:

- The connection of alerts to the impacted assets in your organization.
- Which entities are related to which alerts and how they are part of the story of the attack.
- The alerts for the incident.

The investigation graph helps you quickly understand the full scope of the attack by connecting the different suspicious entities that are part of the attack with their related assets such as users, devices, and mailboxes.

For more information, see [Automated investigation and response in Microsoft Defender XDR](m365d-autoir.md).

## Evidence and Response

The **Evidence and Response** tab shows all the supported events and suspicious entities in the alerts in the incident. Here's an example.

:::image type="content" source="./media/investigate-incidents/incidents-evidenceresponse-small.png" alt-text="The Evidence and Response page for an incident in the Microsoft Defender portal" lightbox="./media/investigate-incidents/incidents-evidenceresponse.png":::

Microsoft Defender XDR automatically investigates all the incidents' supported events and suspicious entities in the alerts, providing you with information about the important emails, files, processes, services, IP Addresses, and more. This helps you quickly detect and block potential threats in the incident.

Each of the analyzed entities is marked with a verdict (Malicious, Suspicious, Clean) and a remediation status. This helps you understand the remediation status of the entire incident and what next steps can be taken.

### Approve or reject remediation actions

For incidents with a remediation status of **Pending approval**, you can approve or reject a remediation action, open in Explorer, or Go hunt from within Evidence and Response tab. Here's an example.

:::image type="content" source="./media/investigate-incidents/evidence-approve-small.png" alt-text="The Approve\Reject option in the Evidence and Response management pane for an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/evidence-approve.png":::

## Summary

Use the **Summary** page to assess the relative importance of the incident and quickly access the associated alerts and impacted entities. The **Summary** page gives you a snapshot glance at the top things to notice about the incident.

:::image type="content" source="./media/investigate-incidents/incident-summary.png" alt-text="Screenshot that shows the summary information for an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-summary-small.png":::

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

:::image type="content" source="./media/investigate-incidents/incident-similartab-small.png" alt-text="Screenshot that shows the Similar incidents tab for an incident in the Microsoft Defender portal." lightbox="./media/investigate-incidents/incident-similartab.png":::

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
