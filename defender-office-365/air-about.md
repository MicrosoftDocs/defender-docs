---
title: Automated investigation and response in Microsoft Defender for Office 365
f1.keywords:
- NOCSH
author: chrisda
ms.author: chrisda
manager: deniseb
audience: ITPro
ms.topic: conceptual
ms.date: 06/09/2023
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

[Microsoft Defender for Office 365 Plan 2](mdo-about.md#defender-for-office-365-plan-2-capabilities) includes powerful automated investigation and response (AIR) capabilities that save time and effort for your organization's SecOps team. AIR includes the following capabilities:

- Automated investigation processes in response to well-known threats.
- Appropriate remediation actions awaiting approval, enabling your SecOps team to respond effectively to detected threats.
- Your SecOps team is able to focus on higher-priority tasks without losing sight of important alerts that are triggered.

AIR in Defender for Office 365 Plan 2 requires that [audit logging is turned on](/purview/audit-log-enable-disable) (it's on by default).

## The overall flow of AIR

An alert is triggered, and a security playbook starts an automated investigation, which results in findings and recommended actions. Here's the overall flow of AIR, step by step:

1. An automated investigation is initiated in one of the following ways:
   - Either [an alert is triggered](#which-alert-policies-trigger-automated-investigations) by something suspicious in email (such as a message, attachment, URL, or compromised user account). An incident is created, and an automated investigation begins; or
   - A security analyst [starts an automated investigation](air-examples.md#example-a-security-administrator-triggers-an-investigation-from-threat-explorer) while using [Threat Explorer (Explorer)](threat-explorer-real-time-detections-about.md).

2. While an automated investigation runs, it gathers data about the email in question and _entities_ related to that email (for example, files, URLs, and recipients). The investigation's scope can increase as new and related alerts are triggered.

3. During and after an automated investigation, [details and results](air-view-investigation-results.md) are available to view. Results might include [recommended actions](air-remediation-actions.md) that can be taken to respond to and remediate any existing threats that were found.

4. Your security operations team reviews the [investigation results and recommendations](air-view-investigation-results.md), and [approves or rejects remediation actions](air-review-approve-pending-completed-actions.md).

5. As pending remediation actions are approved (or rejected), the automated investigation completes.

> [!NOTE]
> If the investigation does not result in recommended actions the automated investigation will close and the details of what was reviewed as part of the automated investigation will still be available on the investigation page.

In Microsoft Defender for Office 365, no remediation actions are taken automatically. Remediation actions are taken only upon approval by your organization's security team. AIR capabilities save your security operations team time by identifying remediation actions and providing the details needed to make an informed decision.

During and after each automated investigation, your security operations team can:

- [View details about an alert related to an investigation](air-view-investigation-results.md#view-details-about-an-alert-related-to-an-investigation)
- [View the results details of an investigation](air-view-investigation-results.md#view-investigation-details)
- [Review and approve actions as a result of an investigation](air-review-approve-pending-completed-actions.md)

> [!TIP]
> For a more detailed overview, see [How AIR works](air-examples.md).

## How to get AIR

AIR capabilities are included in [Microsoft Defender for Office 365 Plan 2](mdo-about.md#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet), as long as [audit logging is turned on](/purview/audit-log-enable-disable) (it's on by default).

In addition, make sure to review your organization's [alert policies](alert-policies-defender-portal.md), especially the [default policies in the Threat management category](/purview/alert-policies#default-alert-policies).

## Which alert policies trigger automated investigations?

Microsoft 365 includes built-in [alert policies](alert-policies-defender-portal.md) that help identify different types of internal and external threats. For example:

- Suspicious email sending patterns were detected.
- Delivered messages were removed by [zero-hour auto purge (ZAP)](zero-hour-auto-purge.md).
- Users report messages as malware or phishing.

Some alert policies trigger automated investigations. For more information, see the table for [Threat management alert policies](/purview/alert-policies#threat-management-alert-policies). The entries that contain the value **Yes** for **Automated investigation** trigger an automated investigation.

## Required permissions and licensing for AIR

You need to be assigned permissions to use AIR. You have the following options:

- [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell):
  - _Start an automated investigation_ or _Approve or reject recommended actions_: **Security Operator/Email advanced remediation actions (manage)**.
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

To use AIR, you need to be assigned a license for Defender for Office 365 Plan 2 (included in your subscription or an add-on license).

AIR contains data for users with Defender for Office 365 licenses assigned to them.

## Next steps

- [Get started using AIR](air-examples.md)
- [See details and results of an automated investigation](air-view-investigation-results.md#view-investigation-details)
- [Review and approve pending actions](air-remediation-actions.md)
- [View pending or completed remediation actions](air-review-approve-pending-completed-actions.md)
