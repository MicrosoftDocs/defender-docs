---
# Required metadata
# For more information, see https://learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata
# For valid values of ms.service, ms.prod, and ms.topic, see https://learn.microsoft.com/en-us/help/platform/metadata-taxonomies

title: MDO API Vendor Ecosystem Integration Guide
description: Help customers understand how the API Vendor Ecosystem enables Microsoft Defender for Office 365 (MDO) to integrate with trusted third-party email security vendors
author:      aylamck # GitHub alias
ms.author:   aylamckorkle # Microsoft alias
ms.service: defender-office-365
ms.topic: article
ms.date: 06/08/2025
---

# MDO API Vendor Ecosystem Integration Guide

## Overview

The API Vendor Ecosystem enables Microsoft Defender for Office 365 (MDO) to integrate with trusted third-party email security vendors. This integration supports a multi-layered defense strategy, allowing customers to benefit from niche capabilities provided by external partners while maintaining a unified experience within the Microsoft Security portal.

This article outlines the goals, benefits, and deployment considerations for organizations participating in the API Vendor Ecosystem.

> [!NOTE]
> This guide outlines the integration experience and ecosystem principles. Specific API details aren't publicly available.

## Benefits of the API Vendor Ecosystem

**Unified Quarantine**: View and manage quarantined emails from both MDO and third-party vendors in a single interface.

**Consolidated Dashboards**: Access effectiveness metrics across all integrated solutions to understand detection coverage and outcomes.

**Defense in Depth**: Enhance protection by layering third-party capabilities alongside MDO’s native defenses.

**Streamlined Operations**: Seamless integration with cloud-native, API-enabled email security vendors through consolidated workflows and insights within the Microsoft 365 Security portal.

## Prerequisites

Integration features are available to customers with Microsoft Defender for Office 365 Plan 2 (P2) or Microsoft 365 E5 licenses.

- Must be licensed with one of the following third-party solutions:

  - Darktrace/EMAIL
  
  - KnowBe4 Defend Platform
  
## Getting Started

1. **Check License Eligibility**

   1. Ensure your tenant has MDO P2 or Microsoft 365 E5 licenses.
   
1. **Select a Partner**

   1. Choose from approved API vendors listed above.
   
1. **Enable Integration**

   1. Upon onboarding to the strategic integration partner, their solution is seamlessly and automatically incorporated into your security architecture.
   
1. **Monitor and Manage**

   1. Use the unified dashboards and quarantine to monitor threat activity and take action.
   
## Understanding the Integration

The integration works by allowing the third-party to pass in details on a specific message regarding the verdict, confidence level, and any threat details they would like to share via a private Microsoft Graph API. Microsoft Defender for Office 365 acknowledges the verdict provided and determine what the highest verdict on a message was. MDO updates the message and/or logs with the verdict information, moving the message to the user policy-specified location. You can see the results of this integration in multiple unified experiences, including Reporting, Advanced Hunting, Email Entity, Quarantine, and Threat Explorer.

## Configuring your Policies

To ensure optimal protection and consistent behavior across integrated solutions, it is essential to configure security policies appropriately in both Microsoft Defender for Office 365 (MDO) and any participating third-party vendor platforms.

#### Microsoft Defender for Office 365 Policy Recommendations

Microsoft recommends enabling either the **Standard** or **Strict** preset security policies for all users in your tenant. These presets are designed to provide a baseline of protection aligned with current threat intelligence and best practices.

> [!TIP]
> For more granular guidance on setting up user policies, refer to the official documentation on **[preset security policies](/defender-office-365/preset-security-policies)**.

Additionally, administrators are encouraged to use the [Configuration Analyzer](/defender-office-365/configuration-analyzer-for-security-policies) to identify and remediate deviations from recommended policy baselines.

#### Policy Alignment with Third-Party Vendors

To maintain consistent message handling and threat response across the ecosystem, it is critical to align policy configurations between MDO and the integrated third-party solution. This alignment ensures that messages flagged by either system exhibit predictable behavior and are surfaced appropriately in unified dashboards and quarantine views.

Once policy alignment is established, the remainder of the integration lifecycle - including monitoring, reporting, and response - can be managed directly within the Microsoft 365 Securityportal.

## Portal Experiences

The Microsoft 365 Defender portal provides a comprehensive and integrated experience for managing both native and third-party email security solutions. The following capabilities are enhanced through participation in the API Vendor Ecosystem:

#### Unified Quarantine

