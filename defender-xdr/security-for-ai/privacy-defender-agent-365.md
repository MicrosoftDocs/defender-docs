---
title: Privacy in Microsoft Defender for Agent 365
description: Learn how Microsoft Defender's AI security capabilities collect, store, and use customer data when delivered through Microsoft Agent 365.
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

# Privacy in Microsoft Defender for Agent 365

Microsoft Defender provides a set of AI agent security capabilities in [Microsoft Agent 365](https://www.microsoft.com/microsoft-agent-365) - including agent discovery, posture assessment, threat detection, and real-time protection - to help protect agents from threats such as prompt-based attacks, unsafe tool usage, credential exposure, and data exfiltration. For more information, see the [Microsoft Defender for AI overview](./defender-security-for-ai.md).

This article describes how Microsoft Defender collects, stores, and uses customer data for these AI agent security capabilities in Agent 365.

For commitments that apply to all Agent 365 services, see [Data handling, data residency, and compliance in Agent 365 observability](/microsoft-agent-365/admin/data-residency-protection-compliance).

## Data collected

As part of Agent 365, Microsoft Defender collects:

- **Observability trace payloads** submitted by agents during execution. Payloads might include session inputs and outputs, depending on how the developer instruments the agent.
- **Agent configuration attributes** from the Agent 365 registry and, for local agents on devices, from Microsoft Defender for Endpoint. Examples: agent name, type, version, configured tools, connected models, and published locations.
- **User identifiers**, such as Microsoft Entra user IDs, associated with agent sessions.
- **Pseudonymized identifiers** derived from user data, used for analytics and trend detection.
- **Tenant, subscription, and agent identifiers** used to route data to the correct organization.

To stop Defender from collecting this data, an administrator can disable these capabilities from the [Defender settings page](https://security.microsoft.com). Disabling them doesn't affect other Agent 365 services.

## Data storage location

As part of Agent 365, Microsoft Defender operates in the following Azure regions:

| Tenant location | Data storage location |
|---|---|
| European Union or United Kingdom | European Union |
| All other regions | United States |

<!-- TODO (Lital/Shimi): Reconcile with published Defender XDR residency (EU, UK, US, Australia, Switzerland, India, UAE). Also confirm DP9: should we state that customer content is processed in the region closest to the secured agent (relevant for webhook scenarios)? -->

A tenant's storage location can't be changed after creation.

## Data retention

<!-- TODO (Shimi/Dotan): Reconcile retention numbers with published Defender XDR (https://learn.microsoft.com/defender-xdr/data-privacy), which uses 180 days as the default and 30 days as the Advanced Hunting query window. -->

Customer data is retained for up to 30 days and is visible in the Microsoft Defender portal during that period. Agent inventory and data shared with [Microsoft Defender XDR](/defender-xdr/data-privacy) are retained for up to 180 days.

After contract termination or expiration, Microsoft deletes customer data within 30 days.

## Data use

Microsoft handles customer data per the [Microsoft Products and Services Data Protection Addendum](https://www.microsoft.com/licensing/docs/view/Microsoft-Products-and-Services-Data-Protection-Addendum-DPA) and the [Microsoft Product Terms](https://www.microsoft.com/licensing/terms/). Microsoft doesn't use customer data to train generative AI foundation models unless instructed by the customer.

See the [Microsoft Privacy Statement](https://privacy.microsoft.com/privacystatement) for more information.

## Data sharing within Microsoft

As part of Agent 365, Microsoft Defender can share data, including customer data, with other Microsoft products the customer has licensed. These might include:

- Microsoft Defender XDR
- Microsoft Defender for Endpoint
- Microsoft Security Exposure Management
- Microsoft Entra ID Protection

<!-- TODO (Shimi/Maya): Confirm whether to add Microsoft Security Graph (CloudMap / Exposure Knowledge Graph) per MS33. Per F37, this list is intentionally non-exhaustive. -->

### Government Community Cloud (GCC)

For GCC customers, data sharing between government and commercial cloud environments might occur, depending on the location of the service offering.

## Related content

- [Microsoft Defender for AI overview](./defender-security-for-ai.md)
- [Data handling, data residency, and compliance in Agent 365 observability](/microsoft-agent-365/admin/data-residency-protection-compliance)
- [Data security and retention in Microsoft Defender XDR](/defender-xdr/data-privacy)
- [Microsoft Security for AI](/security/security-for-ai/)
- [Microsoft compliance offerings](/compliance/regulatory/offering-home)
