---
title: Threat response in Microsoft's unified SecOps platform
description: Learn about the features that help respond to threats in the Microsoft unified SecOps platform, ensuring comprehensive protection.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: bagol
author: batamig
ms.localizationpriority: medium
ms.date: 02/16/2025
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: conceptual
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal

# Customer intent: As a security operations center business decision maker, I want to learn about the tools available to respond to threats automatically in Microsoft's unified security platform to help me determine whether it meets my organization's requirements.
---

# Threat response in Microsoft's unified SecOps platform

As cyber threats evolve and data stores and tooling grow in complexity, security solutions must adapt and respond faster in real time. This article explains how the advanced response features provided across the Microsoft's unified SecOps platform help contain threats as they're detected and neutralize them before causing damage.

## Threat response across the Defender portal

In the Defender portal, unified support for incident correlation and integrated threat intelligence across multiple attack surfaces helps security teams respond to threats effectively.

### Incident correlation

In the Defender portal, related alerts from across multiple attack surfaces are grouped into a single incident, improving the efficiency of incident response. Correlating alerts from various sources such as endpoints, identities, email, and cloud workloads helps security teams gain a holistic view of an attack campaign. This comprehensive perspective allows analysts to understand the full scope of an incident, identify the root cause, and determine the most effective remediation actions.

:::image type="content" source="media/respond-threats-overview/unified-incidents.png" alt-text="Screenshot of an incident with alerts from services across the Defender portal." lightbox="media/respond-threats-overview/unified-incidents.png":::

For more information, see [Alert correlation and incident merging in the Microsoft Defender portal](/defender-xdr/alerts-incidents-correlation).

### Integrated threat intelligence

Threat intelligence integrates across Defender portal services to enrich alerts with information on indicators of compromise (IOCs) such as malicious IP addresses, domains, and file hashes. This enrichment helps security teams quickly grasp threat context and severity, identifying false positives better and enabling faster, informed decision-making. Use threat intelligence from Microsoft and third-party sources to correlate alerts with attack patterns and tactics, techniques, and procedures (TTPs) employed by adversaries.

Continuous updates to threat intelligence feeds keep security teams ahead of emerging threats and improve the organization's overall resilience.

:::image type="content" source="media/respond-threats-overview/threat-analytics.png" alt-text="Screenshot of a list of related incidents to a specific threat." lightbox="media/respond-threats-overview/threat-analytics.png":::