Messages quarantined by third-party vendors are surfaced within the Microsoft 365 Defender [quarantine](/defender-office-365/quarantine-about) experience. Security teams can search, preview, release, report, and take remediation actions on these messages using the same workflows applied to Microsoft Defender for Office 365 detections. This unified view reduces operational complexity and ensures consistent handling of threats across the email security stack.

#### Threat Explorer

[Threat Explorer](/defender-office-365/threat-explorer-real-time-detections-about) provides real-time visibility into email threats across the organization. Messages processed by third-party vendors and surfaced through the ecosystem are included in Explorer views, enabling analysts to investigate campaigns, trace message delivery paths, and correlate threat signals across detection sources.

#### Email Entity

The [Email Entity](/defender-office-365/mdo-email-entity-page) page consolidates all available metadata and telemetry for a given message, including headers, delivery events, detection verdicts, and user actions. For messages processed by ecosystem partners, the page includes vendor-specific detection technology, offering a complete forensic view in a single pane of glass.

#### Advanced Hunting

Security teams can use Microsoft 365 Defender’s [Advanced Hunting](/defender-xdr/advanced-hunting-overview) capabilities to query and correlate data across native and third-party detections. Vendor-submitted messages are represented in the [EmailEvents](/defender-xdr/advanced-hunting-emailevents-table) and [EmailPostDeliveryEvents](/defender-xdr/advanced-hunting-emailpostdeliveryevents-table) tables, with extended schema support for partner-specific attributes, including vendor-specific threat details.

Use this example query to see third-party catch in Advanced Hunting.


```kusto
EmailEvents  
| where Timestamp > ago(7d)  
//List emails caught by a Third-party solution 
| where DetectionMethods contains "Thirdparty" 
| project NetworkMessageId, RecipientEmailAddress, ThreatTypes, DetectionMethods, AdditionalFields, LatestDeliveryLocation  
```

## Reporting

The Microsoft 365 Defender portal provides a centralized reporting experience that consolidates telemetry from both Microsoft Defender for Office 365 (MDO) and integrated third-party vendors. This unified view enables security teams to assess the effectiveness of their entire email security stack in one place.

The following dashboards display this information:

**Detection totals**

- *Defender for Office Mailflow blocks*: Messages that MDO caught during mailflow. These are unique messages that the third-party did not catch.

- *Defender for Office Post-delivery blocks*: Messages that MDO caught after delivery, through ZAP. These are unique messages that the third-party did not catch.

- *Non-Microsoft Post-delivery blocks*: Messages that the third-party caught.

- *Duplicate blocks*: Messages that MDO caught during mailflow that the third-party also contributed a verdict on.

- *Duplicate blocks (Defender for Office Post-delivery)*: Messages that MDO caught after delivery, through ZAP, that the third-party also contributed a verdict on.

**Post-delivery catch by non-Microsoft solutions**

- Shows the verdict types that the third-party provided on messages. This report is a breakdown of the Non-Microsoft Post-delivery blocks field in the Detection Totals report.

## Frequently Asked Questions

**I have multiple ICES/CAPES solutions. How does that work?**

You can use this integration with multiple ICES/CAPES vendors as long as they're part of the API Vendor Ecosystem partnership. The integration will work the same, where each third-party is able to provide verdicts on the messages in your mailboxes. You can see the third-party catch and be able to identify which third-party the catch is attributed to, within the security portal experiences. If multiple third parties send verdicts on the same message, both third-party verdicts and explainability will be logged. The highest verdict between the third-party verdicts determines what action is taken on the message.

**Which verdict takes precedence?**

The "highest" verdict takes precedence. The precedence should be as follows (highest to lowest precedence):

Malware

High Confidence Phish

Phish

High Confidence Spam

Spam

Deleted

Junk

Clean or Not Spam

**What if I utilize a different third-party application?**

Currently, this integration only works for authorized partners which are Darktrace and KnowBe4. If you utilize a different ICES/CAPES vendor, you won't be able to take advantage of this integration.

**Will I be charged for the third-party verdict data and actioning by MDO policies?**

No, there is no charge for the integration. The integration and Graph API support are included as part of your Microsoft Defender for Office 365 Plan 2 licenses.

**Why do I not see the Detection Totals and Post-delivery catch by non-Microsoft solutions reports?**

The reports only show if you have activity from one of the authorized third-party partners in the past 90 days.

## Feedback and Support

To provide feedback or request support, contact your Microsoft account team or use the feedback link in the Microsoft 365 Security portal.

