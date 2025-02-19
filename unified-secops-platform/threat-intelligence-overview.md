---
title: Uncover adversaries with threat intelligence in Microsoft's unified SecOps platform
ms.reviewer: 
description: Learn about threat intelligence features across Microsoft's unified security operations (SecOps) platform.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: dolmont
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.custom:
- cx-ti
ms.topic: conceptual
ms.date: 01/24/2025
# customer intent: As a security operations center business decision maker, I want to learn about threat intelligence tools available in Microsoft's unified SecOps platform to help me understand emerging threats affecting organizations like me and how to manage actionable intelligence.
---

# Uncover adversaries with threat intelligence in Microsoft's unified SecOps platform

Uncover and neutralize modern adversaries with threat intelligence in Microsoft’s unified security operations (SecOps) platform. Whether you use Microsoft's threat intelligence or other sources important to your SecOps organization, **Threat intelligence** in the Microsoft Defender portal unifies the tools needed to identify cyberattackers and their infrastructure.

:::image type="content" source="/unified-secops-platform/media/threat-intel-overview/usx-threat-intel.png" alt-text="Screenshot of Threat intelligence section of the Microsoft Defender portal." lightbox="/unified-secops-platform/media/threat-intel-overview/usx-threat-intel.png":::

_Threat intelligence in the Defender portal_

The emergence of new cybersecurity threats and threat actors and the continuous evolution of the threat landscape result in an ever-increasing amount of threat intelligence that security operations centers (SOCs) must investigate. This threat intelligence takes many forms—from specific indicators of compromise (IOCs) to reports and analyses—and can come from various sources. Microsoft's unified SecOps platform in the Defender portal consolidates all your threat intelligence in one location so SOCs can assess this intelligence quickly and accurately to make informed decisions. Microsoft's unified SecOps platform in the Defender portal pulls threat intelligence from the following sources:
- Microsoft Defender XDR Threat analytics reports
- Microsoft Defender Threat Intelligence articles and data sets
- Microsoft Sentinel threat intelligence

## Threat analytics in Microsoft Defender XDR

**Threat analytics** is the [Microsoft Defender XDR](/defender-xdr/microsoft-365-defender) in-product threat intelligence solution from expert Microsoft security researchers. It's designed to assist security teams to be as efficient as possible while facing emerging threats, such as:
- Active threat actors and their campaigns
- Popular and new attack techniques
- Critical vulnerabilities
- Common attack surfaces
- Prevalent malware

:::image type="content" source="/unified-secops-platform/media/threat-intel-overview/usx-threat-analytics.png" alt-text="The analyst report section of a threat analytics report" lightbox="/unified-secops-platform/media/threat-intel-overview/usx-threat-analytics.png":::

_Analyst report section of a threat analytics report_

Each report provides an analysis of a tracked threat and extensive guidance on how to defend against that threat. It also incorporates data from your network, indicating whether the threat is active and if you have applicable protections in place. 

For more information, see [Threat analytics in Microsoft Defender XDR](/defender-xdr/threat-analytics).

## Microsoft Defender Threat Intelligence

**Microsoft Defender Threat Intelligence** (Defender TI) helps streamline security analyst triage, incident response, threat hunting, and vulnerability management workflows. Defender TI aggregates and enriches critical threat information in an easy-to-use interface where users can correlate IOCs with related articles, actor profiles, and vulnerabilities. Defender TI also lets analysts collaborate with fellow Defender TI-licensed users within their tenant on investigations.

You can access Defender TI in the following pages within the **Threat intelligence** navigation menu of the Defender portal:
- **Intel profiles** - Access a comprehensive library of threat actor, tooling, and vulnerability profiles.
- **Intel explorer** - Browse threat intelligence for relevant analyses, artifacts, and indicators.
- **Intel projects** - Manage security artifacts for your entire tenant.

:::image type="content" source="/unified-secops-platform/media/threat-intel-overview/usx-intel-explorer.png" alt-text="Screenshot of Intel explorer page." lightbox="/unified-secops-platform/media/threat-intel-overview/usx-intel-explorer.png":::

_Defender TI's **Intel explorer** page in the Defender portal_

For more information, see [What is Microsoft Defender Threat Intelligence?](/defender/threat-intelligence/what-is-microsoft-defender-threat-intelligence-defender-ti).

## Threat intelligence management
**Intel management** is powered by [Microsoft Sentinel](/azure/sentinel/overview) and provides tools to update, search, and create threat intelligence and manage it at scale. 

The most common forms of threat intelligence are threat indicators, or IOCs. Another facet of threat intelligence represents threat actors, their techniques, tactics, and procedures (TTPs), their infrastructure, and their victims. Intel management supports managing all these facets using structured threat information expression (STIX), the open-source standard for exchanging threat intelligence.

Intel management operationalizes your threat intelligence while Microsoft Sentinel sources it with the following methods of ingestion: 
- **Import threat intelligence** into Microsoft Sentinel by enabling data connectors to various threat intelligence platforms, including Microsoft’s own Defender TI.
- **Connect threat intelligence** to Microsoft Sentinel by using the upload API to connect various threat intelligence platforms or custom applications.
- **Create threat intelligence** individually or import using a file from the Intel management interface.

:::image type="content" source="/unified-secops-platform/media/threat-intel-overview/usx-sentinel-new-stix-object.png" alt-text="Screenshot of Intel management add new STIX object feature." lightbox="/unified-secops-platform/media/threat-intel-overview/usx-sentinel-new-stix-object.png":::

_Example of adding a new STIX object in Intel management_

For more information, see [Understand threat intelligence in Microsoft Sentinel](/azure/sentinel/understand-threat-intelligence).

## Related content

- [Microsoft Defender XDR integration with Microsoft Sentinel](/azure/sentinel/microsoft-365-defender-sentinel-integration)
- [Microsoft Security Copilot in Microsoft Defender Threat Intelligence](/defender/threat-intelligence/security-copilot-and-defender-threat-intelligence)
- [Infrastructure chaining](/defender/threat-intelligence/infrastructure-chaining)
