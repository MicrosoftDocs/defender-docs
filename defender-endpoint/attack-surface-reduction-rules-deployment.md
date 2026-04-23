---
title: Microsoft Defender for Endpoint attack surface reduction rules deployment overview
description: Provides overview and prerequisite guidance about deploying Microsoft Defender for Endpoint attack surface reduction rules. Links to articles that show how to plan and ASR deployment, test ASR rules, configure ASR rules, and enable ASR rules.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: asr
ms.topic: concept-article
ms.collection:
 - m365-security
 - m365solution-asr-rules
 - highpri
 - tier1
 - mde-asr
ms.date: 04/22/2026
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Attack surface reduction rules deployment overview

Attack surface reduction (ASR) rules are a key component of reducing the attack surface of your organization. For an introduction to ASR rules and their requirements, see [Attack surface reduction rules overview](attack-surface-reduction-rules-overview.md).

This guide helps you plan, test, implement, and manage your ASR rules deployment to effectively stop advanced threats like human-operated ransomware.

> [!IMPORTANT]
> This guide provides images and examples to help you decide how to configure ASR rules. These images and examples might not reflect the best configuration options for your environment.

:::image type="content" source="media/asr-rules-deployment-phases.png" alt-text="Plan Microsoft Defender for Endpoint attack surface reduction rules, test attack surface reduction rules, Enable attack surface reduction rules, maintain attack surface reduction rules." lightbox="media/asr-rules-deployment-phases.png":::

## Important predeployment caveat

There are three ASR rules that we classify as _standard protection rules_. Typically, you can enable these three rules without extensive testing, with minimal-to-no noticeable impact on users, and with great security benefit. For more information, see [Attack surface reduction rules](attack-surface-reduction-rules-overview.md#attack-surface-reduction-rules).

## Before you begin

Before you start the deployment process, review the following documentation:

- [Overview of attack surface reduction](attack-surface-reduction-overview.md)
- [Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)

## Deployment steps

Use the following articles to plan, test, implement, and manage your ASR rules deployment:

1. [Plan ASR rules deployment](attack-surface-reduction-rules-deployment-plan.md): Determine infrastructure requirements, select business units and champions, and define team roles.
1. [Test ASR rules](attack-surface-reduction-rules-deployment-test.md): Configure rules in **Audit** mode, review reports, and add exclusions.
1. [Enable ASR rules](attack-surface-reduction-rules-deployment-implement.md): Transition rules from **Audit** to **Block** mode, and expand to additional deployment rings.
1. [Manage and monitor ASR rules](attack-surface-reduction-rules-deployment-operationalize.md): Monitor ongoing activity, manage false positives, and use advanced hunting.

## See also

- [Attack surface reduction rules overview](attack-surface-reduction-rules-overview.md)
- [Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)
- [Enable attack surface reduction rules](attack-surface-reduction-rules-enable.md)
- [Attack surface reduction rules report](attack-surface-reduction-rules-report.md)
- [Attack surface reduction FAQ](attack-surface-reduction-faq.yml)
- [Demystifying attack surface reduction rules - Part 1](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-1/ba-p/1306420)
- [Demystifying attack surface reduction rules - Part 2](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-2/ba-p/1326565)
- [Demystifying attack surface reduction rules - Part 3](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-3/ba-p/1360968)
- [Demystifying attack surface reduction rules - Part 4](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-4/ba-p/1384425)
