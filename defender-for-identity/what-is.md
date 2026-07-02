---
title: Microsoft Defender for Identity Overview
description: Learn how Microsoft Defender for Identity helps detect, investigate, and respond to identity-based attacks across on-premises, cloud, and hybrid environments.
ms.date: 02/19/2026
ms.topic: overview
#customer intent: As a security analyst or identity administrator, I want to understand what Microsoft Defender for Identity does and when to use it so that I can detect and respond to identity-based attacks.
ms.reviewer: AbbyMSFT
---

# Microsoft Defender for Identity overview

Microsoft Defender for Identity helps organizations detect, investigate, and respond to identity-based attacks across on-premises, cloud, and hybrid environments. Attackers frequently target identities such as users, applications, and service accounts to gain access, escalate privileges, and maintain persistence.

Defender for Identity monitors identity signals from on-premises Active Directory and Microsoft Entra ID, other IAM solutions (for example, Okta).  It analyzes these signals using behavioral analytics, threat intelligence, and known attack patterns to detect suspicious activity across the full identity attack lifecycle. Alerts include investigation context in the Microsoft Defender portal, helping security teams understand what happened, why it matters, and how to respond.

## Identity Security

Microsoft Defender for Identity is a core component of Microsoft Identity Security. Identity Security focuses on protecting identities by providing visibility into identity coverage and posture, detecting identity‑based threats, and enabling investigation and response across identity systems, applications, and infrastructure.

Defender for Identity streams identity signals into the Microsoft Defender portal, where they are correlated with data from endpoints, email, SaaS applications, cloud workloads, and other security sources. This correlation helps security teams identify anomalous behavior, track attacker movement, and respond through unified incidents that reflect the full scope of an attack rather than isolated alerts.

## Defender for Identity capabilities

Defender for Identity delivers a modern identity threat detection solution with:

- Proactive identity security posture assessments
- Real‑time threat detection using analytics and behavioral intelligence
- Investigation of suspicious activities with clear, actionable incident context
- Remediation actions for compromised identities

### Prevent breaches with proactive identity security posture assessments

Defender for Identity helps organizations proactively reduce their identity attack surface. It evaluates identity configurations and highlights security weaknesses that attackers commonly exploit, allowing teams to address risks before they are abused.

Key posture capabilities include:

- Identity security posture assessments available through Microsoft Secure Score
- Identification of risky configurations and exposures
- Analysis of lateral movement paths that reveal how an attacker could traverse the environment

These insights help organizations strengthen identity resilience and reduce the likelihood of successful compromise.

### Detect identity-based threats

Defender for Identity is designed to detect threats that specifically target identities, including both human and nonh-uman identities such as service accounts, synchronization accounts, and applications. Detection is based on behavioral analytics and signal correlation rather than single events.

Defender for Identity monitors and analyzes identity activity such as:

- Authentication and authorization behavior
- Credential abuse and risky sign ins
- Privilege escalation and suspicious role or group membership changes
- Lateral movement attempts within the environment
- Abnormal behavior related to service accounts and other non‑human identities

The following table shows how Defender for Identity detections align to key stages of an identity based attack:

| Attack stage | Defender for Identity detections |
|----|----|
| Reconnaissance | Identifies suspicious discovery activity, such as attempts to enumerate user names, group membership, IP addresses, and resources. |
| Compromised credentials | Detects attempts to compromise credentials using techniques such as brute force, repeated failed authentications, and suspicious changes to user group membership. |
| Lateral movement| Detects attempts to move laterally and expand control of sensitive identities and across different environments. |
| AD Domain dominance | Highlights behavior associated with full domain compromise, such as remote code execution on domain controllers, DCShadow, malicious domain controller replication, and Golden Ticket activity. |

Attackers often begin with any accessible identity and then move laterally toward high value targets such as privileged accounts such as domain administrators, global admin, application admins and sensitive data. Defender for Identity helps identify these behaviors early by building behavioral profiles for users, devices, and accounts and detecting deviations that indicate attacker activity.

### Investigate identity threats

Defender for Identity generates alerts that are enriched with context such as affected identities, related activity, and attacker techniques. Analysts can use this context to validate suspicious behavior and understand what happened.

Defender for Identity also supports identity investigation and hunting workflows. Identity entities and authentication activity are available within the Microsoft Defender portal, enabling security teams to investigate activity patterns and hunt for additional identity based threats across cloud, on-premises, and hybrid users.

### Respond to identity-based attacks

Defender for Identity supports response by:

- Correlating identity alerts into unified incidents in Microsoft Defender
- Providing identity context (users, accounts, roles, and lateral movement indicators) to scope impact and prioritize actions
- Enabling remediation actions in the Microsoft Defender portal for affected identities and related entities

## Microsoft Defender portal experience

The Microsoft Defender portal provides a unified experience for monitoring, investigating, and responding to identity threats. From the portal, security teams can:

- View identity based alerts and correlated incidents
- Investigate users, devices, and identity relationships
- Track identity security posture and remediation recommendations
- Perform response actions on compromised identities

By contributing rich identity context into unified incidents, Defender for Identity helps security teams understand attacker behavior, prioritize risk, and take action to disrupt identity based attacks across the organization.

## Architecture overview

Microsoft Defender for Identity uses lightweight [sensors](./deploy/deploy-defender-identity.md), API connectors, and a cloud‑based analytics service managed in the Microsoft Defender portal.

Sensors run on your identity infrastructure, capturing and parsing relevant network traffic and Windows events locally. API connectors integrate external Identity and Access Management (IAM) systems, to provide comprehensive identity protection.

Only the required signals are sent to the Defender for Identity cloud service, minimizing performance impact and avoiding complex network changes.

The cloud service analyzes identity signals and integrates them with other Microsoft Defender workloads, contributing identity intelligence to correlated alerts and incidents across Microsoft Defender XDR.

## Next steps

[Deploy Microsoft Defender for Identity](./deploy/deploy-defender-identity.md)
