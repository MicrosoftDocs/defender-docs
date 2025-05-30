---
title: Plan an incident response workflow in the Microsoft Defender portal
description: Plan an incident response workflow in the Microsoft Defender portal, including triage, investigation, and resolution.
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: raynew
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - usx-security
  - sentinel-only
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
ms.date: 05/28/2025
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Plan an incident response workflow in the Microsoft Defender portal

In the Microsoft Defender portal, you can respond to security incidents that are collections of related alerts and tell the full story of an attack. 

This article provides a set of steps that you can follow to investigate, analyze, and resolve security incidents in the Microsoft Defender portal, and also maps these steps to your security team's experience level and role.

## Incident response workflow example in the Microsoft Defender portal

Here's a workflow example for responding to incidents in the Microsoft Defender portal.

:::image type="content" source="/defender/media/incidents-overview/incidents-example-workflow.png" alt-text="An example of an incident response workflow for the Microsoft Defender portal." lightbox="/defender/media/incidents-overview/incidents-example-workflow.png":::

On an ongoing basis, identify the highest priority incidents for analysis and resolution in the incident queue and get them ready for response. This is a combination of:

- [Triage](/defender-xdr/incident-queue) to determining the highest priority incidents through filtering and sorting of the incident queue.
- [Manage](/defender-xdr/manage-incidents) incidents by modifying their title, assigning them to an analyst, and adding tags and comments.

You can use Microsoft Sentinel automation rules to automatically triage and manage (and even respond to) some incidents as they're created, removing the easiest-to-handle incidents from taking up space in your queue.

Consider these steps for your own incident response workflow:

| Stage | Steps |
| ----- | ----- |
| For each incident, begin an [attack and alert investigation and analysis](/defender-xdr/investigate-incidents). | - View the attack story of the incident to understand its scope, severity, detection source, and which asset entities are affected.<br>- Begin analyzing the alerts to understand their origin, scope, and severity with the alert story within the incident.<br>- As needed, gather information on impacted devices, users, and mailboxes with the graph. Select any entity to open a flyout with all the details. Follow through to the entity page for more insights.<br>- See how Microsoft Defender XDR has [automatically resolved some alerts](/defender-xdr/m365d-autoir) with the **Investigations** tab.<br>- As needed, use information in the data set for the incident for more information with the **Evidence and Response** tab. |
| After or during your analysis, perform containment to reduce any additional impact of the attack and eradication of the security threat. | For example,- Disable compromised users<br>- Isolate impacted devices<br>- Block hostile IP addresses. |
| As much as possible, recover from the attack by restoring your tenant resources to the state they were in before the incident.||
| [Resolve](/defender-xdr/manage-incidents#resolve-an-incident) the incident and document your findings. | Take time for post-incident learning to: - Understand the type of the attack and its impact.<br>- Research the attack in [Threat Analytics](/defender-xdr/threat-analytics) and the security community for a security attack trend.<br>- Recall the workflow you used to resolve the incident and update your standard workflows, processes, policies, and playbooks as needed.<br>- Determine whether changes in your security configuration are needed and implement them. |

If you're new to security analysis, see the [introduction to responding to your first incident](/defender-xdr/incidents-overview) for additional information and to step through an example incident.

For more information about incident response across Microsoft products, see [incident response overview](/security/operations/incident-response-overview).

## Plan initial incident management tasks

### Experience level

Follow this table for your level of experience with security analysis and incident response.

| Level | Steps |
|:-------|:-----|
| **New** | - See the [Respond to your first incident walkthrough](/defender-xdr/respond-first-incident-365-defender) to get a guided tour of a typical process of analysis, remediation, and post-incident review in the Microsoft Defender portal with an example attack. <br>- See which incidents should be [prioritized](/defender-xdr/incident-queue) based on severity and other factors.<br>- [Manage incidents](/defender-xdr/manage-incidents), which includes renaming, assigning, classifying, and adding tags and comments based on your incident management workflow. |
| **Experienced** | - Get started with the incident queue from the **Incidents** page of the Microsoft Defender portal. From here you can: <br>- See which incidents should be [prioritized](/defender-xdr/incident-queue) based on severity and other factors. <br>- [Manage incidents](/defender-xdr/manage-incidents), which includes renaming, assigning, classifying, and adding tags and comments based on your incident management workflow. <br>- Perform [investigations](/defender-xdr/investigate-incidents) of incidents. <br>- Track and respond to emerging threats with [threat analytics](/defender-xdr/threat-analytics). <br>- Proactively hunt for threats with [advanced threat hunting](/defender-xdr/advanced-hunting-overview). <br>- See these [incident response playbooks](/security/operations/incident-response-playbooks) for detailed guidance for phishing, password spray, and app consent grant attacks. |

### Security team role
  
Follow this table based on your security team role.

| Role | Steps |
|---|---|
| Incident responder (Tier 1) | Get started with the incident queue from the **Incidents** page of the Microsoft Defender portal. From here you can: - See which incidents should be [prioritized](/defender-xdr/incident-queue) based on severity and other factors. <br>- [Manage incidents](/defender-xdr/manage-incidents), which includes renaming, assigning, classifying, and adding tags and comments based on your incident management workflow. |
| Security investigator or analyst (Tier 2) | - Perform [investigations](/defender-xdr/investigate-incidents) of incidents from the **Incidents** page of the Microsoft Defender portal.<br>- See these [incident response playbooks](/security/operations/incident-response-playbooks) for detailed guidance for phishing, password spray, and app consent grant attacks. |
| Advanced security analyst or threat hunter (Tier 3) | - Perform [investigations](/defender-xdr/investigate-incidents) of incidents from the **Incidents** page of the Microsoft Defender portal. <br>- Track and respond to emerging threats with [threat analytics](/defender-xdr/threat-analytics). <br>- Proactively hunt for threats with [advanced threat hunting](/defender-xdr/advanced-hunting-overview). <br>- See these [incident response playbooks](/security/operations/incident-response-playbooks) for detailed guidance for phishing, password spray, and app consent grant attacks. |
| SOC manager | See how to [integrate Microsoft Defender XDR into your Security Operations Center (SOC)](/defender-xdr/integrate-microsoft-365-defender-secops). |

## Related items

To learn more about alert correlation and incident merging in the Defender portal, see [Alerts, incidents, and correlation in Microsoft Defender XDR](/defender-xdr/alerts-incidents-correlation).