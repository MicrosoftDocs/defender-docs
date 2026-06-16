---
title: Manage and monitor your ASR rules deployment
description: Learn how to manage and monitor your attack surface reduction (ASR) rules deployment, including reviewing reports and troubleshooting false positives.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar, yongrhee
ms.custom: asr, msecd-doc-authoring-1012
ms.topic: how-to
ms.collection:
- m365-security
- m365solution-asr-rules
- highpri
- tier1
- mde-asr
ms.date: 05/04/2026
ai-usage: ai-assisted
#customer intent: As an IT admin, I want to manage and monitor my ASR rules deployment so I can respond to false positives and maintain effective threat protection.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Manage and monitor your attack surface reduction (ASR) rules deployment

This article is part of the [Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md).

After you fully deploy attack surface reduction (ASR) rules, you need processes to monitor and respond to ASR rules-related activity. This article describes how to review ASR rule reports and troubleshoot issues as the final step of your ASR rules deployment.

## Keep up with ASR rule reports and data

Any threat protection solution produces some false positives (legitimate files identified as threats) and false negatives (threats that aren't detected). For more information, see [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md).

Consistent, regular review of ASR rule reports and data is important to maintain your deployment and keep up with emerging threats. Schedule reviews of ASR rule events at a frequency that keeps pace with reported events. Depending on the size of your organization, reviews might be hourly, daily, or continuously.

For more information, see [Monitor attack surface reduction (ASR) rule activity](attack-surface-reduction-rules-monitor.md).

<a name='asr-rules-advanced-hunting'></a>

## Troubleshoot ASR rules

To troubleshoot ASR rules, see [Troubleshoot attack surface reduction rules](troubleshoot-asr.md).

## Related content

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Enable your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-implement.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
