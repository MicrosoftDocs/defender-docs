---
title: Prioritize incidents in the Microsoft Defender portal
description: Learn how to prioritize and filter incidents in the Microsoft Defender portal to improve your organization's security response. Discover actionable steps to manage incidents effectively.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - usx-security
  - tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: concept-article
ms.date: 10/26/2025
appliesto: 
- Microsoft Defender XDR 
- Microsoft Sentinel in the Microsoft Defender portal
---

# Prioritize incidents in the Microsoft Defender portal

The Microsoft Defender portal applies correlation analytics and aggregates related alerts and automated investigations from different products into an incident. Microsoft Sentinel and Defender XDR also trigger unique alerts on activities that can only be identified as malicious given the end-to-end visibility in the unified platform across the entire suite of products. This view gives your security analysts the broader attack story, which helps them better understand and deal with complex threats across your organization.

[!INCLUDE [unified-soc-preview](../includes/unified-soc-preview.md)]

## Incident queue

The **Incident queue** shows a queue of incidents that were created across devices, users, mailboxes, and other resources. It helps you triage the incidents, prioritize and create an informed cybersecurity response decision.

Find the incident queue at **Incidents & alerts > Incidents** on the quick launch of the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>.

Select **Most recent incidents and alerts** to toggle a timeline chart of the number of alerts received and incidents created in the last 24 hours.

:::image type="content" source="./media/incidents-queue/most-recent-incidents.png" alt-text="Screenshot of 24-hour incident graph." lightbox="./media/incidents-queue/most-recent-incidents.png":::

The incident queue includes Defender Queue Assistant that helps security teams cut through the large number of incidents and focus on the incidents that matter most. Using a machine learning prioritization algorithm, the Queue Assistant surfaces the highest-priority incidents, explains the reasoning behind the prioritization, and provides intuitive tools for sorting and filtering the incident queue. The algorithm runs for all alerts,  Microsoft native alerts, custom detections, or third-party signals. The algorithm is trained on real-world anonymized data and considers, among other things, the following data points when calculating the priority score:
+ Attack disruption signals
+ Threat analytics
+ Severity
+ SnR
+ MITRE techniques
+ Asset criticality
+	Alert types and rarity
+	High profile threats such as ransomware and nation-state attacks.

Incidents are automatically assigned a priority score from 0 to 100, with 100 being the highest priority. Score ranges are color-coded as follows:
+	Red: Top priority (score > 85)
+	Orange: Medium priority (15–85)
+	Gray: Low priority (<15)

:::image type="content" source="./media/incidents-queue/incidents-page.png" alt-text="Screenshot of the Incidents queue in the Microsoft Defender portal." lightbox="./media/incidents-queue/incidents-page.png":::

Select the incident row anywhere except the incident name, to display a summary pane with key information about the incident. The pane includes the priority assessment, the factors influencing the priority score, the incident's details, recommended actions, and related threats.  Use the up and down arrows at the top of the pane to navigate to the previous or next incident in the incident queue.  For more information on investigating the incident, see [Investigate incidents](investigate-incidents.md).

:::image type="content" source="./media/investigate-incidents/incident-side-panel.png" alt-text="Selecting an incident in the Microsoft Defender portal" lightbox="./media/investigate-incidents/incident-side-panel.png":::

By default, the incident queue show incidents created in the last week. Choose a different time frame by selecting time selector drop-down above the queue. 

:::image type="content" source="./media/incidents-queue/time-selector.png" alt-text="Screenshot of the time selector for the incident queue." lightbox="./media/incidents-queue/time-selector.png":::


The **total number of incidents** in the queue is displayed next to the time selector. The number of incidents varies depending on the filters in use. You can search for incidents by name or incident ID

Select **Customize columns** to select columns displayed in the queue. Check or uncheck the columns you want to see in the incident queue. Arrange the order of the columns by dragging them up and down.

:::image type="content" source="./media/incidents-queue/incident-toolbar.png" alt-text="Screenshot of Incident page filter and column controls." lightbox="./media/incidents-queue/incident-toolbar.png":::

The **Export** button allows you to export the filtered data in the incident queue to a CSV file. The maximum number of records you can export to a CSV file is 10,000.

### Incident names

For more visibility at a glance, Microsoft Defender XDR generates incident names automatically, based on alert attributes such as the number of endpoints affected, users affected, detection sources, or categories. This specific naming allows you to quickly understand the scope of the incident.

For example: *Multi-stage incident on multiple endpoints reported by multiple sources.*

