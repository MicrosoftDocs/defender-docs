---
title: Incidents and alerts in the Microsoft Defender portal
description: An introduction to incidents and alerts, and the differences between them, in the unified security operations platform in the Microsoft Defender portal.
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: yelevin
author: yelevin
ms.localizationpriority: medium
manager: raynew
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - usx-security
  - sentinel-only
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
search.appverid:
  - MOE150
  - MET150
ms.date: 11/14/2024
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Incidents and alerts in the Microsoft Defender portal

The Microsoft Defender portal brings together a unified set of security services to reduce your exposure to security threats, improve your organizational security posture, detect security threats, and investigate and respond to breaches. These services collect and produce signals that are displayed in the portal. The two main kinds of signals are:

**Alerts**: Signals that result from various threat detection activities. These signals indicate the occurrence of malicious or suspicious events in your environment.

**Incidents**: Containers that include collections of related alerts and tell the full story of an attack. The alerts in a single incident might come from all Microsoft security and compliance solutions, as well as from vast numbers of external solutions collected through Microsoft Sentinel and Microsoft Defender for Cloud.

## Incidents for correlation and investigation

While you can investigate and mitigate the threats that individual alerts bring to your attention, by themselves these threats are isolated occurrences that don't tell you anything about a broader, complex attack story. You could search for, research, investigate, and correlate groups of alerts that belong together in a single attack story, but that will cost you lots of time, effort, and energy.

Instead, the correlation engines and algorithms in the Microsoft Defender portal automatically aggregate and correlate related alerts together to form incidents that represent these larger attack stories. Defender identifies multiple signals as belonging to the same attack story, using AI to continually monitor its telemetry sources and add more evidence to already open incidents. Incidents contain all the alerts deemed to be related to each other and to the overall attack story, and present the story in various forms:

- Timelines of alerts and the raw events on which they're based
- A list of the tactics that were used
- Lists of all the involved and impacted users, devices, and other resources
- A visual representation of how all the players in the story interact
- Logs of automatic investigation and response processes that Defender XDR initiated and completed
- Collections of evidence supporting the attack story: bad actors' user accounts and device information and address, malicious files and processes, relevant threat intelligence, and so on
- A textual summary of the attack story

Incidents also provide you with a framework for managing and documenting your investigations and threat response. For more information about incidents' functionality in this regard, see [Manage incidents in Microsoft Defender](manage-incidents.md).

## Alert sources and threat detection

Alerts in the Microsoft Defender portal come from many sources. These sources include the many services that are part of Microsoft Defender XDR, as well as other services with varying degrees of integration with the Microsoft Defender portal. 

For example, when Microsoft Sentinel is [onboarded](/unified-secops-platform/microsoft-sentinel-onboard) to the Microsoft Defender portal, the correlation engine in the Defender portal has access to all the raw data ingested by Microsoft Sentinel, which you can find in Defender's **Advanced hunting** tables.

Microsoft Defender XDR itself also creates alerts. Defender XDR's unique correlation capabilities provide another layer of data analysis and threat detection for all the non-Microsoft solutions in your digital estate. These detections produce Defender XDR alerts, in addition to the alerts already provided by Microsoft Sentinel's analytics rules.

Within each of these sources, there are one or more threat detection mechanisms that produce alerts based on the rules defined in each mechanism.

For example, Microsoft Sentinel has at least four different engines that produce different types of alerts, each with its own rules.

## Tools and methods for investigation and response

The Microsoft Defender portal includes tools and methods to automate or otherwise assist in the triage, investigation, and resolution of incidents. These tools are presented in the following table:

| Tool/Method | Description |
| ----------- | ----------- |
| **[Manage](manage-incidents.md) and [investigate](investigate-incidents.md) incidents** | Make sure that you prioritize your incidents according to severity and then work through them to investigate. Use advanced hunting to search for threats, and get ahead of emerging threats with threat analytics. |
| **[Automatically investigate and resolve alerts](/defender-xdr/m365d-autoir)** | If enabled to do so, Microsoft Defender XDR can automatically investigate and resolve alerts from Microsoft 365 and Entra ID sources through automation and artificial intelligence. |
| **[Configure automatic attack disruption actions](automatic-attack-disruption.md)** | Use high-confidence signals collected from Microsoft Defender XDR and Microsoft Sentinel to automatically disrupt active attacks at machine speed, containing the threat and limiting the impact. |
| **[Configure Microsoft Sentinel automation rules](/azure/sentinel/automate-incident-handling-with-automation-rules)** | Use automation rules to automate triage, assignment, and management of incidents, regardless of their source. Help your team's efficiency even more by configuring your rules to apply tags to incidents based on their content, suppress noisy (false positive) incidents, and close resolved incidents that meet the appropriate criteria, specifying a reason and adding comments. |
| **[Proactively hunt with advanced hunting](advanced-hunting-overview.md)** | Use Kusto Query Language (KQL) to proactively inspect events in your network by querying the logs collected in the Defender portal. Advanced hunting supports a guided mode for users looking for the convenience of a query builder. |
| **[Harness AI with Microsoft Copilot for Security](/defender-xdr/security-copilot-in-microsoft-365-defender)** | Add AI to support analysts with complex and time-consuming daily workflows. For example, Microsoft Copilot for Security can help with end-to-end incident investigation and response by providing clearly described attack stories, step-by-step actionable remediation guidance and incident activity summarized reports, natural language KQL hunting, and expert code analysis&mdash;optimizing on SOC efficiency across data from all sources. <br><br>This capability is in addition to the other AI-based functionality that Microsoft Sentinel brings to the unified platform, in the areas of user and entity behavior analytics, anomaly detection, multi-stage threat detection, and more. |

> [!TIP]
> **Defender Boxed**, a series of cards showcasing your organization's security successes, improvements, and response actions in the past six months/year, appears for a limited time during January and July of each year. Learn how you can share your [Defender Boxed](incident-queue.md#defender-boxed) highlights.

## Related items

To learn more about alert correlation and incident merging in the Defender portal, see [Alerts, incidents, and correlation in Microsoft Defender XDR](alerts-incidents-correlation.md)
