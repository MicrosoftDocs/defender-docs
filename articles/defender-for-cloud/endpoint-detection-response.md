---
title: Assess Defender for Endpoint EDR settings
description: Learn how Microsoft Defender for Cloud uses agentless scanning to assess Defender for Endpoint EDR settings on protected machines.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 06/02/2026
ai-usage: ai-assisted
ms.custom: sfi-image-nochange
#customer intent: As a user, I want to learn how Microsoft Defender for Cloud can help me to protect enterprise endpoints, improve endpoint posture, and respond to security threats.
---

# Assess Defender for Endpoint EDR settings

Microsoft Defender for Cloud integrates natively with Microsoft Defender for Endpoint as an endpoint detection and response (EDR) solution.

## Understand EDR capabilities in Defender for Endpoint

EDR capabilities in Defender for Endpoint detect, investigate, and respond to advanced threats. These capabilities include advanced threat hunting (see [Advanced threat hunting overview](/defender-xdr/advanced-hunting-overview)) and automatic investigation and remediation (see [Automatic investigation and remediation](/defender-xdr/m365d-autoir)).

- Defender for Cloud uses agentless scanning to assess EDR settings. See [About agentless data collection](concept-agentless-data-collection.md).
- Agentless scanning for EDR settings is available when Defender for Cloud is running in your Azure subscription and either Defender for Servers Plan 2 ([enable](tutorial-enable-servers-plan.md)) or the Defender cloud security posture management (Defender CSPM) plan ([enable](tutorial-enable-cspm-plan.md)) is enabled.

## Assess Defender for Endpoint settings

When machines run Defender for Endpoint as their EDR solution, Defender for Servers scans them agentlessly. These checks confirm that Defender for Endpoint is configured correctly. Checks include:

- Full and quick scans are older than seven days
- Signatures are out of date
- Antivirus is off or partially configured

If misconfigurations are found, Defender for Cloud presents recommendations such as:

- `EDR configuration issues should be resolved on virtual machines`
- `EDR configuration issues should be resolved on EC2s`
- `Anti-Virus component in your EDR is off or partially configured`
- `Anti-Virus component of your EDR uses outdated signatures`

Once you locate these recommendations ([learn how to review recommendations](review-security-recommendations.md)), you can remediate them ([learn how to remediate recommendations](implement-security-recommendations.md)).

## Next step

> [!div class="nextstepaction"]
> [Detect EDR misconfigurations in Defender for Endpoint](endpoint-detection-misconfiguration.md)

