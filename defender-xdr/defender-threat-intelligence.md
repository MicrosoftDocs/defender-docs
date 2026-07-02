---
title: Microsoft Threat Intelligence in Microsoft Defender XDR
ms.reviewer:
description: Learn how Microsoft Threat Intelligence integrates into the Microsoft Defender portal through entity enrichments, threat analytics, and intelligence exploration.
ms.service: defender-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - highpri
  - tier1
ms.custom:
  - cx-ti
  - cx-ta
ms.topic: overview
ms.date: 06/12/2026
ai-usage: ai-assisted
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
#customer intent: As a security analyst, I want to understand how Microsoft Threat Intelligence integrates into the Defender portal so that I can use threat intelligence during investigations.
---

# Microsoft Threat Intelligence in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

> [!IMPORTANT]
> Some information relates to prereleased product that may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

Microsoft Threat Intelligence is fully integrated into the Microsoft Defender portal, delivering threat intelligence directly within investigation workflows. Microsoft Threat Intelligence helps streamline security analyst triage, incident response, threat hunting, and vulnerability management by surfacing critical threat information where analysts need it most.

> [!IMPORTANT]
> The legacy standalone Microsoft Threat Intelligence portal and the Intel Explorer experience will be retired on **August 1, 2026**. All Microsoft Threat Intelligence capabilities are now available in the Microsoft Defender portal. [Read the Microsoft Threat Intelligence convergence announcement](https://techcommunity.microsoft.com/blog/defenderthreatintelligence/mdti-is-converging-into-microsoft-sentinel-and-defender-xdr/4427991).

## Threat intelligence experiences in the Defender portal

Microsoft Threat Intelligence capabilities are available through two primary experiences in the Microsoft Defender portal:

### Entity enrichments (Preview)

Entity pages for IP addresses, domains, URLs, and files are enriched with Microsoft Threat Intelligence data through the **Threat Intelligence Insights** tab. These enrichments surface reputation data, attributed threat reports, sandbox analysis results, and infrastructure relationship data directly in the entity page, enabling in-context investigation without switching tools.

For more information, see [View threat intelligence in entity pages](entity-page-threat-intelligence.md).

### Intelligence explorer

The **Intelligence explorer** provides access to the full Microsoft Threat Intelligence research experience, including:

- **Intel profiles** — Curated content organized by threat actors, their tools, and known vulnerabilities.
- **Intel explorer** — Search and investigate threat intelligence artifacts, indicators of compromise (IOCs), and related analyses.

Access the Intelligence explorer from the **Threat intelligence** navigation menu in the Defender portal.

## Threat analytics

**Threat analytics** is the in-product threat intelligence solution from expert Microsoft security researchers. Threat analytics reports help security teams track active threat actors and campaigns, understand popular and new attack techniques, and assess critical vulnerabilities. Each report provides analysis of tracked threats, guidance on defenses, and data from your network indicating whether the threat is active in your environment.

For more information, see [Threat analytics in Microsoft Defender XDR](threat-analytics.md).

## Get started

Publicly available Microsoft Threat Intelligence data—including entity enrichments on entity pages—is accessible to all Microsoft Defender XDR customers at no extra cost.

To access threat intelligence in the Microsoft Defender portal:

1. Go to the [Microsoft Defender portal](https://security.microsoft.com/) and sign in.
1. Use the **Threat intelligence** navigation menu to access Intelligence explorer and Intel profiles.
1. Investigate entities enriched with threat intelligence by selecting IP addresses, domains, URLs, or files from incidents, alerts, or search results.

## Related content

- [View threat intelligence in entity pages](entity-page-threat-intelligence.md)
- [Threat analytics in Microsoft Defender XDR](threat-analytics.md)
- [IP address entity page](entity-page-ip.md)
- [What is Microsoft Threat Intelligence?](/defender/threat-intelligence/what-is-microsoft-defender-threat-intelligence-defender-ti)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
