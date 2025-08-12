---
title: Manage security operations cases natively in the Microsoft Defender portal
description: Learn about the case management capabilities in the Defender portal for managing and standardizing unified security operations.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: yelevin
author: yelevin
ms.localizationpriority: medium
ms.date: 05/04/2025
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: concept-article

# customer intent: As a business decision maker for a security operations center, I want to learn about the case management tools available in the Microsoft Defender portal so I can unify security tickets and increase visibility across hybrid, multitenant, and multicloud environments, and disrupt attacks on identities, endpoints, email, cloud apps, and data in real time.
---

# Manage security operations cases natively in the Microsoft Defender portal

Microsoft Defender case management is a collection of features and capabilities delivering a unified, security-focused case management experience. This experience is designed for managing unified security operations work natively in the Microsoft Defender portal, without the need for third-party tools. Security operations teams maintain security context, work more efficiently, and respond faster to attacks when they manage case work without leaving the Defender portal.

The current, introductory phase of the case management rollout centralizes rich collaboration, customization, evidence collection, and reporting across SecOps workloads.

<a name="what-is-case-management-preview"></a>

## What is case management?

Case management enables you to manage SecOps cases natively in the Defender portal. Even in its initial stages, SecOps teams are demonstrating the following use cases for case management:

- Responding to security events that span multiple incidents.

- Managing threat hunting.

- Tracking IoCs and threat actors.

- Tracking detection logic that needs tuning.

The following specific capabilities and features support these use cases and scenarios:

