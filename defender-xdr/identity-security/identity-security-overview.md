---
title: Microsoft Defender Identity Security Overview
description: Protect your organization from identity-based threats with Microsoft Defender's integrated identity security solution. Detect, investigate, and respond to attacks across your environment.
#customer intent: As an security engineer, I want to assess the deployment and coverage of identity security across my environment so that I can identify and address protection gaps.
author: AbbyMSFT
ms.author: abbyweisberg
ms.reviewer: maelgami
ms.date: 02/18/2026
ms.topic: article
ms.service: defender-xdr
---

# What Is Identity Security?

Microsoft Defender identity security detects, investigates, and responds to threats that target digital identities. Because identities are a primary attack vector in enterprise breaches, identity security is a core part of modern security architecture. Defender monitors identity activity, analyzes behavior, and detects anomalies that indicate malicious activity. When threats are identified, it supports rapid response actions such as isolating accounts, enforcing authentication controls, and triggering automated remediation.

Defender protects identities across the organization through a single, integrated identity security solution that brings posture management, threat detection, and response into one platform. Coverage includes on-premises Active Directory, cloud identity providers such as Microsoft Entra ID, SaaS applications, and supported third-party identity providers. Both human identities and non-human identities (NHIs)—including service accounts, service principals, and OAuth applications—are protected. Connecting these identity sources provides end-to-end visibility and enables earlier response to identity-based attacks.

## Identity security capabilities

Defender identity security provides a set of capabilities that address both high-level posture management and in-depth threat investigation.

### Identity protection for all identity types

Identity security protects human and non-human identities across Microsoft and non-Microsoft systems, including identities used by applications and automated agents:

- **Non-human and application identity protection**: Discovers and protects service accounts, service principals, OAuth applications, cloud app identities, and agentic identities.
- **Unified signal ingestion**: Ingests identity signals from Microsoft and non-Microsoft sources into the unified identity inventory to provide consistent visibility across all identity types.
- **Non-Microsoft identity and PAM integration**: Extends protection to external identity providers and privileged access management (PAM) solutions.

### Insight into identity coverage and maturity

The coverage and maturity page helps assess and improve identity protection across the environment:

- **Maturity and coverage scoring**: Presents identity protection maturity as a simple score to track progress and guide improvement.
- **Deployment and coverage insights**: Shows which identity sources are connected, which protections are enabled, and where gaps exist across Active Directory, Entra ID, SaaS applications, non-human identities, and third-party providers.
- **Recommended Actions**: Identifies deployment gaps and next actions across identity sources, Entra Conditional Access (CA) policies, SaaS applications, and NHIs to provide optimum identity protection.

### Unified investigation and response capabilities

Identity security provides integrated capabilities for detecting and responding to identity-based threats:

- **Unified identity inventory**: The unified identity inventory consolidates identity accounts and relationships across on-premises Active Directory, Entra ID, SaaS applications, and third-party identity providers.

  - Provides a single view of all identity types, including users and non-human identities.
  - Supplies context for posture management, threat detection, and investigation.
  - Enables analysts to pivot from incidents and alerts to identity relationships, permissions, and activity.

- **Threat detection and hunting**: Identity detections are unified across Defender, with identity-focused queries available in advanced hunting.
- **Attack disruption actions**: Active attacks can be contained by disabling compromised accounts, revoking sessions, isolating devices, and resetting credentials.

### Insight into identity risk and conditional access

Defender integrates with Microsoft Entra to strengthen identity protection:

- **Identity risk score**: Aggregates signals from Defender for Identity and Entra ID Protection to help prioritize investigations and drive automated enforcement.
- **Conditional Access coverage insights**: Identifies missing or weak CA policy coverage and provides recommendations during onboarding.
- **Security Copilot integration**: Identity insights flow into Security Copilot to support faster triage and investigation.

## Related content

- [View the identity inventory](/defender-for-identity/identity-inventory)
- [The identity security dashboard](/defender-for-identity/dashboard)
- [Unified identity security recommendations](identity-security-recommendations.md)
