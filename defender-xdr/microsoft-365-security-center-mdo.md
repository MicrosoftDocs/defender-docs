---
title: Microsoft Defender for Office 365 in the Microsoft Defender portal
description: Learn about how Microsoft Defender for Office 365 operates in the Microsoft Defender portal.
ms.date: 09/11/2024
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: overview
ms.localizationpriority: medium
search.appverid:
- MET150
- MOE150
ms.collection:
- m365-security
- tier2
ms.custom: admindeeplinkDEFENDER
ms.service: defender-xdr
---

# Microsoft Defender for Office 365 in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender for Office 365 Plan 1 and Plan 2](/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet)

This article describes the Microsoft Defender for Office 365 experience in the Microsoft Defender portal at <https://security.microsoft.com>. Formerly, Defender for Office 365 customers used the Office 365 Security & Compliance Center at <https://protection.office.com>, but access to that portal ended in 2022.

The Defender portal combines security capabilities from existing Microsoft 365 security portals. This improved portal helps security teams protect their organization from threats more effectively and efficiently.

For more information about the benefits of the unified Microsoft Defender XDR, see [Overview of Defender XDR](microsoft-365-defender.md).

If you're looking for compliance-related items, see [Microsoft Purview compliance portal](/purview/purview-compliance-portal).

## Capabilities

With the unified Defender XDR solution, you can stitch together the threat signals and determine the full scope of the threat, and how it currently affects the organization.