If you onboarded Microsoft Sentinel to the Defender portal, then any alerts and incidents coming from Microsoft Sentinel are likely to have their names changed (regardless of whether they were created before or since the onboarding).

We recommend that you avoid using the incident name as a condition for triggering [automation rules](/azure/sentinel/automate-incident-handling-with-automation-rules). If the incident name is a condition, and the incident name changes, the rule will not be triggered.


## Filters <a name="available-filters"></a>

The incident queue also provides multiple filtering options, that when applied, enable you to perform a broad sweep of all existing incidents in your environment, or decide to focus on a specific scenario or threat. Applying filters on the incident queue can help determine which incident requires immediate attention.

:::image type="content" source="./media/incidents-queue/incidents-filter-bar.png" alt-text="The incident queue filters list." lightbox="./media/incidents-queue/incidents-filter-bar.png":::

The **Filters** list above the incident queue shows the current filters currently applied to the queue. Select **Add filter**  to apply more filters to limit the set of incidents shown. 

:::image type="content" source="./media/incidents-queue/incident-filters-small.png" alt-text="The Filters pane for the incident queue in the Microsoft Defender portal." lightbox="./media/incidents-queue/incident-filters.png":::

Select the filters you want to use, then select **Add**. The selected filters are shown along with the existing applied filters. Select the new filter to specify its conditions. For example, if you chose the "Service/detection sources" filter, select it to choose the sources by which to filter the list.

You can remove a filter by selecting the **X** on the  filter name in the filters list.

The following table lists the available filters.

| Filter name | Description/Conditions |
|:-------|:-----|
| **Status** | Select **New**, **In progress**, or **Resolved**. |
| **Alert severity<br>Incident severity** | The severity of an alert or incident is indicative of the impact it can have on your assets. The higher the severity, the bigger the impact and typically requires the most immediate attention. Select **High**, **Medium**, **Low**, or **Informational**. |
| **Incident assignment** | Select the assigned user or users. |
| **Multiple service sources**  | Specify whether the filter is for more than one service source. |
| **Service/detection sources**  | Specify incidents that contain alerts from one or more of the following:<li>Microsoft Defender for Identity<li>Microsoft Defender for Cloud Apps<li>Microsoft Defender for Endpoint<li>Microsoft Defender XDR<li>Microsoft Defender for Office 365<li>App Governance<li>Microsoft Entra ID Protection<li>Microsoft Data Loss Prevention<li>Microsoft Defender for Cloud<li>Microsoft Sentinel<li>Microsoft Purview Insider Risk Management<br><br>Many of these services can be expanded in the menu to reveal further choices of detection sources within a given service. |
| **Tags** | Select one or multiple tag names from the list. |
| **Multiple category**  | Specify whether the filter is for more than one category. |
| **Categories** | Choose categories to focus on specific tactics, techniques, or attack components seen. |
| **Entities** | Specify the name of an asset such as a user, device, mailbox, or application name. |
| **Sensitivity label** | Filter incidents based on the sensitivity label applied on the data. Some attacks focus on exfiltrating sensitive or valuable data. By applying a filter for specific sensitivity labels, you can quickly determine if sensitive information is potentially compromised and prioritize addressing those incidents. |
| **Device groups** | Specify a [device group](/windows/security/threat-protection/microsoft-defender-atp/machine-groups) name. |
| **OS platform** | Specify device operating systems. |
| **Classification** | Specify the set of classifications of the related alerts. |
| **Automated investigation state** | Specify the status of automated investigation.  |
| **Associated threat** | Specify a named threat.  |
| **Policy/policy rule** | Filter incidents based on policy or policy rule.  |
| **Product names** | Filter incidents based on product name.  |
| **Data stream** | Filter incidents based on the location or workload.  |

> [!NOTE]
> If you have provisioned access to Microsoft Purview Insider Risk Management, you can view and manage insider risk management alerts and hunt for insider risk management events in the Microsoft Defender portal. For more information, see [Investigate insider risk threats in the Microsoft Defender portal](irm-investigate-alerts-defender.md).

The default filter is to show all alerts and incidents with a status of **New** and **In progress** and with a severity of **High**, **Medium**, or **Low**.



You can also create filter sets within the incidents page by selecting **Saved filter queries > Create filter set**. If no filter sets have been created, select **Save** to create one.

:::image type="content" source="./media/incidents-queue/fig2-newfilters.png" alt-text="The create filter sets option for the incident queue in the Microsoft Defender portal." lightbox="./media/incidents-queue/fig2-newfilters.png":::

