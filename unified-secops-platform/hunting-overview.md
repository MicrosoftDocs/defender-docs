---
title: Threat hunting features across Microsoft's unified security operations platform
description: Learn about threat hunting features across Microsoft's unified security operations (SecOps) platform.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: austinmc
author: austinmccollum
ms.localizationpriority: medium
ms.date: 11/23/2024
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: conceptual

# customer intent: As a security operations center business decision maker, I want to learn about threat hunting tools available in Microsoft's unified SecOps platform so I can get visibility into, and disrupt attacks in real time across identities, endpoints, email, cloud apps, data in hybrid and multicloud environments.
---

# Hunting in Microsoft's unified SecOps platform

Hunting for security threats is a highly customizable activity that is most effective when accomplished across all stages of threat hunting: proactive, reactive, and post incident. Microsoft's unified security operations (SecOps) platform provides effective hunting tools for every stage of threat hunting. These tools are well fit for analysts who are just starting out in their career, or experienced threat hunters using advanced hunting methods. Threat hunters of all levels benefit from hunting tool features that allow them to share their techniques, queries, and findings with their team along the way.

## Hunting tools

The foundation of hunting queries in the Defender portal rests on Kusto Query Language (KQL). KQL is a powerful and flexible language that's optimized for searching through big-data stores in cloud environments. However, crafting complex queries isn't the only way to hunt for threats. Here are some more hunting tools and resources within the Defender portal designed to bring hunting into your reach:

- [**Security Copilot in advanced hunting**](/defender-xdr/advanced-hunting-security-copilot) generates KQL from natural language prompts.
- [**Guided hunting**](/defender-xdr/advanced-hunting-query-builder) uses a query builder for crafting meaningful hunting queries without knowing KQL or the data schema.
- [**Get help as you write queries**](/defender-xdr/advanced-hunting-query-language#get-help-as-you-write-queries) with features like autosuggest, schema tree, and sample queries.
- [**Content hub**](/azure/sentinel/sentinel-solutions-deploy?tabs=azure-portal#hunting-query) provides expert queries to match out-of-the-box solutions in Microsoft Sentinel.
- [**Microsoft Defender Experts for Hunting**](/defender-xdr/advanced-hunting-overview) compliments even the best threat hunters that want assistance.

Maximize the full extent of your team's hunting prowess with the following hunting tools in the Defender portal:

| Hunting tool | Description |
|---|---|
|[**Advanced hunting**](/defender-xdr/advanced-hunting-microsoft-defender) | View and query data sources available within Microsoft's unified SecOps platform and share queries with your team. Use all your existing Microsoft Sentinel workspace content, including queries and functions. |
|[**Microsoft Sentinel hunting**](/azure/sentinel/hunting) | Hunt for security threats across data sources. Use specialized search and query tools like **hunts**, **bookmarks** and **livestream**. |
|[**Go hunt**](/defender-xdr/advanced-hunting-go-hunt) | Quickly pivot an investigation to entities found within an incident. |
|[**Hunts**](/azure/sentinel/hunts) | An end-to-end, proactive threat hunting process with collaboration features. |
|[**Bookmarks**](/azure/sentinel/bookmarks) | Preserve queries and their results, adding notes and contextual observations.|
|[**Livestream**](/azure/sentinel/livestream) | Start an interactive hunting session and use any Log Analytics query. |
|[**Hunting with summary rules**](/azure/sentinel/summary-rules#quickly-find-a-malicious-ip-address-in-your-network-traffic) | Use summary rules to save costs hunting for threats in verbose logs.|
|[**MITRE ATT&CK map**](/azure/sentinel/mitre-coverage#use-the-mitre-attck-framework-in-analytics-rules-and-incidents) | When creating a new hunting query, select specific tactics and techniques to apply.|
|[**Restore historical data**](/azure/sentinel/restore) | Restore data from archived logs to use in high performing queries. |
|[**Search large data sets**](/azure/sentinel/search-jobs?tabs=defender-portal) | Search for specific events in logs up to seven years ago using KQL. |
|[**Infrastructure chaining**](/defender/threat-intelligence/infrastructure-chaining) | Hunt for new connections between threat actors, group similar attack activity and substantiate assumptions.|
|[**Threat explorer**](/defender-office-365/threat-explorer-threat-hunting) | Hunt for specialized threats related to email. |

## Hunting stages

The following table describes how you can make the most of the Defender portal's hunting tools across all stages of threat hunting:

| Hunting stage | Hunting tools |
| --- | --- |
| **Proactive** - Find the weak areas in your environment before threat actors do. Detect suspicious activity extra early. | - Regularly conduct end-to-end [hunts](/azure/sentinel/hunts) to proactively seek out undetected threats and malicious behaviors, validate hypotheses, and act on findings by creating new detections, incidents, or threat intelligence.<br><br> - Use the [MITRE ATT&CK map](/azure/sentinel/mitre-coverage#use-the-mitre-attck-framework-in-analytics-rules-and-incidents) to identify detection gaps, and then run predefined hunting queries for highlighted techniques.<br><br> - Insert new threat intelligence into proven queries to tune detections and confirm if a compromise is in process.<br><br> - Take proactive steps to build and test queries against data from new or updated sources.<br><br> - Use [advanced hunting](/defender-xdr/advanced-hunting-microsoft-defender) to find early-stage attacks or threats that don't have alerts. |
| **Reactive** - Use hunting tools during an active investigation. | - Use [livestream](/azure/sentinel/livestream) to run specific queries at consistent intervals to actively monitor events.<br><br> - Quickly pivot on incidents with the [**Go hunt**](/defender-xdr/advanced-hunting-go-hunt) button to search broadly for suspicious entities found during an investigation.<br><br> - Hunt through threat intelligence to perform [infrastructure chaining](/defender/threat-intelligence/infrastructure-chaining).<br><br> - Use [Security Copilot in advanced hunting](/defender-xdr/advanced-hunting-security-copilot) to generate queries at machine speed and scale. |
| **Post incident** - Improve coverage and insights to prevent similar incidents from recurring. | - Turn successful hunting queries into new [analytics and detection rules](/azure/sentinel/threat-detection), or refine existing ones.<br><br> - [Restore historical data](/azure/sentinel/restore) and [search large datasets](/azure/sentinel/search-jobs?tabs=defender-portal) for specialized hunting as part of full incident investigations. |


## Related content

- [Threat detection in Microsoft's unified SecOps platform](/unified-secops-platform/detect-threats-overview)
- [Security posture management and risk reduction](/unified-secops-platform/reduce-risk-overview)
- [Service integration](/unified-secops-platform/overview-defender-portal)
