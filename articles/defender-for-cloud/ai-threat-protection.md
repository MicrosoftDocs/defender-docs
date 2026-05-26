---
title: AI threat protection in Microsoft Defender for Cloud
description: Learn how AI threat protection in Microsoft Defender for Cloud detects and helps you respond to threats targeting generative AI applications and agents.
ms.date: 05/19/2026
ms.topic: overview
ms.author: elkrieger
author: ElazarK
#customer intent: As a cloud security professional, I want to understand how to secure my generative AI resources using Defender for Cloud's AI security posture management capabilities.
---

# AI threat protection in Microsoft Defender for Cloud

Microsoft Defender for Cloud's threat protection for artificial intelligence (AI) services identifies threats to generative AI applications and agents in real time and helps respond to security issues. Defender for Cloud's AI threat protection works with [Azure AI Content Safety Prompt Shields](/azure/ai-services/content-safety/concepts/jailbreak-detection) and Microsoft's threat intelligence to provide security alerts for threats like data leakage, data poisoning, jailbreak, credential theft, and more.

## Defender XDR integration

Threat protection for AI services integrates with [Defender Extended Detection and Response (XDR)](concept-integration-365.md), allowing security teams to centralize AI workload alerts in the Defender XDR portal. Security teams can correlate AI workload alerts and incidents in the Defender XDR portal to understand the full scope of an attack, including malicious activities related to their generative AI applications.

## Availability

The following table summarizes feature availability, pricing, and support requirements for AI threat protection.

| Aspect | Details |
| --- | --- |
| Release state | Generally available (GA) |
| Feature availability | Activity monitoring (security alerts)<br>Prompt evidence (security alerts) |
| Pricing | Defender for AI Services billing is shown on the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md). Defender for AI Services includes a 30-day free trial, capped at 75 billion tokens scanned. Billing begins if the cap is reached within the 30-day period. |
| Supported AI services | [Azure OpenAI supported models](/azure/ai-services/openai/overview)<br>[Azure AI Model Inference service supported models](/azure/ai-studio/ai-services/model-inference)<br>Defender for Cloud currently supports text tokens only. Image and audio tokens aren't scanned. |
| Required roles and permissions | To enable threat detection at subscription level, you need the Owner role at subscription scope or specific roles with corresponding data actions. |
| Clouds | Commercial clouds: Yes<br>Azure Government: No<br>Microsoft Azure operated by 21Vianet: No<br>Connected AWS accounts: No |

## Related content

- [Enable threat protection for AI services](ai-onboarding.md)
- [Alerts for AI services](alerts-ai-workloads.md)