> [!NOTE]
> Microsoft Defender XDR customers can now filter incidents with alerts where a compromised device communicated with operational technology (OT) devices connected to the enterprise network through the [device discovery integration of Microsoft Defender for IoT and Microsoft Defender for Endpoint](/defender-endpoint/device-discovery#device-discovery-integration). To filter these incidents, select **Any** in the Service/detection sources, then select **Microsoft Defender for IoT** in the Product name or see [Investigate incidents and alerts in Microsoft Defender for IoT in the Defender portal](/defender-for-iot/investigate-threats/). You can also use device groups to filter for site-specific alerts. For more information about Defender for IoT prerequisites, see [Get started with enterprise IoT monitoring in Microsoft Defender XDR](/azure/defender-for-iot/organizations/eiot-defender-for-endpoint/).

### Save custom filters as URLs

Once you've configured a useful filter in the incidents queue, you can bookmark the URL of the browser tab or otherwise save it as a link on a Web page, a Word document, or a place of your choice. Bookmarking gives you single-click access to key views of the incident queue, such as:

- New incidents
- High-severity incidents
- Unassigned incidents
- High-severity, unassigned incidents
- Incidents assigned to me
- Incidents assigned to me and for Microsoft Defender for Endpoint
- Incidents with a specific tag or tags
- Incidents with a specific threat category
- Incidents with a specific associated threat
- Incidents with a specific actor

Once you have compiled and stored your list of useful filter views as URLs, use it to quickly process and prioritize the incidents in your queue and [manage](manage-incidents.md) them for subsequent assignment and analysis.

## Search

From the **Search for name or ID** box above the list of incidents, you can search for incidents in a number of ways, to quickly find what you're looking for.

### Search by incident name or ID

Search directly for an incident by typing the incident ID or the incident name. When you select an incident from the list of search results, the Microsoft Defender portal opens a new tab with the properties of the incident, from which you can start your [investigation](investigate-incidents.md).

### Search by impacted assets

You can name an asset&mdash;such as a user, device, mailbox, application name, or cloud resource&mdash;and find all the incidents related to that asset.

## Specify a time range

The default list of incidents is for those that occurred in the last six months. You can specify a new time range from the drop-down box next to the calendar icon by selecting:

- One day
- Three days
- One week
- 30 days
- 30 days
- Six months
- A custom range in which you can specify both dates and times

## Next steps

After you've determined which incident requires the highest priority, select it and:

- [Manage](manage-incidents.md) the properties of the incident for tags, assignment, immediate resolution for false positive incidents, and comments.
- Begin your [investigations](investigate-incidents.md).

### Defender Boxed

For a limited time during January and July of each year, **Defender Boxed** automatically appears when you first open the incident queue. Defender Boxed highlights your organization's security success, improvements, and response actions during the previous six months or calendar year.

:::image type="content" source="media/incident-queue/defender-boxed-recording.gif" alt-text="Defender Boxed as shown in the incident queue.":::

> [!NOTE]
> Defender Boxed is only available to users who performed applicable activities in the Microsoft Defender portal.

You can do the following actions in the series of cards that appear in Defender Boxed:

- Download a detailed summary of your achievements that can be shared with others in your organization.

  :::image type="content" source="media/incident-queue/defender-boxed-summary-small.png" alt-text="Screenshot of Defender Boxed slide with the download summary option highlighted." lightbox="media/incident-queue/defender-boxed-summary.png":::

- Change the frequency of how often Defender Boxed will appear. You can choose between once (every January) or twice (every January and July) per year.

  :::image type="content" source="media/incident-queue/defender-boxed-frequency-small.png" alt-text="Screenshot of Defender Boxed slide with the frequency highlighted." lightbox="media/incident-queue/defender-boxed-frequency.png":::

- Share your achievement to your social media networks, email, and other forums by saving the slide as an image.

  :::image type="content" source="media/incident-queue/defender-boxed-save-small.png" alt-text="Screenshot of Defender Boxed slide with the save option highlighted." lightbox="media/incident-queue/defender-boxed-save.png":::

To reopen Defender Boxed, go to the Incidents queue and then select **Your Defender Boxed** on the right side of the pane.

:::image type="content" source="media/incident-queue/defender-boxed-incident-small.png" alt-text="Screenshot of the Defender Boxed option highlighted in the Incidents page." lightbox="media/incident-queue/defender-boxed-incident.png":::

## See also

- [Incidents overview](incidents-overview.md)
- [Manage incidents](manage-incidents.md)
- [Investigate incidents](investigate-incidents.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
