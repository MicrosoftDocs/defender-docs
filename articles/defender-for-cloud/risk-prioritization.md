---
title: Risk prioritization
author: Elazark
ms.author: elkrieger
description: Learn how Defender for Cloud prioritizes security recommendations and mitigates risks to protect your environment.
ms.topic: concept-article
ms.date: 07/15/2025
ai-usage: ai-assisted
#customer intent: As a security analyst, I want to understand how Defender for Cloud prioritizes security risks so that I can effectively protect my environment.
---

# Risk prioritization

Microsoft Defender for Cloud proactively utilizes a dynamic engine that assesses the risks in your environment while taking into account the potential for exploitation and the potential business impact to your organization. The engine prioritizes security recommendations based on the risk factors of each resource, which are determined by the context of the environment, including the resource's configuration, network connections, and security posture.

When Defender for Cloud performs a risk assessment of your security issues, the engine identifies the most significant security risks while distinguishing them from less risky issues. The recommendations are then sorted based on their risk level, allowing you to address the security issues that pose immediate threats with the greatest potential of being exploited in your environment.

## Prerequisites

Risk prioritization and governance are supported only with the [Defender CSPM plan](concept-cloud-security-posture-management.md#plan-availability). While recommendations are included with the [Foundational CSPM plan](concept-cloud-security-posture-management.md#plan-availability), risk prioritization features require the enhanced capabilities of Defender CSPM.

If your environment isn't protected by the Defender CSPM plan, the columns with the risk prioritization features appear blurred out in the recommendations interface.

## How to use risk prioritization

To learn how to use risk prioritization effectively in your security operations, including detailed explanations of risk factors, risk calculation methodology, and risk levels, see:

- **For Azure portal users**: [Review security recommendations - Understanding risk prioritization](review-security-recommendations.md?pivots=azure-portal#understanding-risk-prioritization)
- **For Defender portal users**: [Review security recommendations - Understanding risk prioritization in Defender portal](review-security-recommendations.md?pivots=defender-portal#understanding-risk-prioritization-in-defender-portal)

These comprehensive guides include:

- Risk factors and how they influence prioritization
- Risk calculation methodology
- Risk level classifications (Critical, High, Medium, Low, Not evaluated)
- Recommendations dashboard details and filtering options
- Integration with attack path analysis

## Related content

- [Review security recommendations](review-security-recommendations.md)
- [Remediate security recommendations](implement-security-recommendations.md)
- [Manage attack paths](how-to-manage-attack-path.md)
- [Drive remediation with governance rules](governance-rules.md)
- [Automate remediation responses](workflow-automations.md)
