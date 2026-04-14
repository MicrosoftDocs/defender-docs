---
title: Automated investigation and response in Microsoft Defender for Office 365
f1.keywords:
- NOCSH
author: chrisda
ms.author: chrisda
audience: ITPro
ms.topic: article
ms.date: 02/23/2026
ms.localizationpriority: medium
search.appverid:
- MET150
- MOE150
ms.collection:
- m365-security
- tier2
description: Get started using automated investigation and response capabilities in Microsoft Defender for Office 365.
ms.custom:
- air
- seo-marvel-mar2020
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

As [security alerts](/defender-xdr/investigate-alerts) appear in a Microsoft 365 organization at <https://security.microsoft.com/alerts>, it's up to the security operations (SecOps) team to review, prioritize, and respond to those alerts. Keeping up with the volume of incoming alerts can be overwhelming. Automating some of those tasks can help.

[Microsoft Defender for Office 365 Plan 2](mdo-about.md#defender-for-office-365-plan-2-capabilities) (included in Microsoft 365 licenses like E5 or as a standalone subscription) includes powerful automated investigation and response (AIR) capabilities that save time and effort for SecOps teams.

AIR triages high impact, high volume alerts by completing organization level investigations. AIR investigations expand on detections or provide extra analysis to determine the threat status for the organization. When AIR identifies threats, it queues threat remediation actions for SecOps personnel to approve. AIR results in the following benefits:

- Automated investigation processes in response to well-known threats.
- Appropriate remediation actions awaiting approval, enabling your SecOps team to respond effectively to detected threats.
- Your SecOps team is able to focus on higher-priority tasks without losing sight of important alerts that are triggered.

AIR in Defender for Office 365 Plan 2 requires that [audit logging is turned on](/purview/audit-log-enable-disable) (it's on by default).

## The overall flow of AIR

An alert is triggered, and a security playbook starts an automated investigation, which results in findings and recommended actions. Here's the overall flow of AIR, step by step:

1. An automated investigation is initiated in one of the following ways:
   - Specific alerts that are designed to initiate AIR. These alerts include:
     - Something suspicious is identified in email (for example, the message itself, an attachment, a URL, or a compromised user account).
     - [Zero-hour auto purge (ZAP)](zero-hour-auto-purge.md).
     - User submissions.
     - User click alerts.
     - Suspicious mailbox behavior.

       > [!TIP]
       > Be sure to regularly review the alerts your organization. For more information about alert policies that trigger automated investigations, see the [default alert policies in the Threat management category](/defender-xdr/alert-policies#threat-management-alert-policies). The entries that contain the value **Yes** for **Automated investigation** can trigger automated investigations. AIR isn't triggered when:
       >
       > - These alerts are disabled.
       > - These alerts where replaced by custom alerts.

   - A security analyst manually triggers the investigation by selecting :::image type="icon" source="media/m365-cc-sc-take-actions-icon.png" border="false"::: **Take action** in Threat Explorer, Advanced hunting, custom detection, the Email entity page, or the Email summary panel. For more information, see [Threat hunting: Email remediation](threat-explorer-threat-hunting.md#email-remediation). For examples, see For examples, see [Automated investigation and response (AIR) examples in Microsoft Defender for Office 365 Plan 2](air-examples.md).

2. The automated investigation evaluates and analyzes the nature of the alert, the message involved, and more evidence surrounding the message. The scope of the investigation can increase based on the evidence uncovered and collected during the investigation.

3. During and after an automated investigation, [details and results](air-view-investigation-results.md) are available. Results might include [recommended actions](air-remediation-actions.md) for SecOps personnel to remediate the threats that were found.

4. The SecOps team reviews the [investigation results and recommendations](air-view-investigation-results.md) in the investigation itself, the incident, or in the Action center, and [approves or rejects the remediation actions](air-review-approve-pending-completed-actions.md).

   > [!TIP]
   > We expanded the auto-remediation capabilities in automated investigations and response (AIR) to fully automate the remediation of malicious similarity clusters. In 2025, we introduced auto-remediation for malicious URL and file clusters. Building on that foundation, this enhancement enables AIR to automatically approve all pending remediation actions it generates. This capability eliminates the need for manual intervention and streamlines the response process for SOC teams.
   >
   > AIR also saves time by evaluating and automatically resolving alerts and incidents where no threats were found. This result is common in user submission scenarios. AIR closes the investigation if no threats were found or threats were found in messages that were already remediated.

5. As pending remediation actions are approved or rejected, the automated investigation completes.

   The automated investigation automatically closes if no recommended actions are identified. The details of the investigation are still available on the **Investigations** page at <https://security.microsoft.com/airinvestigation>.

During and after each automated investigation, the SecOps team can do the following tasks:

- [View details about an alert related to an investigation](air-view-investigation-results.md#view-details-about-an-alert-related-to-an-investigation)
- [View the results details of an investigation](air-view-investigation-results.md#view-investigation-details-from-air-in-defender-for-office-365-plan-2)
- [Review and approve actions as a result of an investigation](air-review-approve-pending-completed-actions.md)

[!INCLUDE [Built-in alert tuning rules](../includes/built-in-alert-tuning-rules.md)]

## Required permissions and licensing for AIR

You need to be assigned permissions to use AIR. You have the following options:

- [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell):
  - _Start an automated investigation_ or _Approve or reject recommended actions_: **Security operations/Email advanced remediation actions (manage)**.
- [Email & collaboration permissions in the Microsoft Defender portal](mdo-portal-permissions.md):
  - _Set up AIR features_: Membership in the **Organization Management** or **Security Administrator** role groups.
  - _Start an automated investigation_ or _Approve or reject recommended actions_:
    - Membership in the **Organization Management**, **Security Administrator**, **Security Operator**, **Security Reader**, or **Global Reader** role groups.
      and
    - The **Search and Purge** role, which is assigned only to the **Data Investigator** or **Organization Management** role groups by default. Or you can [create a new role group](mdo-portal-permissions.md#create-email--collaboration-role-groups-in-the-microsoft-defender-portal) with the **Search and Purge** role assigned, and add the users to the custom role group.
- [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Give users the required permissions _and_ permissions for other features in Microsoft 365:
  - _Set up AIR features_ Membership in the **Global Administrator** or **Security Administrator** roles.
  - _Start an automated investigation_ or _Approve or reject recommended actions_:
    - Membership in the **Global Administrator**, **Security Administrator**, **Security Operator**, **Security Reader**, or **Global Reader** roles.
      and
    - Membership in an Email & collaboration role group with the **Search and Purge** role assigned as previously described.

To use Automated Investigation and Response (AIR), you must have Microsoft Defender for Office 365 Plan 2 licenses (included with eligible subscriptions or available as an add‑on). 

## Next steps

- [AIR examples](air-examples.md)
- [See details and results of an automated investigation](air-view-investigation-results.md#view-investigation-details-from-air-in-defender-for-office-365-plan-2)
- [Review and approve pending actions](air-remediation-actions.md)
- [View pending or completed remediation actions](air-review-approve-pending-completed-actions.md)
