---
title: Identity Security 
description: Learn how to enhance your organization's identity security.
ms.topic: overview
ms.date: 01/29/2026
ms.reviewer: AbbyMSFT
ms.author: abbyweisberg
author: AbbyMSFT
ms.service: Microsoft Defender
---

# Identity Security

The Microsoft Defender Identity security solution focuses on detecting, investigating, and responding to threats that target digital identities. Identities are the most common attack vector in enterprise security breaches. Identity security solutions continuously monitor identity-related activities, analyze behavior patterns, and identify anomalies that indicate malicious activity. When threats are detected, these solutions enable rapid response through actions such as isolating compromised accounts, enforcing strong authentication, or triggering automated remediation workflows.

Microsoft Defender provides identity security capabilities that protect identities across your entire organization. This includes identities in on-premises Active Directory environments, cloud identity providers like Microsoft Entra ID, SaaS applications, and third-party identity providers and partners. Defender identity security covers both human identities (user accounts) and non-human identities such as service accounts, service principals, and OAuth applications. By connecting these identity sources, you gain visibility into identity-based threats across all your environments and can respond to attacks before they spread.

## Key features

Defender identity security includes the following capabilities:

- **Unified identity inventory**: Consolidates identity accounts and their relationships across on-premises Active Directory, Entra ID, SaaS applications, and third-party identity providers into a single view. This enables you to see all identities in your organization regardless of where they're managed.

- **Coverage & Maturity dashboard**: Shows your current identity protection posture with a maturity score that indicates how well your identities are protected. The dashboard identifies deployment gaps and provides recommended actions to improve coverage. For more information, see [Work with the Coverage & Maturity dashboard](identity-security-dashboard.md).

- **Identity risk score**: Aggregates signals from Microsoft Defender for Identity, Microsoft Entra ID Protection, and other sources into a unified risk score. This score drives policy enforcement through Conditional Access and enables automated threat response.

- **Lateral movement path analysis**: Identifies paths that attackers could use to move between accounts and systems. This helps you understand how a compromised identity could lead to access to sensitive resources.

- **Threat detection**: Detects identity-based attacks including Kerberos attacks, credential theft, domain controller compromise, rogue device registration, and suspicious authentication patterns across hybrid and cloud environments.

- **Attack disruption**: Automatically contains threats by disabling compromised accounts, revoking sessions, isolating devices, and resetting credentials. These actions stop attacks from spreading while you investigate.

- **Non-human identity protection**: Discovers and protects service accounts, service principals, OAuth applications, and other non-human identities that are often targeted by attackers.

- **Third-party identity provider support**: Extends protection to identities managed by third-party providers including Okta, PingOne, CyberArk, and SailPoint, as well as privileged access management (PAM) solutions.

