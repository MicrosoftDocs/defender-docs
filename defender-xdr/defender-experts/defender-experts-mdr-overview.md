---
title: What is Microsoft Defender Experts MDR?
ms.reviewer:
description: Learn how Microsoft Defender Experts MDR Plan 1 and Plan 2 deliver managed detection and response, and find out which plan fits your environment.
ms.service: defender-experts-for-xdr
ms.author: marshmacy
author: mmacy-msft
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - essentials-overview
ms.topic: overview
ms.custom: 
- cx-ti
- cx-dex
- msecd-doc-authoring-1018
ms.date: 07/29/2026
ai-usage: ai-assisted

#customer intent: As a security operations leader, I want to understand what each Defender Experts MDR plan covers so that I can choose the plan that fits my environment.
---

# What is Microsoft Defender Experts MDR?

**Applies to:**

- Microsoft Defender Experts MDR Plan 1
- Microsoft Defender Experts MDR Plan 2

Microsoft Defender Experts MDR is a managed detection and response service. Microsoft security analysts manage your incident queue around the clock, triage and investigate incidents on your behalf, and either take action or guide your team through the response. The service augments your security operations center (SOC) rather than replacing it, so your team spends less time on alert volume and more time on the threats that affect your organization.

Defender Experts MDR is available in two plans. Plan 1 delivers managed detection and response for your Microsoft Defender workloads. Plan 2 includes everything in Plan 1 and extends the same expert-led detection, investigation, response, and threat hunting to selected non-Microsoft telemetry that you collect in Microsoft Sentinel.

