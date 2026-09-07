---
title: Opt in to Foundational CSPM
description: Learn about the opt-in model for Foundational CSPM for new Azure subscriptions and choose how to manage your Azure security posture.
ms.topic: concept-article
ms.date: 7/30/2026
ai-usage: ai-assisted
---

# Opt in to Foundational CSPM

Starting October 27, 2026, Foundational CSPM will move to an opt-in model for new Azure subscriptions and will no longer be enabled by default.

This change gives you more control over how security posture management is configured for each new Azure subscription and is part of the transition of cloud security posture management to the Microsoft Defender portal.

Foundational CSPM will continue to be available at no cost and can be enabled at any time based on your organization's needs.

> [!IMPORTANT]
> This change applies only to new Azure subscriptions. Existing subscriptions that already have Foundational CSPM enabled will remain enabled unless you turn off the plan.

## What is Foundational CSPM?

Foundational CSPM is a free cloud security posture management plan in Microsoft Defender for Cloud. It helps you assess the security posture of your cloud resources by providing foundational capabilities, including security recommendations and Secure Score. These capabilities help you identify risks and prioritize remediation.

To learn more, see [What is Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md).

## What's changing?

Starting October 27, 2026, the default behavior for new Azure subscriptions will change:

- New Azure subscriptions will start with Foundational CSPM turned off.
- To use Foundational CSPM on a new Azure subscription, you must enable the plan for that subscription.

## What stays the same?

- Foundational CSPM remains available at no cost.
- Existing Azure subscriptions keep their current Foundational CSPM configuration.
- AWS and GCP environments aren't affected. Foundational CSPM remains enabled by default when those environments are onboarded.
- When enabled, Foundational CSPM continues to provide its existing posture-management capabilities, including security recommendations and Secure Score.

## Choose how to manage your Azure security posture

The move to an opt-in model for Foundational CSPM is part of Microsoft's broader transition of cloud security posture management to the Microsoft Defender portal. To learn more about the new management experience, see [Overview of Defender for Cloud in Defender portal](defender-portal/defender-for-cloud-defender-portal.md).

Starting October 27, 2026, the Microsoft Defender portal will become the recommended experience for managing Azure security posture. It provides a unified security experience alongside other Microsoft Security solutions and introduces advanced posture-management capabilities that help security teams manage posture across onboarded environments at scale.

In the Microsoft Defender portal, you can centrally manage Defender plans, Azure posture policies, and security recommendations.

Choose the management experience that best fits your organization:

| Option | What to do |
|---|---|
| **Recommended: Microsoft Defender portal** | Onboard your Azure environment to Microsoft Defender.<br><br>[Overview of Defender for Cloud in Defender portal](defender-portal/defender-for-cloud-defender-portal.md).<br><br>Manage your Azure posture policies and security recommendations in the Microsoft Defender portal. |
| **Continue managing plans in the Azure portal** | [Enable Foundational CSPM or another Defender plan in the Azure portal](connect-azure-subscription.md).<br><br>Continue managing your Azure security posture in the Azure portal. |

More information about the transition to the Microsoft Defender portal will be published closer to the transition date.

## Learn more

- [What is Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md)
- [Overview of Defender for Cloud in Defender portal](defender-portal/defender-for-cloud-defender-portal.md)