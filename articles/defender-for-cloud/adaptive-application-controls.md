---
title: Understand adaptive application controls
description: This document helps you use adaptive application control in Microsoft Defender for Cloud to create an allowlist of applications running for Azure machines.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 01/22/2024
---

# Overview - Adaptive application controls

Defender for Servers Plan 2 in Microsoft Defender for Cloud provides adaptive application controls that enhance your security a data-driven, intelligent automated solution that defines allowlists of known-safe applications for your machines.

Often, organizations have collections of machines that routinely run the same processes. Defender for Servers uses machine learning to analyze the applications running on your machines and create a list of the known-safe software. Allowlists are based on your specific Azure workloads, and you can further customize the recommendations using the following instructions.

When you enable and configure adaptive application controls, you get security alerts if any application runs other than the ones you defined as safe.

> [!Note]
> - Adaptive application controls in general availability (GA) uses the Log Analytics agent. (also known as the Microsoft Monitoring Agent (MMA)).The MMA is set to retire in August 2024.
> -  Adaptive application controls is also available in preview using the Azure Monitoring Agent (AMA).
> - The adaptive application controls features, using either the AMA or MMA, will be deprecated in August 2024.

## Benefits

By defining lists of known-safe applications, and generating alerts when anything else is executed, you can achieve multiple oversight and compliance goals:

- Identify potential malware, even any that antimalware solutions can miss
- Improve compliance with local security policies that dictate the use of only licensed software
- Identify outdated or unsupported versions of applications
- Identify software your organization banned but is nevertheless running on your machines
- Increase oversight of apps that access sensitive data

No enforcement options are currently available. Adaptive application controls are intended to provide security alerts if any application runs other than the ones you define as safe.



## Next steps

[Enable adaptive application controls](enable-adaptive-application-controls.md)
