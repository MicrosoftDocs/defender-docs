---
title: Manage and monitor your ASR rules deployment
description: Provides guidance to operationalize your attack surface reduction rules deployment.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
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

# Manage and monitor your attack surface reduction (ASR) rules deployment

This article is part of the [Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md).

After you fully deploy attack surface reduction (ASR) rules, it's vital that you have processes in place to monitor and respond to ASR-related activity. The article describes the methods you use to monitor ASR rules as the last part of your ASR rules deployment.

## Keep up with ASR rule reports and data

False positives (good files identified as bad) and false negatives (bad files not detected) occur to one degree or another with any threat protection solution. For more information about false positives and false negatives, see: [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md).

Consistent, regular review of ASR rule reports and data is important to maintain your deployment and keep up with emerging threats. Schedule reviews of ASR rule events using a frequency that keeps up with ASR rule-reported events. Depending on the size of your organization, your reviews might be daily, hourly, or require continuous monitoring.

For more information, see [Monitor attack surface reduction (ASR) rule activity](attack-surface-reduction-rules-monitor.md).

<a name='asr-rules-advanced-hunting'></a>

## Troubleshoot ASR rules

To troubleshoot ASR rules, see [Troubleshoot attack surface reduction rules](troubleshoot-asr.md).

## See also

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Enable your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-implement.md)

[Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
