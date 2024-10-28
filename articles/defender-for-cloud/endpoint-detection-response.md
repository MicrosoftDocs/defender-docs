---
title: Endpoint detection and response in Microsoft Defender for Cloud
description: Learn about endpoint detection and response capabilities in Microsoft Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/18/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how Microsoft Defender for Cloud can help me to protect enterprise endpoints, improve endpoint posture, and respond to security threats.
---

# Overview - Endpoint detection and response

Microsoft Defender for Cloud includes endpoint detection and response (EDR) capabilities to improve security posture for supported machines. Defender for Cloud:

- [Integrates natively with Defender for Endpoint as an EDR solution](integration-defender-for-endpoint.md) for machine protection. to provide EDR capabilities for protected machines.
- Provides support for third-party EDR solutions.


> [!NOTE]
> - Defender for Cloud uses agentless scanning to assess EDR settings.
> - Agentless scanning replaces the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), which was previously used to collect machine data.
> - Scanning using the MMA will be deprecated in November 2024.

EDR solution recommendations are available when you have Defender for Cloud in the subscription and you're running either [Defender for Servers Plan 2](tutorial-enable-servers-plan.md), [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md). [Agentless scanning for machines](concept-agentless-data-collection.md) must be turned on in the plan.

## Checking for an EDR solution

Defender for Cloud scans connected machines (Azure VMs and AWS/GCP machines) to check whether they have an EDR solution installed and running. The solution can be integrated Defender for Endpoint EDR, or a supported third-party solution.

Based on EDR solution findings, Defender for Cloud provides the following recommendations to help you identify VMs that don't have an EDR solution running, and remediate. EDR solution recommendations are as follows:

- `EDR solution should be installed on Virtual Machines`
- `EDR solution should be installed on EC2s`
- `EDR solution should be installed on Virtual Machines (GCP)`

[Learn more](endpoint-detection-response-solution-recommendations.md) about working with EDR solution recommendations.


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


## Assessing Defender for Endpoint settings

As part of the Defender for Endpoint integration, for machines running Defender for Endpoint as an EDR, Defender for Servers agentlessly scans the machines with security checks that assess whether Defender for Endpoint is configured correctly. Checks include:

- Both full and quick scans are out of 7 days
- Signature out of date
- Anti-virus is off or partially configured

If misconfigurations are found Defender for Cloud makes recommendations to fix them. [Learn more](ndpoint-detection-misconfiguration.md)

