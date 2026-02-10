---
title: Microsoft Defender for Identity Overview
description: This article describes the Microsoft Defender for Identity service and the sorts of suspicious activities Defender for Identity can detect.
ms.date: 02/10/2026
ms.topic: overview
#customer intent: As a Microsoft Defender for Identity customer or potential customer, I want to understand the main use case scenarios for Defender for Identity so that I can best use my Microsoft Defender XDR deployment.
ms.reviewer: AbbyMSFT
---

# Microsoft Defender for Identity

Microsoft Defender for Identity helps organizations detect, investigate, and respond to identity-based attacks across on-premises, cloud, and hybrid environments. Threat actors frequently target identities such as users, applications, and service accounts to gain access, escalate privileges, and maintain persistence.

Defender for Identity monitors identity signals from on-premises Active Directory and hybrid identity infrastructure. It combines behavioral analytics, threat intelligence, and known attack patterns to detect suspicious activity across the full identity attack lifecycle. Microsoft Defender provides alerts with clear investigation context, enabling security teams to understand what happened, why it matters, and how to respond.

## Identity Threat Detection and Response (ITDR)

Microsoft Defender for Identity is a core component of Microsoft Identity Threat Detection and Response (ITDR). ITDR focuses on detecting and disrupting identity-based threats by correlating signals across identity systems, applications, and infrastructure.

Defender for Identity streams identity signals into the Microsoft Defender portal, where they are correlated with telemetry from endpoints, email, cloud apps, and other security sources. This correlation helps security teams detect anomalous behavior, track attacker movement, and respond through unified incidents that reflect the full scope of an attack rather than isolated alerts.

## Defender for Identity capabilities

Defender for Identity delivers a modern identity threat detection solution with:

- Proactive identity security posture assessments
- Real-time threat detection using analytics and behavioral intelligence
- Investigation of suspicious activities with clear, actionable incident context
- Remediation actions for compromised identities

### Prevent breaches with proactive identity security posture assessments

Defender for Identity helps organizations proactively reduce their identity attack surface. It evaluates identity configurations and highlights security weaknesses that bad actors commonly exploit, so your teams can address risks before they become problems.

Key posture capabilities include:

- Identity security posture assessments available through Microsoft Secure Score
- Identification of risky configurations and exposures
- Analysis of lateral movement paths that reveal how a bad actor could traverse the environment

These insights help organizations strengthen identity resilience and reduce the likelihood of successful compromise.

### Detect identity-based threats

Defender for Identity detects threats that specifically target identities, including both human and non‑human identities such as service accounts, synchronization accounts, and applications. It uses behavioral analytics and signal correlation rather than single events.

Defender for Identity monitors and analyzes identity activity such as:

- Authentication and authorization behavior
- Credential abuse and risky sign‑ins
- Privilege escalation and suspicious role or group membership changes
- Lateral movement attempts within the environment
- Abnormal behavior related to service accounts and other non‑human identities

This table shows how Defender for Identity detections align to key stages of an identity‑based attack:

| Attack stage | Defender for Identity detections |
|----|----|
|Reconnaissance | Identifies suspicious discovery activity, such as attempts to enumerate user names, group membership, IP addresses, and resources. |
|Compromised credentials | Detects attempts to compromise credentials using techniques such as brute force, repeated failed authentications, and suspicious changes to user group membership. |
|Lateral movement| Detects attempts to move laterally and expand control of sensitive identities (for example, Pass‑the‑Ticket, Pass‑the‑Hash, and Overpass‑the‑Hash). |
|Domain dominance | Highlights behavior associated with full domain compromise, such as remote code execution on domain controllers, DCShadow, malicious domain controller replication, and Golden Ticket activity. |

Attackers often begin with any accessible identity and then move laterally toward high‑value targets such as privileged accounts, domain administrators, and sensitive data. Defender for Identity helps identify these behaviors early by building behavioral profiles for users, devices, and accounts and detecting deviations that indicate attacker activity.

### Investigate identity threats

Defender for Identity generates alerts that include context such as affected identities, related activity, and attacker techniques. Analysts can use this context to validate suspicious behavior and understand what happened.

Defender for Identity also supports identity investigation and hunting workflows. Identity entities and authentication activity are available within the Microsoft Defender portal, enabling security teams to investigate activity patterns and hunt for additional identity‑based threats across cloud, on‑premises, and hybrid users.

### Respond to identity-based attacks

Defender for Identity supports response by:

- Correlating identity alerts into unified incidents in Microsoft Defender
- Providing identity context (users, accounts, roles, and lateral movement indicators) to scope impact and prioritize actions
- Enabling remediation actions in the Microsoft Defender portal for affected identities and related entities

## Microsoft Defender portal experience

The Microsoft Defender portal provides a unified experience for monitoring, investigating, and responding to identity threats. From the portal, security teams can:

- View identity‑based alerts and correlated incidents
- Investigate users, devices, and identity relationships
- Track identity security posture and remediation recommendations
- Perform response actions on compromised identities

By contributing rich identity context into unified incidents, Defender for Identity helps security teams understand attacker behavior, prioritize risk, and take action to disrupt identity‑based attacks across the organization.

## Architecture overview

Microsoft Defender for Identity is built on lightweight sensors and a cloud‑based analytics service, with centralized management in the Microsoft Defender portal.

Sensors run on identity infrastructure, capturing and parsing relevant network traffic and Windows events locally. The sensors send only the required signals to the Defender for Identity cloud service, which minimizes performance impact and avoids complex network changes.

The cloud service analyzes identity signals and integrates them with other Microsoft Defender workloads. It contributes identity intelligence to correlated alerts and incidents across Microsoft Defender XDR.

### Defender for Identity sensors

Install Defender for Identity sensors directly on identity servers such as:

- Active Directory domain controllers
- Active Directory Federation Services (AD FS) servers
- Active Directory Certificate Services (AD CS) servers
- Other supported identity infrastructure components

Sensors are designed for enterprise-scale environments. They dynamically manage resource usage, provide health monitoring and alerts, and support operational controls such as simplified deployment and update management. By using these features, you ensure continuous visibility into identity activity while minimizing administrative overhead.
