---
title: Overview - AI threat protection
description: Learn about AI threat protection in Microsoft Defender for Cloud and how it protects your resources from AI threats.
ms.date: 05/01/2025
ms.topic: overview
ms.author: elkrieger
author: Elazark
#customer intent: As a cloud security professional, I want to understand how to secure my generative AI resources using Defender for Cloud's AI security posture management capabilities.
---

# Overview - AI threat protection

Microsoft Defender for Cloud's threat protection for AI services identifies threats to generative AI applications in real time and helps respond to security issues.

Defender for Cloud's AI threat protection works with [Azure AI Content Safety Prompt Shields](/azure/ai-services/content-safety/concepts/jailbreak-detection) and Microsoft's threat intelligence to provide security alerts for threats like data leakage, data poisoning, jailbreak, and credential theft.

:::image type="content" source="media/ai-threat-protection/threat-protection-ai.png" alt-text="Diagram that shows how enabling, detection, and response works for threat protection." lightbox="media/ai-threat-protection/threat-protection-ai.png":::

## Defender XDR integration

Threat protection for AI services integrates with the [Defender XDR](concept-integration-365.md), allowing security teams to centralize AI workload alerts in the Defender XDR portal.

Security teams can correlate AI workload alerts and incidents in the Defender XDR portal to understand the full scope of an attack, including malicious activities related to their generative AI applications.

## Availability

|Aspect|Details|
|----|:----|
|Release state:| General availability (GA)|
|Feature availability:|- Activity monitoring (security alerts) <br>- Prompt evidence (security alerts) |
|Pricing:|Defender for AI Services is billed as shown on the [pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/)|
|Supported AI services:| [Azure OpenAI supported models](/azure/ai-services/openai/overview) <br> [Azure AI Model Inference service supported models](/azure/ai-studio/ai-services/model-inference) <br> **Defender for cloud supports text tokens only at this phase (image and audio tokens aren't scanned) |
|Required roles and permissions:|To enable threat detection at subscription level, you need Owner roles (subscription owner) or specific roles with corresponding data actions.|
|Clouds:|:::image type="icon" source="../defender-for-cloud/media/icons/yes-icon.png"::: Commercial clouds <br>:::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: Azure Government <br>:::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: Microsoft Azure operated by 21Vianet <br>:::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: Connected AWS accounts|

## Related content

- [Enable threat protection for AI services](ai-onboarding.md).
- [Alerts for AI services](alerts-ai-workloads.md)
