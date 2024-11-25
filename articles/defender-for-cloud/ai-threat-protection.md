---
title: Overview - AI threat protection
description: Learn about AI threat protection in Microsoft Defender for Cloud and how it protects your resources from AI threats.
ms.date: 11/25/2024
ms.topic: overview
ms.author: elkrieger
author: Elazark
#customer intent: As a cloud security professional, I want to understand how to secure my generative AI resources using Defender for Cloud's AI security posture management capabilities.
---

# Overview - AI threat protection

Microsoft Defender for Cloud's threat protection for AI workloads identifies threats to generative AI applications in real time and helps respond to security issues.

> [!IMPORTANT]
> Threat protection for AI workloads is currently in preview.
> See the [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) for legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

Defender for Cloud's AI threat protection works with [Azure AI Content Safety Prompt Shields](/azure/ai-services/content-safety/concepts/jailbreak-detection) and Microsoft's threat intelligence to provide security alerts for threats like data leakage, data poisoning, jailbreak, and credential theft

:::image type="content" source="media/ai-threat-protection/threat-protection-ai.png" alt-text="Diagram that shows how enabling, detection, and response works for threat protection." lightbox="media/ai-threat-protection/threat-protection-ai.png":::

## Defender XDR integration

Threat protection for AI workloads integrates with the [Defender XDR](concept-integration-365.md), allowing security teams to centralize AI workload alerts in the Defender XDR portal.

Security teams can correlate AI workload alerts and incidents in the Defender XDR portal to understand the full scope of an attack, including malicious activities related to their generative AI applications.

## Signing up for the limited public preview

To use threat protection for AI workloads, you must enroll in the limited public preview program by filling out the [registration form](https://aka.ms/D4AI/PublicPreviewAccess).

## Availability

|Aspect|Details|
|----|:----|
|Release state:| Limited preview (PP)|
|Feature availability:|- Activity monitoring (security alerts) – Preview (PP) <br>- Prompt evidence (security alerts) – Preview (PP) |
|Pricing:|N/A|
|Supported AI services:|[Azure OpenAI supported models](https://learn.microsoft.com/azure/ai-services/openai/overview) <br>[Azure AI Model Inference service supported models](https://learn.microsoft.com/azure/ai-studio/ai-services/model-inference) |
|Required roles and permissions:|To enable threat detection at subscription level, you need Owner roles (subscription owner) or specific roles with corresponding data actions.|
|Clouds:|:::image type="icon" source="../defender-for-cloud/media/icons/yes-icon.png"::: Commercial clouds <br>:::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: Azure Government <br>:::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: Microsoft Azure operated by 21Vianet <br>:::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: Connected AWS accounts|

## Related content

- [Enable threat protection for AI workloads (preview)](ai-onboarding.md).
- [Alerts for AI workloads](alerts-ai-workloads.md)
