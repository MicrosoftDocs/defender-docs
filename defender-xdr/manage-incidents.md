---
title: Manage incidents in Microsoft Defender
description: Learn how to assign, update the status,
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: yelevin
author: yelevin
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
  - m365-security
  - usx-security
  - tier1
  - sentinel-only
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/18/2024
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Manage incidents in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Incident management is critical to ensuring that incidents are named, assigned, and tagged to optimize time in your incident workflow and more quickly contain and address threats.

Manage your incidents from **Investigation & response > Incidents & alerts > Incidents** on the quick launch of the Microsoft Defender portal ([security.microsoft.com](https://security.microsoft.com)). Here's an example.

:::image type="content" source="./media/manage-incidents/incidents-queue.png" alt-text="Screenshot showing the incident queue and quick launch pane in the Microsoft Defender portal." lightbox="./media/manage-incidents/incidents-queue.png":::

This article shows you how to perform various incident management tasks associated with different stages in an incident's lifecycle.

**[Incident triage:](#incident-triage)**

- [Assign the incident to an owner](#assign-an-incident-to-an-owner).
- [Assign or change severity](#assign-or-change-incident-severity).
- [Add incident tags](#add-incident-tags).
- [Change the incident status](#change-the-incident-status).

**[Incident investigation and resolution:](#incident-investigation-and-resolution)**

- [Resolve an incident](#resolve-an-incident).
- [Specify an incident's classification](#specify-the-incidents-classification).
- [Add comments to an incident](#add-comments-to-an-incident).

**[Incident logging and reporting:](#incident-logging-and-reporting)**

- [Edit the incident name](#edit-the-incident-name).
- Assess the activity audit and add comments in the [Activity log](#view-the-activity-log-of-an-incident).
- [Export incident data to PDF](#export-incident-data-to-pdf).

> [!TIP]
> **Defender Boxed**, a series of cards showcasing your organization's security successes, improvements, and response actions in the past six months/year, appears for a limited time during January and July of each year. Learn how you can share your [Defender Boxed](incident-queue.md#defender-boxed) highlights.

## Access the *Manage incident* pane

Most of these tasks are accessible from the **Manage incident** pane for an incident. You can reach this pane from any of several locations.

### From the incident queue

1. Select **Investigation & response > Incidents & alerts > Incidents** on the quick launch of the Microsoft Defender portal.

1. From the incident queue, access the **Manage incident** pane in one of two ways:

    - Select the check box of an incident, and select **Manage incidents** from the toolbar above the filters. Manage many incidents at once by selecting multiple check boxes.
    - Select the row of an incident (without selecting the incident name), so that the incident details pane appears, and select **Manage incident** from the incident details pane.

        :::image type="content" source="./media/manage-incidents/manage-incidents-from-queue.png" alt-text="Screenshot showing how to manage incidents from the incidents queue in the Microsoft Defender portal." lightbox="./media/manage-incidents/select-manage-incident.png":::

### From the incident page

1. Select **Investigation & response > Incidents & alerts > Incidents** on the quick launch of the Microsoft Defender portal.

1. Select the name of an incident from the queue. Or, select the row of an incident in the queue and then select **Open incident page** from the incident details pane.

1. From the incident page, select **Manage incident** from the top panel.

    If **Manage incident** isn't visible, select the three dots in the upper right corner (visible in the following screenshot next to "Manage incident"), and select it from the menu that appears.

    :::image type="content" source="./media/manage-incidents/select-manage-incident.png" alt-text="Screenshot showing how to manage an incident from the incident page in the Microsoft Defender portal." lightbox="./media/manage-incidents/select-manage-incident.png":::

## Incident triage

The following management tasks are closely associated with incident triage, though they can be performed at any time.

- [Assign the incident to an owner](#assign-an-incident-to-an-owner).
- [Assign or change severity](#assign-or-change-incident-severity).
- [Add incident tags](#add-incident-tags).
- [Change the incident status](#change-the-incident-status).

### Assign an incident to an owner

By default, new incidents are created with no owner. Ideally, your SecOps team should have mechanisms and procedures in place to automatically assign incidents to owners. You might need to reassign an incident in the case of escalation or mistaken original assignment.

#### Assign an owner

To manually assign a new owner to an incident, take the following steps:

1. Follow the instructions in the opening section to [Access the *Manage incident* pane](#access-the-manage-incident-pane).

1. Select the **Assign to** box. A drop-down list of suggested assignees appears.

1. If you see the user or group account you want to assign the incident to, select it.

   Otherwise, begin typing the name or account ID of the desired user or group in the text box at the top of the list. The list is dynamically updated, filtered by what you type. When you see the user or group you want, select it.

1. To remove an existing assignment, including any you just added, select the **X** next to the account name. Then, select the **Assign to** box if you want to add another assignment.

   Only one user or group account can be assigned to an incident.

1. Select **Save**.

Assigning ownership of an incident assigns the same ownership to all the alerts associated with it.

   :::image type="content" source="./media/manage-incidents/assign-incident.png" alt-text="Screenshot showing how to assign an owner in the Manage incident pane in the Microsoft Defender portal.":::

#### View incidents assigned to a particular owner

To see the list of incidents assigned to a particular user or group, filter the incident queue:

1. From the incident queue, select the **Incident assignment** filter. A drop-down list of suggested assignees appears.

    If you don't see **Incident assignment** among the filters, select **Add filter**, select **Incident assignment** from the drop-down list, and select **Add**.

1. If you see the user account whose assigned incidents you want to display, select it.

   Otherwise, begin typing the name or account ID of the desired user or group in the text box at the top of the list. The list is dynamically updated, filtered by what you type. When you see the user or group you want, select it.

   Unlike assigning incidents, here you can select more than one assignee to filter the list by. To add another user or group account to the filter, select the text box (next to the existing account in the filter), and the list of suggested assignees appears again.

1. Select **Apply**.

   :::image type="content" source="./media/manage-incidents/assignment-filter.png" alt-text="Screenshot showing how to view incidents assigned to an owner in the incident queue page in the Microsoft Defender portal.":::

To save a link to the incident queue with the current filters applied, select **Copy list link** from the toolbar on the incident queue page. Create a shortcut in your favorites or on your desktop and paste the link into it.

### Assign or change incident severity

The severity of an incident is determined by the highest severity of the alerts associated with it. The severity of an incident can be set to *high*, *medium*, *low*, or *informational*.

To manually assign or change the severity of an incident, take the following steps:

1. Follow the instructions in the opening section to [Access the *Manage incident* pane](#access-the-manage-incident-pane).

1. Select the severity value you want to apply from the **Severity** drop-down on the **Manage incident** pane.

1. Select **Save**.

### Add incident tags

Custom tags add information to lend context to an incident. For example, a tag can label a group of incidents with a common characteristic. Tags are a criteria for filtering, so you can later filter the incident queue for all incidents that contain a specific tag. To apply a tag to an incident:

1. Follow the instructions in the opening section to [Access the *Manage incident* pane](#access-the-manage-incident-pane).

1. In the **Incident tags** field, begin typing the name of the tag you want to apply. As you type, a list of previously used and selected tags appears. If you see the tag you want to apply in the list, select it. 

    :::image type="content" source="media/manage-incidents/create-incident-tag.png" alt-text="Screenshot showing how to create an incident tag in the Manage incidents pane.":::

    If you typed a tag name that hasn't been used before, select the last entry in the list, which is the text you typed followed by "(Create new)."

    :::image type="content" source="media/manage-incidents/select-tag.png" alt-text="Screenshot showing how to select a tag to apply to an incident in the Manage incidents pane.":::

    The tag then appears as a label inside the Incident tags field. Repeat this step to add more tags as you like.

    :::image type="content" source="media/manage-incidents/selected-tag.png" alt-text="Screenshot showing how a selected tag appears in the Incident tags field.":::

1. Select **Save**.

An incident can have system tags and/or custom tags with certain color backgrounds. Custom tags use the white background while system tags typically use red or black background colors. System tags identify the following in an incident:

- A **type of attack**, like credential phishing or BEC fraud
- **Automatic actions**, like automatic investigation and response and automatic attack disruption
- **Defender Experts** handling an incident
- **Critical assets** involved in the incident

> [!TIP]
> Microsoft's Security Exposure Management, based on predefined classifications, automatically tags devices, identities, and cloud resources as a **critical asset**. This out-of-the-box capability ensures the protection of an organization's valuable and most important assets. It also helps security operations teams to prioritize investigation and remediation. Know more about [critical asset management](/security-exposure-management/critical-asset-management).

### Change the incident status

Incidents begin life with a status of **Active**. When you're working on an incident, change the **Status** to **In progress**.

## Incident investigation and resolution

The following management tasks are closely associated with incident investigation and resolution, though they can be performed at any time.

- [Resolve an incident](#resolve-an-incident).
- [Specify an incident's classification](#specify-the-incidents-classification).
- [Add comments to an incident](#add-comments-to-an-incident).

### Resolve an incident

When an incident is remediated and resolved, take the following actions to record the resolution:

1. Follow the instructions in the opening section to [Access the *Manage incident* pane](#access-the-manage-incident-pane).

1. Change the status. Select **Resolved** from the **Status** drop-down list. When you change an incident's status to **Resolved**, a new field is displayed immediately following the **Status** field.

1. Enter a note in this field that explains why you consider the incident resolved. This note is visible in the activity log of the incident, near the entry recording the incident's resolution.

    :::image type="content" source="media/manage-incidents/resolve-incidents.png" alt-text="Screenshot of incident management panel with incident resolution note.":::

    The resolution note is also visible in the *Incident details* panel on both the incidents queue page and the incident page of a resolved incident.

    :::image type="content" source="media/manage-incidents/resolution-note-in-side-panel.png" alt-text="Screenshot of appearance of resolution note in the incident details panel." lightbox="media/manage-incidents/resolution-note-in-side-panel.png":::

1. Select **Save**.

Resolving an incident also resolves all the linked and active alerts related to the incident. An incident that isn't resolved displays as **Active**.

### Specify the incident's classification

When you resolve an incident, or at any point in an incident's investigation, as soon as you become aware of how the incident should be classified, set the **Classification** field accordingly.

1. Follow the instructions in the opening section to [Access the *Manage incident* pane](#access-the-manage-incident-pane).

1. Choose the appropriate value from the **Classification** drop-down list:

    - **Not set** (the default).
    - **True positive** with a type of threat. Use this classification for incidents that accurately indicate a real threat. Specifying the threat type helps your security team see threat patterns and act to defend your organization from them.
    - **Informational, expected activity** with a type of activity. Use the options in this category to classify incidents for security tests, red team activity, and expected unusual behavior from trusted apps and users.
    - **False positive** for types of incidents that you determine can be ignored because they're technically inaccurate or misleading.

    See the available types of activities and threats for each of these classifications in the following screenshot.

1. Select **Save**.

    :::image type="content" source="media/manage-incidents/incident-classification.png" alt-text="Screenshot showing the classification options for incidents.":::

Classifying incidents and specifying their status and type helps tune Microsoft Defender to provide better detection determination over time.

### Add comments to an incident

Over the course of investigating and incident, add comments to record your activities, insights, and conclusions.

1. Open the incident's activity log. From the incident page, or from the incident details panel on the incident queue page, select the three dots in the upper right corner, and from the resulting menu, select **Activity log**.

    :::image type="content" source="media/manage-incidents/activity-log.png" alt-text="Screenshot showing how to access an incident's activity log." lightbox="media/manage-incidents/activity-log.png":::

1. Type your comment in the text field. The comment field supports text and formatting, links, and images. Each comment is limited to 30,000 characters.

    :::image type="content" source="media/manage-incidents/add-comments.png" alt-text="Screenshot showing how to add a comment to an incident.":::

1. Select **Save**.

All comments are added to the historical events of the incident. You can see the comments and history of an incident from the **Comments and history** link on the **Summary** page.

## Incident logging and reporting

The following management tasks can be associated with auditing and reporting on incident investigations, though they can be performed at any time.

- [Edit the incident name](#edit-the-incident-name).
- Assess the activity audit and add comments in the [Activity log](#view-the-activity-log-of-an-incident).
- [Export incident data to PDF](#export-incident-data-to-pdf).

### Edit the incident name

Microsoft Defender automatically assigns a name based on alert attributes such as the number of endpoints affected, users affected, detection sources or categories. The incident name allows you to quickly understand the scope of the incident. For example: *Multi-stage incident on multiple endpoints reported by multiple sources.*

To edit the incident name, take the following steps:

1. Follow the instructions in the opening section to [Access the *Manage incident* pane](#access-the-manage-incident-pane).

1. Type a new name in the **Incident name** field on the **Manage incident** pane.

1. Select **Save**.

> [!NOTE]
>
> - Incidents that existed before the rollout of the automatic incident naming feature retain their names.
>
> - If another incident is merged into a renamed incident, Defender gives the incident a new name, overwriting any custom name you gave it beforehand.

### View the activity log of an incident

When doing a postmortem of an incident, view the incident's **Activity log** to see the history of actions performed on the incident (called "Audits") and any comments recorded. All changes made to the incident, whether by a user or by the system, are recorded in the activity log. 

1. Open the incident's activity log. From the incident page, or from the incident details panel on the incident queue page, select the three dots in the upper right corner, and from the resulting menu, select **Activity log**.

    :::image type="content" source="media/manage-incidents/activity-log.png" alt-text="Screenshot highlighting the activity log option from the incident page in the Microsoft Defender portal." lightbox="media/manage-incidents/activity-log.png":::

1. Filter the activities within the log by comments and actions. Select **Content: Audits, Comments** then select the content type to filter activities. Here's an example.

    :::image type="content" source="media/manage-incidents/filter-activity-log.png" alt-text="Screenshot highlighting the filter options within the activity log pane from the incident page in the Microsoft Defender portal." lightbox="media/manage-incidents/filter-activity-log.png":::

1. Select **Apply**.

You can also [add your own comments](#add-comments-to-an-incident) using the comment box available within the activity log. The comment box accepts text and formatting, links, and images.

> [!IMPORTANT]
> Some information in this article relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

## Export incident data to PDF

You can export an incident's data to PDF through the **Export incident as PDF** function and save it into PDF format. This function allows security teams to review an incident's details offline at any given time.

The incident data exported includes the following information:

- An overview containing the incident details
- The [attack story](investigate-incidents.md#attack-story) graph and threat categories
- The impacted [assets](investigate-incidents.md#assets), covering up to 10 assets for each asset type
- The [evidence list](investigate-incidents.md#evidence-and-response) covering up to 100 items
- Supporting data, including all [related alerts](investigate-incidents.md#alerts) and activities recorded in the [activity log](#view-the-activity-log-of-an-incident)

Here's an example of the exported PDF:

:::image type="content" source="media/manage-incidents/export-results-small.png" alt-text="Screenshot of the exported PDF's first page." lightbox="media/manage-incidents/export-results.png":::

If you have the [Copilot for Security](/security-copilot/microsoft-security-copilot) license, the exported PDF contains the following additional incident data:

- [Incident summary](security-copilot-m365d-incident-summary.md)
- [Incident report](security-copilot-m365d-create-incident-report.md)

The export to PDF function is also available in the Copilot side panel. When you select the **More actions** ellipsis (...) on the upper right corner of the incident report results card, you can choose **Export incident as PDF**.

   :::image type="content" source="media/manage-incidents/export-incident-more-actions1.png" alt-text="Screenshot of additional actions in the incident report results card.":::

To generate the PDF, perform the following steps:

1. Open an incident page. Select the **More actions** ellipsis (...) on the upper right corner and choose **Export incident as PDF**.

   :::image type="content" source="media/manage-incidents/export-ellipsis-small.png" alt-text="Screenshot highlighting the More actions ellipsis on the incident page." lightbox="media/manage-incidents/export-ellipsis.png":::

1. In the dialog box that appears next, confirm the incident information that you want to include or exclude in the PDF. All incident information is selected by default. Select **Export PDF** to proceed.

   :::image type="content" source="media/manage-incidents/export-options.png" alt-text="Screenshot highlighting the export incident to PDF option.":::

1. A status message indicating the current state of the download appears below the incident title. The export process may take a few minutes depending on the incident's complexity and the amount of data to be exported.

   :::image type="content" source="media/manage-incidents/export-prepare-small.png" alt-text="Screenshot highlighting export message and status before download." lightbox="media/manage-incidents/export-prepare.png":::

1. Another dialog box appears indicating that the PDF is ready. Select **Download** from the dialog box to save the PDF to your device. The status message below the incident title also updates to indicate that the download is available.

   :::image type="content" source="media/manage-incidents/export-download-small.png" alt-text="Screenshot highlighting export message and status when download is available." lightbox="media/manage-incidents/export-download.png":::

The report is cached for a couple of minutes. The system provides the previously generated PDF if you try to export the same incident again within a short time frame. To generate a newer version of the PDF, wait for a few minutes for the cache to expire.

## Next steps

For new and in-process incidents, continue your [incident investigation](investigate-incidents.md).

For resolved incidents, perform a [post-incident review](respond-first-incident-remediate.md).

## See also

- [Incidents overview](incidents-overview.md)
- [Prioritize incidents](incident-queue.md)
- [Investigate incidents](investigate-incidents.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
