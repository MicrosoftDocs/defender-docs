--- 
title: 'Microsoft Defender Threat Intelligence (Defender TI): Infrastructure chaining'
description: 'Learn about infrastructure chaining and how you can apply that process to perform threat infrastructure analysis using Microsoft Defender Threat Intelligence (Defender TI).'
author: alexroland24
ms.author: aroland
manager: dolmont
ms.service: threat-intelligence 
ms.topic: conceptual
ms.date: 11/18/2024
ms.custom: 
- template-overview
- cx-ti
- cx-mdti
---

# Infrastructure chaining

>[!IMPORTANT] 
> On June 30, 2024, The Microsoft Defender Threat Intelligence (Defender TI) standalone portal (`https://ti.defender.microsoft.com`) was retired and is no longer accessible. Customers can continue using Defender TI in the [Microsoft Defender portal](https://aka.ms/mdti-intel-explorer) or with [Microsoft Security Copilot](security-copilot-and-defender-threat-intelligence.md). [Learn more](https://aka.ms/mdti-standaloneportal)

Infrastructure chaining uses the relationships between highly connected datasets to build out an investigation. This process is the core of threat infrastructure analysis and allows organizations to surface new connections, group similar attack activity and substantiate assumptions during incident response.

![Infrastructure chaining](media/infrastructureChaining.png)

## Prerequisites

Review the following Defender TI articles:
- [Data sets](data-sets.md)
- [Searching and pivoting](searching-and-pivoting.md)

## All you need is a starting point

We see attack campaigns employ a wide array of obfuscation techniques--from simple geo-filtering to complex tactics like passive OS fingerprinting. These techniques could potentially stop a point in time investigation in its tracks. The preceding image highlights the concept of infrastructure chaining. With our data enrichment capability, we could start with a piece of malware that attempts to connect to an IP address (possibly a command and control server). That IP address might have hosted a TLS certificate that has a common name, such as a domain name. That domain might be connected to a page that contains a unique tracker in the code, such as a NewRelicID or some other analytic ID we might have observed elsewhere. Or, perhaps the domain might have historically been connected to other infrastructure that might shed light on our investigation. The main takeaway is that one data point taken out of context might not be especially useful but when we observe the natural connection to all this other technical data, we can start to stitch together a story.

## An adversary's outside-in perspective

An adversary's outside-in perspective enables them to take advantage of your continually expanding web and mobile presence that operates outside of your firewall.

Approaching and interacting with the web and mobile properties as a real user enables Microsoft's crawling, scanning, and machine-learning technology to disarm adversaries' evasion techniques by collecting user session data and detecting phishing, malware, rogue apps, unwanted content, and domain infringement at scale. This approach helps deliver actionable, event-based threat alerts and workflows in the form of [threat intelligence](what-is-microsoft-defender-threat-intelligence-defender-ti.md), [system tags](using-tags.md), [analyst insights](analyst-insights.md), and [reputation scores](reputation-scoring.md) associated with adversaries' infrastructure.

As more threat data becomes available, more tools, education, and effort are required for analysts to understand the data sets and their corresponding threats. Microsoft Defender Threat Intelligence (Defender TI) unifies these efforts by providing a single view into multiple data sources.

### See also
- [Tutorial: Gathering threat intelligence and infrastructure chaining](gathering-threat-intelligence-and-infrastructure-chaining.md)