---
title: Prioritize, manage, investigate, and respond to incidents in Microsoft Defender XDR
description: Learn how to prioritize and manage incidents in Microsoft Defender XDR. See how Automated Investigation and Response (AIR) correlates related alerts, assesses threat scope, and combines findings into a single incident.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Prioritize, Manage, Investigate & Respond to Incidents in Microsoft Defender

When alerts are triggered in Microsoft Defender, automated investigation and response (AIR) begins and hunts throughout an organization's subscription, determine the impact and scope of the threat, and collate the information into a single Incident so that admins don't have to manage multiple incidents.

<a name="what-you-need"></a>
## Prerequisites

Before you begin, make sure you have the following licensing and permissions:

- Microsoft Defender for Office 365 Plan 2 or higher
- Sufficient permissions (Security reader, security operations, or security administrator, plus [Search and purge](../mdo-portal-permissions.md) role)

## Prioritize & manage Incidents

Navigate to the security portal Incidents page <https://security.microsoft.com/incidents>.

When the Incident page loads you can filter and prioritize by clicking columns to sort the actions or press Filters to apply a filter such as data source, tags or state.

Now you have a prioritized list of incidents, from which you can select to rename, assign, classify, tag, change the status or add comments via the **Manage incidents** button.

Use the filters to make sure Microsoft Defender for Office 365 items are included.

If you're looking for specific alerts, either use the incident search capability (*Search for name or ID*) or consider using the alert queue filtering by alert title, severity, or another alert attribute.

## Investigate & Respond to Incidents

After you have prioritized your incident queue, select the Incident you'd like to investigate to load the incidents Overview page. You see useful information, such as *MITRE ATT&CK techniques observed* and a *timeline of the attack*.

The tabs at the top of the incident page allow you to explore more details such as the affected users, mailboxes, endpoints, and et cetera.

The *Evidence and Response* tab shows items identified as related to the alert that triggered the investigation.

Any items showing as *Pending Action* on the *Evidence and Response* tab are awaiting approval from an administrator. Sorting by the remediation status column in the *All Evidence* view is recommended, followed by clicking the entity or cluster to load the flyout menu where you can then approve the actions if appropriate.

If you need to understand the evidence and entities involved further, you can use the incident graph to see the visual linkage of the evidence and entities involved. Alternatively, you can review the underlying investigations, which show more of the entities and items involved in the security event.

<a name="next-steps"></a>
## Next steps

You can start using *Action Center* to act on pending action items from all incidents in your organization if you want to focus on the action items AIR needs approval for.

<a name="more-information"></a>
## Related content

For more detailed guidance, see the following resources:

[Manage incidents in Microsoft Defender XDR](/defender-xdr/manage-incidents).

[Automated investigation and response (AIR) examples in Microsoft Defender for Office 365 Plan 2](../air-examples.md).

[Remediation actions in Microsoft Defender for Office 365](../air-remediation-actions.md).
