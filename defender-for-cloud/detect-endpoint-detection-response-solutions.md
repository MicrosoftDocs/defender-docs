---
title: Detecting endpoint detection and response solutions
description: Check whether your machines are connected to a supported endpoint detection and response (EDR) solution in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
#customer intent: As a user, I want to learn how Microsoft Defender for Cloud can help me to protect enterprise endpoints, improve endpoint posture, and respond to security threats.
---

# Detecting endpoint detection and response solutions

This article explains how to check whether machines use a supported endpoint detection and response (EDR) solution.

Defender for Cloud includes EDR features for supported machines. It can:

- Detect whether a machine connects to a supported EDR solution.
- [Integrate natively with Microsoft Defender for Endpoint as an EDR solution](integration-defender-for-endpoint.md).

## Check for an EDR solution

Defender for Cloud uses [agentless scanning](concept-agentless-data-collection.md) to check whether Azure VMs and AWS/GCP machines connect to an EDR solution.

Agentless scanning for EDR settings is available when you enable [Defender for Servers Plan 2](tutorial-enable-servers-plan.md) or the [Defender CSPM plan](tutorial-enable-cspm-plan.md) in your Azure subscription.

Based on the findings, Defender for Cloud provides recommendations to help you find and fix machines that don't have an EDR solution running:

- `EDR solution should be installed on virtual machines`
- `EDR solution should be installed on EC2 instances`
- `EDR solution should be installed on virtual machines in GCP`

## Supported EDR solutions

The following table lists the EDR solutions supported by Defender for Cloud:

|**Solution** | **Supported platform**|
|--- | ---|
|Microsoft Defender for Endpoint | Windows|
|Microsoft Defender for Endpoint | Linux|
|Microsoft Defender for Endpoint Unified Solution | Windows Server 2012/2012 R2|
|CrowdStrike (Falcon) | Windows and Linux|
|Trellix | Windows and Linux|
|Symantec | Windows and Linux|
|Sophos | Windows and Linux|
|Singularity Platform by SentinelOne | Windows and Linux|
|Cortex XDR | Windows and Linux (Supported only when installed via package manager on Linux)|

<a name="next-step"></a>
## Next steps

> [!div class="nextstepaction"]
> [Enable Defender for Servers Plan 2](tutorial-enable-servers-plan.md)


## Related content

[Review and remediate the "EDR solution should be installed" recommendations for virtual machines, EC2 instances, and GCP VMs](endpoint-detection-response-solution-recommendations.md).
