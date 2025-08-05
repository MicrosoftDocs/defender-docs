---
title: Defender for Office 365 ICES Vendor Ecosystem Integration Guide
description: Understand how the ICES Vendor Ecosystem enables Microsoft Defender for Office 365 to integrate with trusted non-Microsoft email security vendors.
author: chrisda
ms.author: chrisda
manager: orspodek
ms.reviewer: aylamckorkle
f1.keywords:
  - NOCSH
ms.service: defender-office-365
audience: ITPro
ms.topic: article
ms.date: 06/11/2025
ms.custom:
ms.assetid:
ms.collection:
  - m365-security
  - tier2
ms.localizationpriority: medium
search.appverid:
  - MET150
  - MOE150
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Microsoft Defender for Office 365 ICES Vendor Ecosystem integration guide

> [!NOTE]
> Information in this article pertains to features that are part of the ICES Vendor Ecosystem. However, certain functionality might not yet be accessible to all users. Microsoft makes no warranties, expressed or implied, with respect to the timeline of availability.

The Integrated Cloud Email Security (ICES) Vendor Ecosystem enables Microsoft Defender for Office 365 to integrate with trusted non-Microsoft email security vendors. Integration supports a multi-layered defense strategy. It allows customers to benefit from niche capabilities from external partners and maintain a unified experience within the Microsoft Defender portal.

The benefits of the ICES Vendor Ecosystem include:

- **Unified quarantine**: View and manage quarantined email from both Defender for Office 365 and non-Microsoft vendors in a single interface.
- **Consolidated dashboards**: Access effectiveness metrics across all integrated solutions to understand detection coverage and outcomes.
- **Defense in depth**: Enhance protection by layering non-Microsoft capabilities alongside native defenses in Defender for Office 365.
- **Streamlined operations**: Seamless integration with cloud-native, API-enabled email security vendors through consolidated workflows and insights within the Defender portal.

The rest of this article describes the operation, goals, and deployment considerations for the ICES Vendor Ecosystem.

> [!TIP]
> Currently, specific API details aren't available.

## Get Started

