---
title: Automated investigation and response in Microsoft Defender for Office 365
f1.keywords:
- NOCSH
author: chrisda
ms.author: chrisda
manager: deniseb
audience: ITPro
ms.topic: conceptual
ms.date: 05/30/2024
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

[Microsoft Defender for Office 365 Plan 2](mdo-about.md#defender-for-office-365-plan-2-capabilities) includes powerful automated investigation and response (AIR) capabilities that save time and effort for SecOps teams. AIR includes the following capabilities:

- Automated investigation processes in response to well-known threats.
- Appropriate remediation actions awaiting approval, enabling your SecOps team to respond effectively to detected threats.
- Your SecOps team is able to focus on higher-priority tasks without losing sight of important alerts that are triggered.

AIR in Defender for Office 365 Plan 2 requires that [audit logging is turned on](/purview/audit-log-enable-disable) (it's on by default).

## The overall flow of AIR

An alert is triggered, and a security playbook starts an automated investigation, which results in findings and recommended actions. Here's the overall flow of AIR, step by step:

1. An automated investigation is started initiated in one of the following ways:
   - An alert is triggered by an alert policy that identified something suspicious in email (for example, the message itself, an attachment, a URL, or a compromised user account). An incident is created, and an automated investigation begins.

     > [!TIP]
     > Be sure to regularly review the alerts your organization. For more information about alert policies that trigger automated investigations, see the [default alert policies in the Threat management category](/purview/alert-policies#default-alert-policies). The entries that contain the value **Yes** for **Automated investigation** trigger automated investigations.

   - A security analyst manually triggers the investigation. For examples, see [Automated investigation and response (AIR) examples in Microsoft Defender for Office 365 Plan 2](air-examples.md).

2. A running automated investigation gathers data about the specified email message and the related _entities_ (for example, attached files, included URLs, and recipients). The scope of the investigation can increase as new and related alerts are triggered.

3. During and after an automated investigation, [details and results](air-view-investigation-results.md) are available. Results might include [recommended actions](air-remediation-actions.md) for SecOps personnel to remediate the threats that were found.

4. The SecOps team reviews the [investigation results and recommendations](air-view-investigation-results.md), and [approves or rejects the remediation actions](air-review-approve-pending-completed-actions.md).

   > [!TIP]
   > No remediation actions happen automatically. Remediation actions require manual approval by SecOps personnel. AIR capabilities save time by getting to the recommended remediation actions with all the details to make an informed decision.

5. As pending remediation actions are approved or rejected, the automated investigation completes.

   The automated investigation automatically closes if no recommended actions are identified. The details of the investigation are still available on the **Investigations** page at <>.

During and after each automated investigation, the SecOps team can do the following tasks:

- [View details about an alert related to an investigation](air-view-investigation-results.md#view-details-about-an-alert-related-to-an-investigation)
- [View the results details of an investigation](air-view-investigation-results.md#view-investigation-details-in-the-defender-portal-from-air-in-defender-for-office-365)
- [Review and approve actions as a result of an investigation](air-review-approve-pending-completed-actions.md)

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

- [AIR examples](air-examples.md)
- [See details and results of an automated investigation](air-view-investigation-results.md#view-investigation-details-in-the-defender-portal-from-air-in-defender-for-office-365)
- [Review and approve pending actions](air-remediation-actions.md)
- [View pending or completed remediation actions](air-review-approve-pending-completed-actions.md)
