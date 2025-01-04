---
title: Microsoft Defender Threat Intelligence (Defender TI) Analyst insights
description: Learn about the Microsoft Defender Threat Intelligence (Defender TI)'s Analyst insights feature.
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

# Analyst insights

>[!IMPORTANT] 
> On June 30, 2024, The Microsoft Defender Threat Intelligence (Defender TI) standalone portal (`https://ti.defender.microsoft.com`) was retired and is no longer accessible. Customers can continue using Defender TI in the [Microsoft Defender portal](https://aka.ms/mdti-intel-explorer) or with [Microsoft Security Copilot](security-copilot-and-defender-threat-intelligence.md). [Learn more](https://aka.ms/mdti-standaloneportal)

In Microsoft Defender Threat Intelligence (Defender TI), the **Analyst insights** section provides you with quick insights about an artifact that might help determine your next step in an investigation. This section lists any insights that apply to the artifact, and insights that don't apply for extra visibility. 

In the following example, you can quickly determine that the IP address is routable, hosts a web server, and had an open port within the past five days. Furthermore, the system displays rules that weren't triggered, which can be equally helpful when kick starting an investigation.

:::image type="content" source="/defender/threat-intelligence/media/analyst-insights.png" alt-text="Analyst insights screenshot." lightbox="/defender/threat-intelligence/media/analyst-insights.png":::

## Analyst insight types and questions they can address

|Analyst insight types|Questions they can address|
|---|---|
|Blocklisted|Is/When was the domain, host, or IP address blocklisted?|
||How many times has Defender TI blocklisted the domain, host, or IP address?|
|Registered and updated|How many days, months, and years ago was the domain registered?|
||When was the domain WHOIS record updated?|
|Subdomain IP count|How many different IP addresses are associated with the subdomains of the domain?|
|New subdomain observations|When was the last time Microsoft observed a new subdomain for the domain in question?|
|Registered and resolving|Does the domain queried exist?|
||Does the domain resolve to an IP address?|
|Number of domains sharing the WHOIS record|What other domains share the same WHOIS record?|
|Number of domains sharing the name server|What other domains share the same name server record?|
|Crawled by RiskIQ|When was this host or domain last crawled by Microsoft?|
|International domain|Is the domain queried for an international domain name (IDN)?|
|Blocklisted by third party|Is this indicator blocklisted by a third party?|
|Tor exit node status|Is the IP address in questions associated with The Onion Router (Tor) network?|
|Open ports detected|When did Microsoft last port scan this IP address?|
|Proxy status|What is the proxy status of this indicator?|
|Host last observed|Is the IP address in question internet accessible?|
|Hosts a web server|Does the IP address have a Domain Name System (DNS) server that uses its resources to resolve the name into it for the appropriate web server?|

### See also

- [Reputation scoring](reputation-scoring.md)
- [Using tags](using-tags.md)