- Create and track your SecOps related cases in one place with the new **Cases** page.
- [Define your own case workflow by configuring custom status values](#customize-status).
- [Improve collaboration, quality, and accountability by assigning tasks and due dates](#tasks).
- [Handle escalations and complex cases by linking multiple incidents to a case](#link-incidents).
- [Manage access to your cases using RBAC](#requirements).
- [Add rich-text comments to provide links, tables, and formatting to the activity log](#activity-log).
- [Upload attachments to store files like documents, CSVs, and encrypted zip files containing malware samples](#attachments).
- [Manage cases in multiple tenants via the multitenant management portal](mto-manage-cases.md).

As we build on this foundation of case management, we're prioritizing these additional robust capabilities as we evolve this solution:

- Automation
- More evidence to add
- Workflow customization
- More Defender portal integrations

## Requirements

Case management is available in the Defender portal, and to use it, you must have a Microsoft Sentinel workspace connected. Cases are accessible only from the Defender portal; you can't see them in the Azure portal.

For more information, see [Connect Microsoft Sentinel to the Defender portal](microsoft-sentinel-onboard.md).

Use Defender XDR unified RBAC or Microsoft Sentinel roles to grant access to case management features.

| Cases feature | Microsoft Defender Unified RBAC | Microsoft Sentinel role |
| ------------- | ------------------------------- | ----------------------- |
| View only</br>- case queue</br>- case details</br>- tasks</br>- comments</br>- case audits | Security operations > Security data basics (read)| Microsoft Sentinel Reader |
| Create and Manage</br>- cases and case tasks</br>- assign</br>- update status</br>- link and unlink incidents | Security operations > Alerts (manage) | Microsoft Sentinel Responder |
| Customize case status options | Authorization and setting > Core Security settings (manage)| Microsoft Sentinel Contributor |

For more information, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).

## Case queue

To start using case management, select **Cases** in the Defender portal to access the case queue. Filter, sort, or search your cases to find what you need to focus on.

:::image type="content" source="media/cases-overview/cases-queue-view.png" alt-text="Screenshot of the cases queue in the Defender portal.":::


## Case details

Each case has a page which allows analysts to manage the case and displays important details.

In the following example, a threat hunter is investigating a hypothetical "Burrowing" attack that consists of multiple MITRE ATT&CK&reg; techniques and indicators of compromise (IoCs).

:::image type="content" source="media/cases-overview/case-details.png" alt-text="Screenshot of the case details page in the Defender portal." lightbox="media/cases-overview/case-details-large.png":::

Manage the following case details to describe, prioritize, assign, and track work:

| Displayed case feature | Manage case options | Default value |
|:---|:---|:---|
| **Priority** | `Very low`, `Low`, `Medium`, `High`, `Critical` | none |
| **Status** | Set by analysts, customizable by admins | Default statuses are `New`, `Open`, and `Closed`</br>Default value is `New`|
| **Assigned to** | A single user in the tenant | none |
| **Description** | Plain text | none |
| **Case details** | Case ID | Case IDs start at 1000 and aren't purged. Use custom statuses and filters to archive cases. Case numbers are automatically set.|
| | Created by</br>Created on</br>Last updated by</br>Last updated on | automatically set |
| | Due on</br>Linked incidents | none |

Manage cases further by setting customized status, assigning tasks, linking incidents, and adding comments.

### Customize status

Architect case management to fit the needs of your security operations center (SOC). Customize the status options available to your SecOps teams to fit the processes you have in place.

Following the burrowing attack case creation example, the SOC admins configured statuses enabling threat hunters to keep a backlog of threats for triage on a weekly basis. Custom statuses such as *Research phase* and *Generating hypothesis* match this threat hunting team's established process.

:::image type="content" source="media/cases-overview/customize-status.png" alt-text="Screenshot showing default status options and customized statuses.":::

### Tasks

Add tasks to manage granular components of your cases. Each task comes with its own name, status, priority, owner, and due date. With this information, you always know who is accountable to complete which task and by what time. The task description summarizes the work to do and some space for describing the progress. Closing notes provide more context about the outcome of completed tasks.

:::image type="content" source="media/cases-overview/add-task-small.png" alt-text="Screenshot showing the task pane with tasks populated for the case and statuses available." lightbox="media/cases-overview/add-task.png":::

*Image shows the following task statuses available: New, In progress, Failed, Partially completed, Skipped, Completed*

### Link incidents

Linking a case and an incident helps your SecOps teams collaborate in the method that works best for them. For example, a threat hunter who finds malicious activity creates an incident for the incident response (IR) team. That threat hunter links the incident to a case so it's clear they're related. Now the IR team understands the context of the hunt that found the activity.

:::image type="content" source="media/cases-overview/link-incidents.png" alt-text="Screenshot showing linked incidents for the hypothetical burrowing attack case." lightbox="media/cases-overview/link-incident-chooser.png":::

Alternatively, if the IR team needs to escalate one or more incidents to the hunting team, they can create a case and link the incidents from the **Investigation & response** incident details page.

:::image type="content" source="media/cases-overview/link-incident-from-incident-graph.png" alt-text="Screenshot showing the link incident option from ellipses menu in the incident view.":::

### Activity log

Need to write down notes, or that key detection logic to pass along? Create rich text comments and review the audit events in the activity log. Comments are a great place to quickly add information&mdash;including such things as queries, tables, links, and structured content&mdash;to a case.

:::image type="content" source="media/cases-overview/informal-comments.png" alt-text="Screenshot showing informal comments between analysts.":::

Audit events are automatically added to the activity log of the case and the latest events are shown at the top. Change the filter if you need to focus on comments or audit history.

### Attachments

Share reports, emails, screenshots, log files, and more, all centralized in the **Attachments** tab of a case. Ensure you have all the necessary information to make quick and accurate decisions in your security investigations.

:::image type="content" source="media/cases-overview/case-attachments.png" alt-text="Screenshot of the details of the Attachments tab of a case.":::

To add attachments to your case, go to the **Case details** page, select the **Attachments** tab, select **Upload**, select your file, and wait for the upload to complete. Once uploaded, the file is scanned in the background for malware. When the scan is complete, anyone with access to the case can download the file. If the file you want to upload is actually a malware sample, you can wrap it in a password-protected ZIP file.

## Limitations

See [Case management limits](/azure/sentinel/sentinel-service-limits#case-management-limits).

## Related content

- [Microsoft Sentinel blog - Improve SecOps collaboration with case management](https://techcommunity.microsoft.com/blog/MicrosoftSentinelBlog/improve-secops-collaboration-with-case-management/4369044)
- [Microsoft Sentinel in the Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)
- [View and manage cases across multiple tenants in the Microsoft Defender multitenant portal](mto-manage-cases.md)
- [Microsoft Defender multitenant management](mto-overview.md)
