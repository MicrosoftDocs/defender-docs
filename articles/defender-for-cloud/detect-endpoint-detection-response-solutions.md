---
title: Detecting endpoint detection and response solution in Microsoft Defender for Cloud
description: Learn about detection for endpoint detection and response solutions in Microsoft Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/18/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how Microsoft Defender for Cloud can help me to protect enterprise endpoints, improve endpoint posture, and respond to security threats.
---

# Detecting endpoint detection and response solutions

Microsoft Defender for Cloud includes endpoint detection and response (EDR) capabilities to improve security posture for supported machines. Defender for Cloud:

- Detects whether machines are connected to a supported EDR solution.
- [Integrates natively with Microsoft Defender for Endpoint as an EDR solution](integration-defender-for-endpoint.md).


## Checking for an EDR solution

Defender for Cloud uses [agentless scanning](concept-agentless-data-collection.md) to assess whether Azure VMs and AWS/GCP machines are connected to an EDR solution. 

Agentless scanning for EDR solution settings is available when Defender for Cloud is running in your Azure subscription and either [Defender for Servers Plan 2](tutorial-enable-servers-plan.md) or the [Defender Cloud Security Posture Management (CSPM) plan](tutorial-enable-cspm-plan.md) is enabled. 

Based on EDR solution findings, Defender for Cloud provides the following recommendations to help you identify and remediate machines that don't have an EDR solution running. EDR solution recommendations are as follows:

- `EDR solution should be installed on Virtual Machines`
- `EDR solution should be installed on EC2s`
- `EDR solution should be installed on Virtual Machines (GCP)`


## Supported EDR solutions

**Solution** | **Supported platform**
--- | ---
Microsoft Defender for Endpoint | Windows 
Microsoft Defender for Endpoint | Linux
Microsoft Defender for Endpoint Unified SolutioWindon | Windows Server 2012/2012 R2
CrowdStrike (Falcon) | Windows and Linux
Trellix	| Windows and Linux
Symantec | Windows and Linux
Sophos | Windows and Linux
Singularity Platform by SentinelOne	| Windows and Linux
Cortex XDR | Windows and Linux


## Next steps

[Review and remediate EDR solution recommendations](endpoint-detection-response-solution-recommendations.md).
