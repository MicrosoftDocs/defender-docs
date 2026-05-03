---
title: Data handling and privacy in Microsoft Defender as part of Agent 365
description: Learn how Microsoft Defender handles customer data and supports your privacy requirements when delivered as part of Microsoft Agent 365.
ms.service: defender-xdr
ms.subservice: security-for-ai
ms.topic: concept-article
ms.date: 04/15/2026
author: guywi-ms
ms.author: guywild
ms.reviewer: shimie
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012
#customer intent: As a security or compliance admin, I want to understand how Microsoft Defender handles customer data in Agent 365 so that I can validate it against my organization's privacy requirements.
---

# Data handling and privacy in Microsoft Defender as part of Agent 365

As part of [Microsoft Agent 365](https://www.microsoft.com/microsoft-agent-365), Microsoft's control plane for deploying, governing, and managing AI agents at scale, Microsoft Defender provides a set of AI agent security capabilities — including agent discovery, posture assessment, threat detection, and real-time protection — that help organizations across the AI lifecycle, from build time and configuration through runtime execution. These capabilities give security teams visibility into AI agents and infrastructure, supporting detection, investigation, and response to risks such as prompt-based attacks, unsafe tool usage, credential exposure, and data exfiltration. For more information, see [Protect AI agents using Microsoft Defender (Preview)](./defender-security-for-ai.md#protect-ai-agents-using-microsoft-defender-preview).

This article describes how Microsoft Defender collects, stores, and uses data for these AI agent security capabilities. For commitments that apply to all Agent 365 services, see [Data handling, data residency, and compliance in Agent 365 observability](/microsoft-agent-365/admin/data-residency-protection-compliance).

## Data collected

As part of Agent 365, Microsoft Defender collects:

- **Observability trace payloads** submitted by agents during execution. Payloads might include session inputs and outputs, depending on how the developer instruments the agent. Customers and developers control what's included in trace payloads by configuring their agent instrumentation.
- **Agent configuration attributes** from the Agent 365 registry and, for local agents on devices, from Microsoft Defender for Endpoint. Examples: agent name, type, version, configured tools, connected models, and published locations.
- **User identifiers**, such as Microsoft Entra user IDs, associated with agent sessions.
- **Pseudonymized identifiers** derived from user data, used for analytics and trend detection without directly exposing identifiable information.
- **Tenant, subscription, and agent identifiers** used to partition, route, and attribute observability data to the correct organization.

Administrators can independently enable or disable these capabilities from the [Defender settings page](https://security.microsoft.com), without affecting other Agent 365 services.

## Data storage location

As part of Agent 365, Microsoft Defender operates in the following Azure regions:

| Tenant provisioning location | Data storage location |
|---|---|
| European Union or United Kingdom | European Union |
| All other regions | United States |

<!-- TODO (Lital/Shimi): Reconcile with published Defender XDR residency (EU, UK, US, Australia, Switzerland, India, UAE). Also confirm DP9: should we state that customer content is processed in the region closest to the secured agent (relevant for webhook scenarios)? -->

Once created, the tenant can't be moved to a different location.

## Data retention

As part of Agent 365, Microsoft Defender retains customer data for up to 30 days, during which time you can view it in the Microsoft Defender portal. Microsoft Defender retains agent inventory and data shared with [Microsoft Defender XDR](/defender-xdr/data-privacy) for up to 180 days.

Microsoft Defender deletes this customer data within 30 days of contract termination or expiration.

## Data use

Microsoft uses patterns and threat intelligence seen across multiple tenants to improve its prevention and detection capabilities, in accordance with the privacy commitments in the [Microsoft Privacy Statement](https://privacy.microsoft.com/privacystatement).

Microsoft doesn't use customer data to train AI models without user consent. As per the [Microsoft Product Terms](https://www.microsoft.com/licensing/terms/), Microsoft doesn't use customer data to train any generative AI foundation model, unless pursuant to the customer's documented instructions.

## Data sharing within Microsoft

As part of Agent 365, Microsoft Defender shares data, including customer data, with other Microsoft products the customer has licensed. These might include:

- Microsoft Defender XDR
- Microsoft Defender for Endpoint
- Microsoft Security Exposure Management
- Microsoft Entra ID Protection

For customers in the Government Community Cloud (GCC), data sharing between government and commercial cloud environments may occur, depending on the location of the service offering.

## Related content

- [Microsoft compliance offerings](/compliance/regulatory/offering-home)
