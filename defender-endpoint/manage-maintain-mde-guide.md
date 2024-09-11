---
title: Manage behavior safely in your organization with exclusions, indicators, and other techniques
description: Manage behavior safely in your organization with exclusions, indicators, and other techniques
keywords: mde safe deployment practices
author: siosulli
ms.author: siosulli
manager: deniseb
ms.date: 08/19/2024
ms.topic: conceptual
ms.service: mde
ms.subservice: fundamentals
ms.localizationpriority: high
ms.custom: get-started
ms.collection:
- tier1
- highpri
---

# Manage behavior safely in your organization with exclusions, indicators, and other techniques

This article will help you better understand: 

- Microsoft's safe deployment practices for Defender for Endpoint: Microsoft follows safe deployment practices that minimize the risk of updates having an unexpected impact.
- Recommended additional safe deployment practices customers can put in place: For example, configuring gradual rollout controls.
- Defender for Endpoint capabilities that will help you safeguard and manage your environment and maintain productivity.

## Enable/disable capabilities to keep you organization secure and operational

✅ **Task: Configure Antivirus (AV) and malware protection**

✅ **Task: Configure baseline policies**

✅ **Task: Manage behavior with exclusions, indicators, and other techniques**

Defender for Endpoint allow customers to be safe from threats while remaining productive but occasionally, unwanted behaviors may occur. Sometimes files, folders, or processes that aren't actually a threat can be detected as malicious by Defender for Endpoint or Microsoft Defender Antivirus. These entities can be blocked or sent to quarantine, even though they're not really a threat.

The process for addressing an unwanted behavior is to firstly identify what is causing the unwanted behavior, for example, Defender Antivirus, ASR Rules, Controlled Folder Access. This can be done:

- In the portal, using data and tools availble such as alerts, reports and advanced hunting.
- From the device, using performance analyzer tools, events, and protection history.

When you identify the capability causing the issue you can take action to exclude/trust that process or file. This might include actions such as adding exclusions, creating indicators, alert suppression, custom remediation, or submitting a file to Microsoft.

The following tables describes the different ways unexpected behavior can present in your organzation and provides a link to where you can learn more about identifying, investigating and remediating the behaviors:

|Behavior |Description|Get started|
|:----------|:------------|:--------|
|**False Positives** |MDE misidentifying a file or process as malicious| [Address false positives with exceptions](exceptions-false-positives.md)|
|**Poor performance** |Applications experience performance issues when features of MDE are enabled |[Manage performance issues with exceptions ](./exceptions-performance-issues.md) |
|**Application Incompatibility** |Applications don’t function properly when features of MDE are enabled |[Manage application compatibility issues with exceptions](./exceptions-app-compatibility.md)|

## Troubleshooting guidance

## Next Steps

- [Security operations guide](mde-sec-ops-guide.md)