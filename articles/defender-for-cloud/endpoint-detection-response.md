---
title: Endpoint detection and response with Defender for Endpoint Microsoft Defender for Cloud
description: Learn about endpoint detection and response capabilities in Microsoft Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/18/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how Microsoft Defender for Cloud can help me to protect enterprise endpoints, improve endpoint posture, and respond to security threats.
---

# Assessing Defender for Endpoint as an endpoint detection and response solution

Microsoft Defender for Cloud integrates natively with Microsoft Defender for Endpoint as an endpoint detection and response (EDR) solution.

EDR capabilities in Defender for Endpoint [detect, investigate, and respond to advanced threats](/defender-endpoint/overview-endpoint-detection-response), including [advanced threat hunting](/defender-xdr/advanced-hunting-overview), and [automatic investigation and remediation](/defender-xdr/m365d-autoir) capabilities.

- Defender for Cloud uses [agentless scanning](concept-agentless-data-collection.md) to assess EDR settings.
- Agentless scanning for EDR settings is available when Defender for Cloud is running in your Azure subscription and either [Defender for Servers Plan 2](tutorial-enable-servers-plan.md) or the [Defender Cloud Security Posture Management (CSPM) plan](tutorial-enable-cspm-plan.md) is enabled. 


## Assessing Defender for Endpoint settings

When machines run Defender for Endpoint as an EDR solution, Defender for Servers agentlessly scans the machines with security checks that assess whether Defender for Endpoint is configured correctly. Checks include:

- Both full and quick scans are out of 7 days
- Signature out of date
- Anti-virus is off or partially configured

If misconfigurations are found Defender for Cloud makes recommendations to fix them.


## Next steps

[Detect EDR misconfigurations in Defender for Endpoint](endpoint-detection-misconfiguration.md).
