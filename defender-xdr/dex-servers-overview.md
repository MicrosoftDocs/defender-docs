---
title: Microsoft Defender Experts for Servers overview
description: Learn about Microsoft Defender Experts for Servers, a managed detection and response service for on-premises and multicloud server workloads.
ms.service: defender-experts
ms.subservice: dex-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-overview
ms.topic: concept-article
ms.custom:
- cx-ti
- cx-dex
- msecd-doc-authoring-1012
search.appverid: met150
ms.date: 04/16/2026

#customer intent: As a security operations professional, I want to understand what Microsoft Defender Experts for Servers is and what it offers so that I can determine whether it's the right managed detection and response service for my organization's server and cloud workloads.

---

# Microsoft Defender Experts for Servers

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

> [!IMPORTANT]
> Defender Experts for Servers is sold separately from other Microsoft Defender XDR products. If you're interested in purchasing Defender Experts for Servers, complete the [Defender Experts customer interest form](https://aka.ms/IWantDefenderExperts).

**Microsoft Defender Experts for Servers** is a managed extended detection and response service that provides expert-driven coverage for on-premises and multicloud servers protected by [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction). It combines automation and Microsoft's security analyst expertise to help you detect and respond to threats targeting your server infrastructure across Microsoft Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

Defender Experts for Servers augments your SOC with threat intelligence and dedicated analyst support to help you:

- **Focus on incidents that matter.** Experts prioritize incidents and alerts related to your server workloads, reduce alert fatigue, and drive SOC efficiency for your team.
- **Manage response your way.** Experts provide actionable, step-by-step guidance to respond to incidents, with the option to act on your behalf.
- **Access expertise when you need it.** Extend your team's capacity with access to Defender Experts for assistance on an investigation.
- **Stay ahead of emerging threats.** Experts proactively hunt for emerging threats in your server environment, informed by unparalleled threat intelligence and visibility.

## Prerequisites and licensing

Defender Experts for Servers is a standalone service that you can purchase independently. To get started with this managed service, you need the following items:

- **Defender for Servers Plan 1 or Plan 2** in Microsoft Defender for Cloud must be enabled.
- **[Endpoint protection](/azure/defender-for-cloud/integration-defender-for-endpoint)** must be turned on for Windows and Linux devices. Endpoint protection enables Defender for Endpoint capabilities, including automatic agent deployment and security data integration with Defender for Cloud.

Depending on the coverage you're looking for, you can enable the Defender for Servers plan for an Azure subscription, AWS account, or GCP project.

For more information, see [Before you begin using Defender Experts for XDR](before-you-begin-xdr.md)

## Service capabilities

Defender Experts for Servers delivers managed security operations for your server workloads through a combination of automation and human expertise. The service includes the following capabilities:

- **Managed detection and response:** Expert analysts manage your server-related incidents in the Microsoft Defender XDR incident queue, handle triage and investigation on your behalf, and partner with your team to take action or guide you through response. For details, see [Managed detection and response](managed-detection-and-response-xdr.md).
- **Proactive threat hunting:** [Microsoft Defender Experts for Hunting](defender-experts-for-hunting.md) is built in to extend your team's threat hunting capabilities and prioritize significant threats targeting your servers.
- **Ask Defender Experts:** Select [Ask Defender Experts](experts-on-demand.md) in the Microsoft Defender portal to get expert advice about threats your organization is facing.
- **Live dashboards and reports:** Get a transparent view of operations on your behalf and noise-free, actionable insights into what matters for you, coupled with detailed analytics. For details, see [Defender Experts for XDR reports](reports-xdr.md).
- **Third-party network signal enrichment:** Enrich your Defender Experts experience with third-party network signals from Palo Alto Networks, Fortinet, and Zscaler to gain a more comprehensive view of an attack's path. For details, see [Third-party network signal enrichment](third-party-enrichment-defender-experts.md).

## Server and cloud workload coverage

Defender Experts for Servers covers **all** servers in your tenant that have [Defender for Servers](/azure/defender-for-cloud/defender-for-servers-overview) protection enabled in Defender for Cloud. This coverage includes multicloud servers across Azure, AWS, and GCP, provided that Defender for Endpoint is installed on the servers.

All Defender for Servers Plan 1 and Plan 2 alerts (Detection Source = Microsoft Defender for Servers) are in scope. [DNS alerts](/azure/defender-for-cloud/alerts-dns) are excluded from coverage due to limited data available for investigation.

<!-- TODO: Confirm whether scoped coverage (defender-experts-scoped-coverage.md) applies to standalone Defender Experts for Servers. -->

## Relationship to Defender Experts for XDR

Defender Experts for Servers is a standalone service that focuses on your server and cloud workload security. Unlike previous offerings, it doesn't require a [Microsoft Defender Experts for XDR](dex-xdr-overview.md) enrollment. You can purchase and use Defender Experts for Servers independently.

If your organization also has Defender Experts for XDR, the two services complement each other. Defender Experts for XDR covers your broader Microsoft Defender XDR environment (endpoints, email, identity, and cloud apps), while Defender Experts for Servers provides dedicated coverage for your server infrastructure protected by Defender for Cloud.

## Related content

- [Managed detection and response](managed-detection-and-response-xdr.md)
- [Understanding Defender Experts coverage for servers and cloud workloads](faq-cloud-coverage-defender-experts.md)
- [Get real-time visibility with Defender Experts for XDR reports](reports-xdr.md)
- [Communicating with experts in the Microsoft Defender Experts for XDR service](communicate-defender-experts-xdr.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
