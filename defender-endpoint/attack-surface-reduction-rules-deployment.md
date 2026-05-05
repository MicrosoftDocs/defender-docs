---
title: ASR rules deployment guide
description: Plan, test, and deploy attack surface reduction (ASR) rules in Microsoft Defender for Endpoint to block risky software behavior and protect against advanced threats.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: asr, msecd-doc-authoring-1012
ms.topic: concept-article
ms.collection:
 - m365-security
 - m365solution-asr-rules
 - highpri
 - tier1
 - mde-asr
ms.date: 05/04/2026
ai-usage: ai-assisted
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

#customer intent: As a security administrator, I want to plan and deploy ASR rules across my organization so that I can block advanced threats like human-operated ransomware.

# Attack surface reduction (ASR) rules deployment guide

Attack surface reduction (ASR) rules target risky software behavior on Windows devices that attackers commonly exploit through malware (for example, launching scripts that download files, running obfuscated scripts, and injecting code into other processes). For an introduction to ASR rules and their requirements, see [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md).

This guide helps you plan, test, implement, and manage your ASR rules deployment to effectively stop advanced threats like human-operated ransomware.

> [!IMPORTANT]
> This guide provides images and examples to help you decide how to configure ASR rules. These images and examples might not reflect the best configuration options for your environment.

:::image type="content" source="media/asr-rules-deployment-phases.png" alt-text="Diagram of the ASR rules deployment phases: plan, test, enable, and maintain." lightbox="media/asr-rules-deployment-phases.png":::

## Important predeployment caveat

Typically, you can enable the [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) in **Block** or **Warn** mode without testing. You should test other ASR rules in **Audit** mode before you switch them to **Block** or **Warn** mode.

## Before you begin

Before you start the deployment process, review the following documentation:

- [Overview of attack surface reduction](attack-surface-reduction-overview.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)

## Deployment steps

Use the following articles to plan, test, implement, and manage your ASR rules deployment:

1. [Plan ASR rules deployment](attack-surface-reduction-rules-deployment-plan.md): Determine infrastructure requirements, select business units and champions, and define team roles.
1. [Test ASR rules](attack-surface-reduction-rules-deployment-test.md): Configure rules in **Audit** mode, review reports, and add exclusions.
1. [Enable ASR rules](attack-surface-reduction-rules-deployment-implement.md): Transition rules from **Audit** to **Block** mode, and expand to additional deployment rings.
1. [Manage and monitor ASR rules](attack-surface-reduction-rules-deployment-operationalize.md): Monitor ongoing activity, manage false positives, and use advanced hunting.

## Related content

- [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
- [Configure attack surface reduction (ASR) rules and exclusions](attack-surface-reduction-rules-configure.md)
- [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md)
- [Attack surface reduction FAQ](attack-surface-reduction-faq.yml)
- [Demystifying attack surface reduction rules - Part 1](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-1/ba-p/1306420)
- [Demystifying attack surface reduction rules - Part 2](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-2/ba-p/1326565)
- [Demystifying attack surface reduction rules - Part 3](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-3/ba-p/1360968)
- [Demystifying attack surface reduction rules - Part 4](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-4/ba-p/1384425)
