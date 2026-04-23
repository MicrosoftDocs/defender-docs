---
title: Manage and monitor attack surface reduction rules
description: Provides guidance to operationalize your attack surface reduction rules deployment.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: limwainstein
ms.author: lwainstein
ms.reviewer: sugamar, yongrhee
ms.custom: asr
ms.topic: article
ms.collection:
- m365-security
- m365solution-asr-rules
- highpri
- tier1
- mde-asr
ms.date: 04/22/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Manage and monitor attack surface reduction rules

This article is part of the [Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md).

After you fully deployed attack surface reduction (ASR) rules, it's vital that you have processes in place to monitor and respond to ASR-related activities. The article describes the tools and methods you use to monitor ASR rules.

## Managing ASR rules false positives

False positives/negatives can occur with any threat protection solution. False positives are cases in which an entity (such as a file or process) is detected and identified as malicious, although the entity isn't actually a threat. In contrast, a false negative is an entity that wasn't detected as a threat but is malicious. For more information about false positives and false negatives, see: [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md)

## Keeping up with ASR rules reports

Consistent, regular review of reports is important to maintain your ASR rules deployment and keeping up with emerging threats. Schedule reviews of ASR rule events using a frequency that keeps up with ASR rule-reported events. Depending on the size of your organization, your reviews might be daily, hourly, or require continuous monitoring.

For complete information about the ASR rules report, see [Attack surface reduction rules report](attack-surface-reduction-rules-report.md).

<a name='asr-rules-advanced-hunting'></a>

## ASR rules Advanced Hunting

Use advanced hunting in the Microsoft Defender portal to query ASR rule events across your environment. For detailed information and sample queries, see [ASR rule events in Advanced Hunting](attack-surface-reduction-rules-monitor.md#asr-rule-events-in-advanced-hunting).

<a name="microsoft-defender-for-endpoint-machine-timeline"></a>

## ASR events in the device timeline

Use the device timeline to view ASR rule events on individual devices. For detailed steps, see [ASR events in the device timeline](attack-surface-reduction-rules-monitor.md#asr-events-in-the-device-timeline).

<a name="how-to-troubleshoot-attack-surface-reduction-rules"></a>

## Troubleshoot ASR rules

To troubleshoot ASR rules, see [Troubleshoot attack surface reduction rules](troubleshoot-asr.md).

## Articles in this deployment collection

[Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)

[Plan attack surface reduction rules deployment](attack-surface-reduction-rules-deployment-plan.md)

[Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)

[Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)