1. **Check license eligibility**: Verify your organization has Defender for Office 365 Plan 2 or Microsoft 365 E5 licenses. For more information about Defender for Office 365 Plan 2, see [Defender for Office 365 Plan 2 capabilities](mdo-about.md#defender-for-office-365-plan-2-capabilities).

2. **Select an approved non-Microsoft security vendor**:
   - Darktrace/EMAIL
   - KnowBe4 Defend Platform

3. **Enable integration**: After you onboard to the non-Microsoft security vendor, their solution is seamlessly and automatically incorporated into your security architecture.

4. **Monitor and manage**: Use the unified dashboards and quarantine in Defender for Office 365 to monitor threat activity and take action.

## How integration works

Integration enables the non-Microsoft vendor to pass details on a specific message via a private Microsoft Graph API. For example:

- Verdict.
- Confidence level.
- Any threat details they would like to share.

Defender for Office 365 uses this information in the following steps:

- Acknowledges the verdict.
- Determines the [highest (most serious) verdict](#q-which-verdict-takes-precedence) on the message.
- Updates the message and/or logs with the verdict information.
- Moves the detected message to the policy-specified location.

You can see the results of this integration in multiple unified experiences as described later in this article. For example:

- [Quarantine](#quarantine)
- [Threat Explorer (Explorer)](#threat-explorer)
- [The Email entity page](#the-email-entity-page)
- [Advanced Hunting](#advanced-hunting)
- [Reports](#reports)

## Configure your policies

To ensure optimal protection and consistent behavior across integrated solutions, it's essential to configure threat policies appropriately in both Defender for Office 365 and any participating non-Microsoft vendor platforms.

### Defender for Office 365 policy recommendations

Microsoft recommends enabling the **Standard** and/or **Strict** [preset security policies](preset-security-policies.md) for all users in your organization. These presets are designed to provide a baseline of protection aligned with current threat intelligence and best practices.

> [!TIP]
> For more information about preset security policies vs. custom threat policies, see [Determine your threat policy strategy](mdo-deployment-guide.md#determine-your-protection-policy-strategy).
>
> If you plan on using custom threat policies instead of preset security policies, you need to periodically use the [Configuration analyzer](configuration-analyzer-for-security-policies.md) to identify and remediate deviations from recommended policy baselines.

### Policy alignment with non-Microsoft vendors

To maintain consistent message handling and threat response across the ecosystem, it's critical to align policy configurations between Defender for Office 365 and the integrated non-Microsoft vendor. This alignment ensures messages exhibit predictable behavior and are surfaced appropriately in unified dashboards and quarantine views.

After you establish policy alignment, you can manage the remainder of the integration lifecycle directly within the Defender portal. For example:

- Monitoring
- Reporting
- Response

## Portal experiences

The Defender portal provides a comprehensive and integrated experience for managing both native and non-Microsoft email security solutions. Capabilities are enhanced through participation in the ICES Vendor ecosystem as described in the following subsections.

### Quarantine

Messages quarantined by non-Microsoft vendors are surfaced within the [quarantine](/defender-office-365/quarantine-about) experience. Security teams can search, preview, release, report, and take remediation actions on these messages using the same workflows as Defender for Office 365 detections. This unified view reduces operational complexity and ensures consistent handling of threats across the email security stack.

### Threat Explorer

[Threat Explorer (Explorer)](/defender-office-365/threat-explorer-real-time-detections-about) provides real-time visibility into email threats across the organization. Messages processed by non-Microsoft vendors and surfaced through the ecosystem are included in Explorer views. This integration enables security analysts to investigate campaigns, trace message delivery paths, and correlate threat signals across detection sources.

### The Email entity page

The [Email entity page](/defender-office-365/mdo-email-entity-page) consolidates all available metadata and telemetry for a given message. For example:

- Headers
- Delivery events
- Detection verdicts
- User actions

For messages processed by ecosystem partners, the page includes vendor-specific detection technology. This integration offers a complete forensic view in a single pane of glass.

### Advanced Hunting

Security teams can use [Advanced Hunting](/defender-xdr/advanced-hunting-overview) capabilities in Defender for Office 365 to query and correlate data across native and non-Microsoft vendor detections. Vendor-submitted messages are represented in the [EmailEvents](/defender-xdr/advanced-hunting-emailevents-table) and [EmailPostDeliveryEvents](/defender-xdr/advanced-hunting-emailpostdeliveryevents-table) tables. Extended schema support is available for partner-specific attributes, including vendor-specific threat details.

Use this example query to see non-Microsoft vendor detections in Advanced Hunting:

```kusto
EmailEvents
| where Timestamp > ago(7d)
//List email detected by a non-Microsoft vendor
| where DetectionMethods contains "Thirdparty"
| project NetworkMessageId, RecipientEmailAddress, ThreatTypes, DetectionMethods, AdditionalFields, LatestDeliveryLocation 
```

## Reports

The Microsoft 365 Defender portal provides a centralized reporting experience that consolidates information from both Defender for Office 365 and integrated non-Microsoft vendors. This unified view enables security teams to assess the effectiveness of their entire email security stack in one place.

The following dashboards display this information:

- **Email Detections**:
  - *Defender mailflow detections*: Messages Defender for Office 365 detected during mail flow. These unique messages were undetected by the non-Microsoft vendor.
  - *Defender post-delivery detections*: Messages Defender for Office 365 detected after delivery via [zero-hour auto purge (ZAP)](zero-hour-auto-purge.md). These unique messages were undetected by the non-Microsoft vendor.
  - *Non-Microsoft post-delivery detection*: Messages the non-Microsoft vendor detected.
  - *Duplicate detections*: Messages Defender for Office 365 detected during mail flow where the non-Microsoft vendor also delivered a verdict.
  - *Duplicate post-delivery detections*: Messages Defender for Office 365 detected after delivery via ZAP where the non-Microsoft vendor also delivered a verdict.

- **Non-Microsoft detections**:
  - *Post-delivery detections*: Shows the verdict types on messages provided by the non-Microsoft vendor. This report is a breakdown of the *Non-Microsoft post-delivery detections* field in the **Email detections** report.
  - *Efficacy*: Calculates the unique Non-Microsoft post-delivery detections over the total Defender for Office detections. This shows the added value from your non-Microsoft solution.

## Frequently asked questions

### Q: I have multiple ICES/CAPES solutions. How does that work?

A: Integration with multiple ICES/CAPES vendors is available as long as they're part of the ICES Vendor Ecosystem partnership.

The integration works the same: each non-Microsoft vendor can provide verdicts on messages in your organization. You can see the non-Microsoft detections and identify the non-Microsoft vendor responsible for the detection within the Defender portal experiences.

If multiple non-Microsoft vendors send verdicts on the same message, the verdicts and explanations are logged. The [highest (most serious) verdict](#q-which-verdict-takes-precedence) between the non-Microsoft vendors determines the action taken on the message.

### Q: Which verdict takes precedence?

A: The highest verdict takes precedence using the following order (from most serious to least serious):

1. Malware
2. High confidence phishing
3. Phishing
4. High confidence spam
5. Spam
6. Deleted
7. Junk
8. Clean or Not spam

### Q: What if I use a different non-Microsoft vendor?

A: Currently, ICES Vendor Ecosystem integration is available only for Darktrace and KnowBe4. If you use a different ICES/CAPES vendor, you can't take advantage of this integration.

### Q: Is there a charge for the non-Microsoft verdict data and actions by Defender for Office 365 policies?

A: No, there's no charge for the integration. The integration and Graph API support are included as part of your Defender for Office 365 Plan 2 licenses.

### Q: Why don't I see the Detection Totals and Post-delivery activities by non-Microsoft solution reports?**

A: The reports only show if you have activity from one of the authorized non-Microsoft vendors in the past 90 days.

## Feedback and Support

To provide feedback or request support, contact your Microsoft account team or use the feedback link in the Defender portal.
