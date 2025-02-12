---
title: Microsoft Defender XDR in the Defender portal 
description: Learn about the services and features available with Microsoft Defender XDR in the Microsoft Defender portal.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: cwatson
author: cwatson-cat
ms.localizationpriority: medium
ms.date: 11/18/2024
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: concept-article

# customer intent: As a security operations center leader, I want to learn about the services and features available with Defender XDR to help me determine whether it meets my organization's requirements.
---

# Microsoft Defender XDR in the Defender portal

Microsoft Defender XDR in the Microsoft unified SecOps platform unifies and coordinates threat protection across a broad range of assets, including devices and endpoints, identities, email, Microsoft 365 services, and SaaS apps.

Defender XDR consolidates threat signals and data across assets, so that you can monitor and manage security threats from a single location in the [Microsoft Defender portal](https://security.microsoft.com). 


Defender XDR combines multiple Microsoft security services.

Service | Details
--- | ---
**[Protect against email threats with Defender for Office 365](/defender-office-365/mdo-sec-ops-guide)** | Helps protect email and Office 365 resources.
**[Protect devices with Defender for Endpoint](/defender-endpoint/mde-sec-ops-guide)** | Delivers preventative protection, post-breach detection, and automated investigation and response for devices.
**[Protect Active Directory with Defender for Identity](/defender-xdr/microsoft-365-security-center-mdi)** | Uses Active Directory signals to identify, detect, and investigate advanced threats, compromised identities, and malicious insider actions.
**[Protect SaaS cloud apps with Defender for Cloud Apps](/defender-xdr/microsoft-365-security-center-defender-cloud-apps)** | Provides deep visibility, strong data controls, and enhanced threat protection for SaaS and PaaS cloud apps.
**[Protect against a broad range of threats with Microsoft Sentinel](/azure/sentinel/microsoft-365-defender-sentinel-integration)** |  Microsoft Sentinel seamlessly integrates with Defender XDR to combine the capabilities of both products into a unified security platform for threat detection, investigation, hunting, and response.


## Detecting threats

Defender XDR provides continuous threat monitoring. When threats are detected [security alerts](/defender-xdr/alerts-incidents-correlation) are created. Defender automatically aggregates related alerts and security signals into [security incidents](/defender-xdr/alerts-incidents-correlation#incident-creation-and-alert-correlation).

Incidents define a complete picture of an attack. Incidents help SOC teams to understand attacks and respond more quickly. Incidents gather together related alerts, information about attack scope and progress, and the entities and assets involved in an attack.

A [single incident queue](/defender-xdr/incident-queue) in the Defender portal provides full visibility into the latest alerts and incidents, and historical data. You can search and query the incident queue, and prioritize responses based on severity.

:::image type="content" source="media/defender-xdr-portal/incidents-page.png" alt-text="Screenshot of the Incidents page in the Microsoft Defender portal" lightbox="media/defender-xdr-portal/incidents-page.png":::


### Detecting lateral movement attacks

Defender for XDR includes [deception capability](/defender-xdr/deception-overview) to detect human-operated lateral movement, which is often used in common attacks such as ransomware and email compromise.

Deception capability generates decoy assets. When attackers interact with these assets, deception capability raises high-confidence alerts that can be viewed on the Alerts page in the portal.

## Automatically disrupting threats

Defender XDR uses [automatic attack disruption](/defender-xdr/automatic-attack-disruption) for containing attacks in progress, limiting attack impact, and providing more time for security teams to respond.

Automatic disruption relies on high-fidelity signals that are produced by incident correlation across million of Defender product signals and continuous investigation insights from Microsoft's security research team, to ensure a high signal-to-noise ratio.

Automatic disruption uses Defender XDR response actions when attacks are detected. Responses include containing or disabling assets.

Attack disruptions are clearly marked in the Defender XDR incident queue, and on specific incident pages.


## Hunting for threats

Proactive hunting inspects and investigates security events and data to locate known and potential security threats. 

Defender XDR provides threat hunting capabilities in the Defender portal. 

- **Advanced hunting**: SOC teams can use [advanced hunting](/defender-xdr/advanced-hunting-overview) with the Kusto Query Language (KQL) in the portal to create custom queries and rules for threat hunting across the enterprise. Analysts can search for indicators of compromise, anomalies, and suspicious activities across Defender XDR data sources.

  If you're not familiar with KQL, Defender XDR provides a guided mode to create queries visually, and predefined query templates.

- **Custom detection rules**: In addition to advanced hunting, SOC teams can create [custom detection rules](/defender-xdr/custom-detections-overview) to proactively monitor and respond to events and system states. Rules can trigger alerts or automatic response actions.

## Responding to threats

Defender for XDR provides [automated investigation and response](/defender-xdr/m365d-autoir) capabilities. Automation reduces the volume of alerts that must be handled manually by SOC teams. 

As alerts create incidents, automated investigations produce a verdict that determines whether a threat was found. When suspicious and malicious threats are identified, remediation actions include sending a file to quarantine, stopping a process, blocking a URL, or isolating a device.

You can view a summary of automated investigations and responses in the Home page of the portal. Pending remediation actions are handled in the portal Action Center.