:::image type="content" source="media/mdo-m36d-nav-collapsed.png" alt-text="A screenshot of the left navigation pane of the Microsoft 365 Defender portal." lightbox="media/mdo-m36d-nav-collapsed.png":::

Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools. Most Defender for Office 365 specific features are available under the **Email & collaboration** node as described in the [Email & collaboration](#email--collaboration) section.

:::image type="content" source="media/mdo-m365d-nav.png" alt-text="A screenshot that shows the Email & collaboration node expanded in the Defender portal." lightbox="media/mdo-m365d-nav.png":::

> [!TIP]
>
> - Defender for Office 365 includes all the functionality in Exchange Online Protection (EOP). For more information about EOP, see [Exchange Online Protection overview](/defender-office-365/eop-about).
>
> - What you see or don't see in the Defender portal depends on your subscription (for example, Microsoft 365 E5 vs. an add-on or standalone Defender for Office 365 Plan 2 subscription).
>
>   For more information about the differences between Defender for Office 365 Plan 1 and Plan 2, see [Defender for Office 365 Plan 1 vs. Plan 2 cheat sheet](/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet).

### Home

The **Home** page of the Defender portal shows important summary information (cards) about the security status of your Microsoft 365 environment.

- Use :::image type="icon" source="media/m365-cc-sc-guided-tour-icon.png" border="false"::: **Guided tour** to take a quick tour of:
  - Email & collaboration
  - Attack simulation training (Defender for Office 365 Plan 2 only)
- Use :::image type="icon" source="media/m365-cc-sc-take-actions-icon.png" border="false"::: **What's New** to go to the [Microsoft Defender XDR Blog](https://techcommunity.microsoft.com/t5/microsoft-defender-xdr-blog/bg-p/MicrosoftThreatProtectionBlog).
- Use :::image type="icon" source="media/m365-cc-sc-community-icon.png" border="false"::: **Community** to go to the [Security, Compliance, and Identity community](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/ct-p/MicrosoftSecurityandCompliance).
- Use :::image type="icon" source="media/m365-cc-sc-create-icon.png" border="false"::: **Add cards** to customize the information on the page.

### Investigation & response

The following subsections describe the features that are available in the **Investigation & response** node in the Defender portal.

:::image type="content" source="media/m365d-investigation-and-response-nav.png" alt-text="A screenshot showing the expanded Investigation & response node in the Defender portal." lightbox="media/m365d-investigation-and-response-nav.png":::

#### Incidents & alerts

Brings together incident and alert management across your email, devices, and identities. Alerts are now available under the Investigation node, and help provide a broader view of an attack. The alert page provides full context to the alert, by combining attack signals to construct a detailed story. Previously, alerts were specific to different workloads. A new, unified experience now brings together a consistent view of alerts across workloads. You can quickly triage, investigate, and take effective action. For more information, see the following articles:

- [Incident response in the Microsoft Defender portal](incidents-overview.md)
- [Alerts queue in Microsoft Defender XDR](/defender-endpoint/alerts-queue-endpoint-detection-response)

> [!TIP]
> **Email & collaboration alerts** at <https://security.microsoft.com/viewalertsv2> is available in Defender for Office 365 Plan 1 only.

#### Hunting

Proactively search for threats, malware, and malicious activity across your endpoints, Microsoft 365 mailboxes, and more by using [advanced hunting queries](advanced-hunting-overview.md). You can use these powerful queries to locate and review threat indicators and entities for known and potential threats.

You can build [custom detection rules](/windows/security/threat-protection/microsoft-defender-atp/custom-detection-rules) from advanced hunting queries to proactively monitor events that might indicate breach activity and misconfigured devices.

### Actions & submissions

**Action center** shows you the investigations created by automated investigation and response capabilities. This automated, self-healing capability in the Defender portal can help security teams by automatically responding to specific events.

For more information, see [Action center](m365d-action-center.md).

Admins can use the **Submissions** page to submit email messages, email attachments, and URLs to Microsoft for analysis. Messages reported as **Junk**, **Not junk**, or **Phishing by users in Outlook are also available to review or resubmit to Microsoft.

For more information, see [Admin submissions](/defender-office-365/submissions-admin).

### Threat intelligence in Defender for Office 365 Plan 2

The following subsections describe the features that are available in the **Threat intelligence** node in the Defender portal in organizations with Defender for Office 365 Plan 2.

:::image type="content" source="media/m365d-threat-intelligence-nav.png" alt-text="A screenshot showing the expanded Threat intelligence node in the Defender portal." lightbox="media/m365d-threat-intelligence-nav.png":::

#### Threat Analytics

Get threat intelligence from expert Microsoft security researchers. Threat Analytics helps security teams be more efficient when facing emerging threats. Threat Analytics includes:

- Email-related detections and mitigations from Microsoft Defender for Office 365.
- Incidents view related to the threats.
- Enhanced experience for quickly identifying and using actionable information in the reports.

You can access Threat analytics either from the left navigation pane in the Defender portal, or from a dedicated dashboard card that shows the top threats for your organization.

For more information, see [Threat analytics in Microsoft Defender XDR](threat-analytics.md).

### Email & collaboration

The **Email & collaboration** node contains features that are specific to Defender for Office 365:

- **Investigations**: Defender for Office 365 Plan 2 only. For more information, see [Automated investigation and response (AIR)](/defender-office-365/air-about).
- **Explorer (Threat Explorer)**: Defender for Office 365 Plan 2 only. Defender for Office 365 Plan 1 has **Real-time detections** instead. For more information, see [About Threat Explorer and Real-time detections](/defender-office-365/threat-explorer-real-time-detections-about).
- **Review** at <https://security.microsoft.com/threatreview> contains the following features:
  - [Action center](/defender-xdr/m365d-action-center): Defender for Office 365 Plan 2 only.
  - **Quarantine** for [users](/defender-office-365/quarantine-end-user) and [admins](/defender-office-365/quarantine-admin-manage-messages-files).
  - **Restricted entities**: Contains [restricted users](/defender-office-365/outbound-spam-restore-restricted-users) and [restricted connectors](/defender-office-365/connectors-detect-respond-to-compromise).
  - **Malware trends**
- [Campaigns](/defender-office-365/campaigns): Defender for Office 365 Plan 2 only.
- [Threat trackers](/defender-office-365/threat-trackers): Defender for Office 365 Plan 2 only.
- [Exchange message trace](/defender-office-365/message-trace-defender-portal)
- [Attack simulation training](/defender-office-365/attack-simulation-training-get-started): Defender for Office 365 Plan 2 only.
- **Policies & rules** at <https://security.microsoft.com/securitypoliciesandrules> contains the following features:
  - **Threat policies**:
    - **Templated policies** section:
      - [Preset security policies](/defender-office-365/preset-security-policies)
      - [Configuration analyzer](/defender-office-365/configuration-analyzer-for-security-policies)
    - **Policies** section:
      - [Anti-phishing](/defender-office-365/anti-phishing-policies-about)
      - **Anti-spam**: Includes [inbound anti-spam](/defender-office-365/anti-spam-protection-about#anti-spam-policies), [outbound anti-spam](/defender-office-365/outbound-spam-policies-configure), and [connection filtering](/defender-office-365/connection-filter-policies-configure).
      - [Anti-malware](/defender-office-365/anti-malware-protection-about#anti-malware-policies)
      - [Safe Attachments](/defender-office-365/safe-attachments-about)
      - [Safe Links](/defender-office-365/safe-links-about)
    - **Rules** section:
      - [Tenant Allow/Block List](/defender-office-365/tenant-allow-block-list-about)
      - **Email authentication settings**: Settings for [trusted ARC sealers](/defender-office-365/email-authentication-arc-configure) and [DKIM](/defender-office-365/email-authentication-dkim-configure).
      - [Advanced delivery](/defender-office-365/advanced-delivery-policy-configure)
      - [Enhanced filtering](/Exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors)
      - [Quarantine policies](/defender-office-365/quarantine-policies)
  - [Alert policies](/purview/alert-policies)
  - [Activity alerts](/purview/create-activity-alerts)

:::image type="content" source="media/mdo-m365d-nav.png" alt-text="A screenshot that shows the left navigation pane of the Defender portal focused on Email & collaboration." lightbox="media/mdo-m365d-nav.png":::

> [!TIP]
> For more information about the differences between Defender for Office 365 Plan 1 and Plan 2, see [Defender for Office 365 Plan 1 vs. Plan 2 cheat sheet](/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet).
>
> Although it isn't directly accessible from the left navigation pane in the Defender portal, the **Email entity page** in Defender for Office 365 *unifies* and *centralizes* email information to empower admins and security operations (SecOps) teams to quickly understand and act on email threats. For more information, see [The Email entity page](/defender-office-365/mdo-email-entity-page).

### SOC optimization

For more information, see [SOC optimization reference of recommendations](/en-us/azure/sentinel/soc-optimization/soc-optimization-reference).

### Reports

Defender for Office 365 reports are available on the **Reports** page at <https://security.microsoft.com/securityreports> \> **Email & collaboration** section \> **Email & collaboration reports**.

For more information, see the following articles:

- [Email security report](/defender-office-365/reports-email-security)
- [Defender for Office 365 reports](/defender-office-365/reports-defender-for-office-365)

### Learning hub

Redirects to the [Microsoft Defender XDR learning paths](/training/defender/).

### Trials

Start trials of eligible Defender security products and Microsoft Purview compliance products.

Organizations with Defender for Office 365 Plan 1 can start a trial of Defender for Office 365 Plan 2. For more information, see [Trial user guide: Microsoft Defender for Office 365](/defender-office-365/trial-user-guide-defender-for-office-365).

### System

The following subsections describe the features that are available in the **System** node in the Defender portal.

:::image type="content" source="media/m365d-system-nav.png" alt-text="A screenshot showing the expanded System node in the Defender portal." lightbox="media/m365d-system-nav.png":::

#### Audit

[Audit log search](/en-us/purview/audit-search) and [audit log retention policies](/purview/audit-log-retention-policies).

#### Permissions

- [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md)
- **Microsoft Entra ID**. You can view information about the roles that are shown, but you can't manage role membership here. The details flyout of each role contains a link to the **Users** page in Microsoft Entra where you can add users to roles.
- [Email & collaboration roles](/defender-office-365/scc-permissions)

#### Health

- **Service health**: View the health status of the Microsoft 365 services that are included in your company's subscription.
- **Message center**: The [Microsoft 365 Message center](/microsoft-365/admin/manage/message-center) in the Microsoft 365 admin center.

#### Settings

**Email & collaboration** contains the following Defender for Office 365 features:

- [User reported settings](/defender-office-365/submissions-user-reported-messages-custom-mailbox)
- [User tags](/defender-office-365/user-tags-about)
- [Priority account protection](/defender-office-365/priority-accounts-turn-on-priority-account-protection) (Defender for Office 365 Plan 2 only)
- [Microsoft Teams protection](/defender-office-365/mdo-support-teams-about#configure-zap-for-teams-protection-in-defender-for-office-365-plan-2) (Defender for Office 365 Plan 2 only)

## Related information

- [The Action center](m365d-action-center.md)
- [Email & collaboration alerts](/Microsoft-365/compliance/alert-policies#default-alert-policies)
- [Custom detection rules](custom-detection-rules.md)
- [Create a phishing attack simulation](/defender-office-365/attack-simulation-training-simulations) and [create a payload for training your people](/defender-office-365/attack-simulation-training-payloads)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