For more information, see [Uncover adversaries with threat intelligence in Microsoft's unified SecOps platform](threat-intelligence-overview.md).

## Microsoft Defender XDR threat response features

Microsoft Defender XDR unifies threat protection by automating security across endpoints, identities, email, apps, and cloud workloads, helping organizations respond to threats effectively.

### Automated attack disruption

Automatic attack disruption boosts a SOC team's response by rapidly detecting and containing threats before escalation. It uses AI detection, predefined playbooks, and real-time threat intelligence to identify attack patterns and trigger immediate actions, such as isolating compromised endpoints or blocking malicious connections. This approach reduces the window for attackers and minimizes incident impact.

:::image type="content" source="media/respond-threats-overview/attack-disrupt.png" alt-text="Screenshot of an incident with attack disruption actions."lightbox="media/respond-threats-overview/attack-disrupt.png":::

Automated attack disruption also improves collaboration across SOC teams by streamlining communication and responses. It alerts analysts and can suggest or execute actions based on predefined policies. This orchestration accelerates decision-making and ensures security teams can scale their efforts efficiently despite increasing threats.

Use Microsoft Defender XDR's automatic attack disruption to enhance your environment's overall resilience, reduce response times, and strengthen your organization's cybersecurity posture. For more information, see [Automatic attack disruption in Microsoft Defender XDR](/defender-xdr/automatic-attack-disruption?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json).

### Automated investigation and response (AIR)

Microsoft Defender XDR's AIR capabilities help security operations teams manage the high volume of alerts by automating investigation and response processes.

Acting as a virtual analyst, AIR mimics ideal investigation steps, working 24/7 to reduce response times and free up the security team for other tasks. When an alert triggers an incident, AIR initiates an automated investigation, resulting in verdicts such as *malicious*, *suspicious*, or *no threats*, and identifying necessary remediation actions, such as quarantining files or stopping processes.

:::image type="content" source="media/respond-threats-overview/investigations.png" alt-text="Screenshot of the Investigations tab, showing automated investigation steps taken by Microsoft Defender XDR." lightbox="media/respond-threats-overview/investigations.png":::

Organizations can configure AIR capabilities to suit their needs, choosing either automatic remediation actions or ones that require security team approval. This automation significantly enhances the efficiency and effectiveness of security operations.

For more information, see [Automated investigation and response in Defender XDR](/defender-xdr/m365d-autoir?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json).

### Guided response with Microsoft Security Copilot

Microsoft Defender XDR's guided response features, powered by Microsoft Security Copilot, help security operations teams manage and resolve incidents efficiently with AI-driven recommendations. For response actions, guided responses propose specific measures to remediate threats and ensure comprehensive incident resolution.

Guided responses are shown together with other Copilot recommendations, as actionable cards that describe the suggested action, the targeted entity, and the rationale behind the recommendation. This structured approach enables incident response teams to confidently and swiftly apply appropriate measures, enhancing overall security posture.

:::image type="content" source="/defender/media/copilot-in-defender/guided-response/copilot-defender-guided-response-status.png" alt-text="Screenshot of the Guided response area in an incident's Copilot side pane.":::

For more information, see [Triage and investigate incidents with guided responses from Microsoft Copilot in Microsoft Defender](/defender-xdr/security-copilot-m365d-guided-response).

## Microsoft Sentinel threat response features

Onboard Microsoft Sentinel to the Defender portal for a unified security operations platform, with cloud-native Security Information and Event Management (SIEM) and Security Orchestration, Automation, and Response (SOAR) features for intelligent security analytics and threat intelligence across the enterprise. This section describes how Microsoft Sentinel features add to your threat detection and response capabilities.

For more information, see [Connect Microsoft Sentinel to the Microsoft Defender portal](/defender-xdr/microsoft-sentinel-onboard).

### Automation rules

Microsoft Sentinel automation rules allow SOC teams to streamline and automate incident handling processes, ensuring structured responses across your environment. Automation rules can perform basic steps, such as adding incident tasks, suppressing noisy incidents, and changing incident statuses. They can also automate responses for multiple detections simultaneously, control the order of actions executed, and perform automation for limited time periods only, such as during testing or maintenance windows.

:::image type="content" source="media/respond-threats-overview/automation-rule.png" alt-text="Screenshot of a sample automation rule." lightbox="media/respond-threats-overview/automation-rule.png":::

When onboarded to the Defender portal, automation rules with incident triggers apply universally across both Microsoft Sentinel and Microsoft Defender XDR incidents, ensuring cohesive and comprehensive incident management.

For more information, see [Automate threat response in Microsoft Sentinel with automation rules](/azure/sentinel/automate-incident-handling-with-automation-rules?tabs=onboarded).

### Automated playbooks

Microsoft Sentinel playbooks are built using Azure Logic Apps and are automated workflows for streamlining and enhancing threat response in SOC teams. Have your playbooks trigger automatically, in response to specific alerts or incidents through configured automation rules, or run them manually as needed. For example, upon detecting a compromised account and machine, a playbook can isolate the affected machine from the network and block the compromised account before the SOC team is even alerted to the incident.

Common use cases for Microsoft Sentinel playbooks include data enrichment, bi-directional synchronization with ticketing systems, orchestration of incident management through communication platforms like Microsoft Teams or Slack, and immediate threat response actions. Microsoft Sentinel provides many playbooks out-of-the-box in solutions available from the **Content hub**.

:::image type="content" source="media/respond-threats-overview/playbooks.png" alt-text="Screenshot of many playbooks available from the Content hub." lightbox="media/respond-threats-overview/playbooks.png":::

To create and manage these playbooks, specific roles and permissions are required, and extra charges may apply for the usage of Azure Logic Apps. For more information, see [Automate threat response with playbooks in Microsoft Sentinel](/azure/sentinel/automation/automate-responses-with-playbooks).

## Microsoft Security Exposure Management for potential threat response

[Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management) enables organizations to identify and mitigate potential attack paths before they can be exploited. Microsoft Security Exposure Management treats attack paths like incidents, providing a proactive approach to managing vulnerabilities and misconfigurations, and aiding in responses to in-progress attacks.

:::image type="content" source="media/respond-threats-overview/attack-paths.png" alt-text="Screenshot of the Attack paths Overview page." lightbox="media/respond-threats-overview/attack-paths.png":::

An attack path analysis maps out potential attack vectors, providing remediation recommendations to reduce risk. Microsoft Security Exposure Management's security scoring system helps to prioritize vulnerabilities and misconfigurations that pose the greatest threat, and automated recommendations suggest the measures needed to strengthen an organization's overall security posture.

For more information, see [Start using Microsoft Security Exposure Management](/security-exposure-management/get-started-exposure-management) and [Overview of attack paths](/security-exposure-management/work-attack-paths-overview).

## Related content

For more information, see:

- [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json&tabs=defender-portal)
- [Threat detection in Microsoft's unified SecOps platform](detect-threats-overview.md)
- [Uncover adversaries with threat intelligence in Microsoft's unified SecOps platform](threat-intelligence-overview.md)