> [!IMPORTANT]
> Microsoft Defender Experts MDR is sold separately from other Microsoft Defender products. Microsoft Defender customers interested in purchasing Defender Experts MDR as a standalone offering can complete the [customer interest form](https://aka.ms/IWantDefenderExperts).
>
> Defender Experts MDR is also available as part of the **Microsoft Defender Experts Suite**. Customers interested in the suite can learn more on the [Defender Experts Suite service page](https://www.microsoft.com/security/services/) and [contact the Microsoft Security team](https://info.microsoft.com/ww-landing-microsoft-defender-contact-me.html) for follow-up.

> [!NOTE]
> Any incident response services offered by Defender Experts are offered under the Defender Experts Service Terms.

## Which plan is right for you

Both plans deliver the same expert-led service model. They differ in the telemetry that Defender Experts analysts triage and investigate on your behalf.

- **Plan 1** delivers managed detection and response for your Microsoft Defender workloads. It's the choice for organizations whose security operations center primarily works inside Microsoft Defender.
- **Plan 2** includes everything in Plan 1 and extends the same expert-led service to selected non-Microsoft security telemetry that you collect in Microsoft Sentinel. It's designed for organizations that need visibility into both their Microsoft and non-Microsoft environments. Plan 2 requires Microsoft Sentinel.

> [!TIP]
> If your security operations are centered on Microsoft Defender, start with Plan 1. If you also collect security signals from business-critical systems outside the Microsoft ecosystem, such as non-Microsoft firewalls, identity providers, or cloud platforms, Plan 2 brings that telemetry into the same expert-led managed service.

## Defender Experts MDR Plan 1

Plan 1 focuses on your Microsoft Defender telemetry. Expert analysts detect threats using Microsoft Defender security signals, manage your incident queue, and handle triage, investigation, and response guidance for your Microsoft Defender workloads.

Plan 1 includes these capabilities:

- **Managed detection and response** – Expert analysts manage your Microsoft Defender incident queue and handle triage and investigation on your behalf. They partner with you to take action or guide you through the response.
- **Proactive threat hunting** – [Microsoft Defender Experts Hunting](defender-experts-hunting-overview.md) is built in to extend your team's threat hunting capabilities and prioritize significant threats.
- **Ask Defender Experts** – Select [Ask Defender Experts](defender-experts-hunting-ask-experts.md) in the Microsoft Defender portal to get expert advice about a specific incident, or about notifications related to a nation-state actor or attack vector.
- **Live dashboards and reports** – Get a transparent, noise-free view of the work done on your behalf, along with detailed analytics.
- **Proactive check-ins** – Meet periodically with your service delivery team to guide your experience and improve your security posture.

Plan 1 is the service previously offered as Defender Experts for XDR, which was later renamed Defender Experts MDR. The service is the same; only the name changed.

> [!NOTE]
> Security Delivery Experts (SDXs) are included in Plan 1 if your Defender Experts MDR service is licensed for 1500 or more seats, cloud workloads, or both.

For the Microsoft Defender products that Plan 1 covers and the licensing each one requires, see [Service coverage prerequisites](defender-experts-mdr-prerequisites.md#service-coverage-prerequisites).

> [!NOTE]
> Third-party network signal enrichment is deprecated in Plan 1, effective September 1, 2026, and is closed to new enablement. If enrichment is enabled for your organization, coverage continues until your next renewal and ends at renewal. Expert-led coverage of non-Microsoft telemetry is delivered through Plan 2. For more information, see [Defender Experts MDR Plan 2](#defender-experts-mdr-plan-2).

## Defender Experts MDR Plan 2

Plan 2 includes everything in Plan 1 and extends the same expert-led detection, investigation, response, and threat hunting to selected non-Microsoft telemetry that you collect in Microsoft Sentinel. Microsoft Sentinel is a prerequisite for Plan 2.

Attackers rarely stay within one technology stack. An investigation might begin on a Microsoft-secured endpoint, move through a non-Microsoft identity provider, reach a cloud platform, and generate events on a non-Microsoft firewall. Microsoft Sentinel provides the platform for collecting and correlating that telemetry, and Defender Experts delivers the expert-led investigation and response for it.

In addition to everything in Plan 1, Plan 2 adds these capabilities:

- **Detection and investigation of selected third-party telemetry** – Expert analysts monitor alerts, and triage and investigate incidents, for your Microsoft Defender workloads and for supported third-party workloads in Microsoft Sentinel.
- **Expert-authored Microsoft Sentinel content** – Defender Experts create analytics rules, automation rules, and security orchestration, automation, and response (SOAR) playbooks to detect, triage, and respond to suspicious activity, and apply suppression to reduce noise. This includes correlation detections that chain signals from identity, endpoint, cloud, network, and email to surface end-to-end attack scenarios rather than isolated alerts.
- **Response guidance for supported third-party products** – For Microsoft Defender workloads, Defender Experts take action or provide guided response. For supported third-party products, Defender Experts provide guidance on the response actions to take.
- **Microsoft Sentinel health monitoring** – Defender Experts monitor the health of built-in connectors and the Microsoft Sentinel content they deploy, and notify you when corrective action is needed to keep detection and monitoring operational.
- **Microsoft Sentinel cost optimization guidance** – Defender Experts evaluate and advise on cost optimization measures, such as retention policies, data source selection, data collection rules, and built-in connectors, without sacrificing telemetry visibility.
- **A dedicated security delivery expert** – Defender Experts assigns a security delivery expert who manages the overall service relationship, leads environment discovery, owns escalations, and delivers regular reporting and briefings.

Reporting for Plan 2 is delivered through the existing Defender Experts reports and includes third-party hunting and operations data alongside your Microsoft Defender data.

Because Plan 2 operates on Microsoft Sentinel data, it requires a Microsoft Sentinel workspace and supporting configuration for the sources you want covered. For those requirements, see [Before you begin using Defender Experts MDR](defender-experts-mdr-prerequisites.md).

> [!NOTE]
> Defender Experts MDR Plan 2 requires a minimum of 1,500 licensed seats and is available in the same regions as Defender Experts MDR Plan 1. Contact your Microsoft account team to confirm availability for your organization.

### Third-party source coverage for Plan 2

In addition to the Microsoft Defender coverage included with Plan 1, Plan 2 covers these non-Microsoft sources:

| Category | Source |
|---|---|
| Identity protection | Okta |
| Email security | Proofpoint TAP |
| Cloud infrastructure security | AWS CloudTrail |
| Cloud infrastructure security | AWS GuardDuty |
| Network security and firewalls | Palo Alto PAN-OS next-generation firewall |
| Network security and firewalls | Cisco ASA/Meraki |
| Network security and firewalls | Zscaler ZIA/ZPA |
| Network security and firewalls | Fortinet FortiGate |

Defender Experts evaluate adding new sources case by case. Changes to scope are reflected in this documentation as they become available.

## Compare Plan 1 and Plan 2

Use this comparison to see what each plan covers and where the two plans differ.

| Capability | Plan 1 | Plan 2 |
|---|---|---|
| **Coverage** | | |
| Microsoft Defender workloads | Included | Included |
| Third-party sources through Microsoft Sentinel | Not included | Included for supported sources |
| **Managed operations** | | |
| Alert monitoring | Microsoft Defender workloads | Microsoft Defender workloads and supported third-party workloads |
| Incident triage and investigation | Microsoft Defender workloads | Microsoft Defender workloads and supported third-party workloads |
| Managed response | Microsoft Defender workloads: action or guided response | Microsoft Defender workloads: action or guided response. Supported third-party workloads: response guidance |
| Proactive threat hunting | Included | Included |
| Ask Defender Experts | Included | Included |
| Live dashboards and reports | Included | Included |
| **Microsoft Sentinel** | | |
| Microsoft Sentinel required | No | Yes |
| Expert-authored Microsoft Sentinel content | Not included | Included |
| Connector health monitoring and tuning guidance | Not included | Included |
| Cost optimization guidance | Not included | Included |
| **Service engagement** | | |
| Onboarding | Included | Included |
| Proactive check-ins | Included | Included |
| Security delivery expert | For qualified customers | Included |

## Service boundaries

Knowing what the service doesn't do is as important as knowing what it does.

**Plan 2 isn't a managed security information and event management (SIEM) service.** Defender Experts operates on the supported data in your Microsoft Sentinel workspace and on the detection content that Defender Experts authors. You continue to own your Microsoft Sentinel deployment, including:

- Deploying and maintaining data connectors.
- Building and running custom ingestion pipelines.
- Migrating content from another SIEM.
- Creating and maintaining your own analytics rules and other content.
- Managing data quality, retention, permissions, and ingestion costs.

**Neither plan covers Microsoft Defender for Cloud workloads.** Cloud workloads such as storage, containers, and databases aren't included in either plan. Plan 2 coverage of multicloud telemetry through Microsoft Sentinel is separate from cloud workload protection. Managed detection and response for hybrid and multicloud servers is available separately through [Microsoft Defender Experts for Servers](defender-experts-servers-overview.md).

**Neither plan is an incident response engagement.** Defender Experts MDR doesn't provide incident response services for an active compromise. For that, see [Microsoft Defender Experts Cybersecurity Incident Response](https://www.microsoft.com/security/business/microsoft-incident-response).

## Related content

- [Before you begin using Defender Experts MDR](defender-experts-mdr-prerequisites.md)
- [Get started with Defender Experts MDR](defender-experts-mdr-get-started.md)
- [General information on Defender Experts MDR service](defender-experts-mdr-faq.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/defender-m3d-techcommunity.md)]
