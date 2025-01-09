---
title: Microsoft Defender Threat Intelligence (Defender TI) reputation scoring
description: Learn about the Microsoft Defender Threat Intelligence (Defender TI)'s reputation scoring feature.
author: alexroland24
ms.author: aroland
manager: dolmont
ms.service: threat-intelligence
ms.topic: overview
ms.date: 11/18/2024
ms.custom: 
- template-overview
- cx-ti
- cx-mdti
---

# Reputation scoring

>[!IMPORTANT] 
> On June 30, 2024, The Microsoft Defender Threat Intelligence (Defender TI) standalone portal (`https://ti.defender.microsoft.com`) was retired and is no longer accessible. Customers can continue using Defender TI in the [Microsoft Defender portal](https://aka.ms/mdti-intel-explorer) or with [Microsoft Security Copilot](security-copilot-and-defender-threat-intelligence.md). [Learn more](https://aka.ms/mdti-standaloneportal)

Microsoft Defender Threat Intelligence (Defender TI) provides proprietary reputation scores for any host, domain, or IP address. Whether validating the reputation of a known or unknown entity, this score helps you quickly understand any detected ties to malicious or suspicious infrastructure. Defender TI provides quick information about the activity of these entities (for example, first- and last-seen timestamps, autonomous system numbers, and associated infrastructure) and a list of rules that affect the reputation score when applicable.

Reputation data is important to understanding the trustworthiness of your own attack surface and is also useful when assessing unknown hosts, domains, or IP addresses that appear in investigations. These scores uncover any prior malicious or suspicious activity that affected the entity, or other known indicators of compromise (IOCs) that should be considered.

:::image type="content" source="/defender/threat-intelligence/media/reputation-scoring.png" alt-text="Reputation scoring screenshot." lightbox="/defender/threat-intelligence/media/reputation-scoring.png":::

## Understanding reputation scores

Reputation scores are determined by a series of algorithms designed to quantify the risk associated with an entity quickly. We develop reputation scores based on our proprietary data by using our crawling infrastructure and on IP information collected from external sources.

:::image type="content" source="/defender/threat-intelligence/media/reputation-score-summary-card.png" alt-text="Reputation summary card." lightbox="/defender/threat-intelligence/media/reputation-score-summary-card.png":::

## Detection methods

A series of factors determines reputation scores, including known associations to blocklisted entities and a series of machine learning rules used to assess risk.

## Scoring brackets

Reputation scores are displayed as a numerical score with a range from zero to 100. An entity with a score of `0` doesn't have associations to suspicious activity or known IOCs; a score of `100` indicates that the entity is malicious. Hosts, domains, and IP addresses are grouped into the following categories depending on their numerical score:

|Score|Category|Description|
|---|---|---|
|75+|Malicious|The entity has confirmed associations to known malicious infrastructure that appears on our blocklist and matches machine learning rules that detect suspicious activity.|
|50 – 74|Suspicious|The entity is likely associated to suspicious infrastructure based on matches to three or more machine learning rules.|
|25 – 49|Neutral|The entity matches at least two machine learning rules.|
|0 – 24|Unknown (Green)|The entity returned at least one matched rule.|
|0 – 24|Unknown (Grey)|The entity didn't return any rule matches.|

## Detection rules

Reputation scores are based on many factors that you might reference to determine the relative quality of a domain or address. These factors are reflected in the machine learning rules that comprise the reputation scores. For example, `.xyz` or `.cc` top-level domains (TLDs) are more suspicious than `.com` or `.org` TLDs. An autonomous system number (ASN) hosted by a low-cost or free hosting provider is more likely to be associated with malicious activity, as would a self-signed TLS certificate. This reputation model was developed by looking at relative occurrences of these features among both malicious and benign indicators to score the overall reputation of an entity.

Refer to the following table for examples of rules used to determine if a host, domain, or IP address is suspicious.

> [!IMPORTANT]
> This list isn't comprehensive and is constantly changing; our detection logic and consequent capabilities are dynamic as they reflect the evolving threat landscape. For this reason, we don't publish a comprehensive list of the machine learning rules used to assess an entity's reputation.

|Rule Name|Description|
|---|---|
|TLS certificate self-signed|Self-signed certificates might indicate malicious behavior|
|Tagged as malicious|Tagged as malicious by a member within your organization|
|Web components observed|The number of web components observed might indicate maliciousness|
|Name server|Domain is using a name server that is more likely to be used by malicious infrastructure|
|Registrar|Domains registered with this registrar are more likely to be malicious|
|Registrant email provider|Domain is registered with an email provider that is more likely to register malicious domains|

It's important to remember that these factors must be assessed holistically to make an accurate assessment on the reputation of an entity. The specific combination of indicators, rather than any individual indicator, can predict whether an entity is likely to be malicious or suspicious.

## Severity

Rules created for the machine learning detection system have a severity rating applied. Each rule is assigned **High**, **Medium**, or **Low** severity based on the level of risk associated with the rule.

## Use cases

### Incident triage, response, and threat hunting

Defender TI's reputation score, classification, rules, and description of rules can be used to quickly assess if an IP address or domain indicator is good, suspicious, or malicious. Other times, we might not observe enough infrastructure associated with an IP address or domain to infer if the indicator is good or bad. If an indicator has an unknown or neutral classification, you're encouraged to perform a deeper investigation by reviewing our data sets to infer if the indicator is good or bad. If an indicator's reputation includes an article association, you're encouraged to review those listed articles to learn more about how the indicator is linked to a potential threat actor's campaign; what industries or nations they might be targeting; and what associated techniques, tactics, and procedures (TTPs) they might have; and identify other related IOCs to broaden the scope of your incident's response and hunting efforts.

### Intelligence gathering

You can share any associated articles with your threat intelligence team, so they have a clearer understanding of who might be targeting their organization.

### See also

- [Analyst insights](analyst-insights.md)