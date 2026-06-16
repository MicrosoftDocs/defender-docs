---
title: Enable your ASR rules deployment
description: Learn how to enable attack surface reduction (ASR) rules by transitioning from Audit to Block mode and expanding to other deployment rings.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: asr, msecd-doc-authoring-1012
ms.topic: how-to
ms.collection:
 - m365-security
 - m365solution-asr-rules
 - highpri
 - tier1
 - mde-asr
ms.date: 05/04/2026
search.appverid: met150
ai-usage: ai-assisted
#customer intent: As an IT admin, I want to enable ASR rules in Block mode after testing in Audit mode so I can protect my organization from attack surface reduction threats.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Enable your attack surface reduction (ASR) rules deployment

This article is part of the [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md).

After testing ASR rules in Audit mode, transition them to **Block** or **Warn** mode, starting with your first deployment ring.

> :::image type="content" source="media/asr-rules-implementation-steps.png" alt-text="Diagram of the steps to implement ASR rules: transition from Audit to Block mode, then expand to additional rings." lightbox="media/asr-rules-implementation-steps.png":::

## Step 1: Transition ASR from Audit to Block

1. After you determine all required exclusions for rules in **Audit** mode, start setting some rules to **Block** or **Warn** mode. Start with the rule with the fewest triggered events. For instructions, see [Configure attack surface reduction (ASR) rules and exclusions](attack-surface-reduction-rules-configure.md).

1. Review [ASR rule activity](attack-surface-reduction-rules-monitor.md). Also review feedback from your champions.

1. Refine exclusions or create new exclusions as necessary.

> [!TIP]
> Rule exclusions are better than turning off rules or switching them back to **Audit** mode.
>
> Take advantage of the **Warn** mode in available rules to limit disruptions. **Warn** mode enables you to capture triggered events and view potential disruptions without actually blocking user access (they can click through the warning notification). For more information, see [ASR rule modes](attack-surface-reduction-rules-overview.md#modes-for-asr-rules).

## Step 2: Expand deployment to ring n + 1

When you're confident you correctly configured ASR rules for ring 1, you can widen the scope of your deployment to the next ring (ring n + 1).

The deployment process for each subsequent ring is:

1. Enable ASR rules in **Audit** mode.

1. Review [ASR rule activity](attack-surface-reduction-rules-monitor.md).

1. [Create exclusions as necessary](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

1. Review ASR rule activity and refine exclusions.

1. Set rules to **Block** mode.

1. Review [ASR rule activity](attack-surface-reduction-rules-monitor.md).

1. [Create exclusions as necessary](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

1. Disable problematic rules or switch them back to **Audit** mode.

## Related content

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md)
- [Configure attack surface reduction (ASR) rules and exclusions](attack-surface-reduction-rules-configure.md)