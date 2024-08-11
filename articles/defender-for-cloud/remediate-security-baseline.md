---
title: Remediate security baseline recommendations powered by MDVM
description: Learn how to secure your servers with security baselines in Microsoft Defender for Cloud powered by Microsoft Defender Vulnerability Management.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 05/26/2024
# customer intent: As a user, I want to learn how to secure my servers with security baselines in Microsoft Defender for Cloud powered by Microsoft Defender Vulnerability Management.
---

# Remediate security baseline assessment recommendations

The Defender for Server Plan 2 in Microsoft Defender for Cloud can assess machine security posture against a security baseline profile made up of security benchmarks. Security baselines assessment is provided by the integration of Microsoft Defender Vulnerability Management with Defender for Servers Plan 2. [Learn more](/defender/defender-vulnerability-management/tvm-security-baselines) about security baselines assessment.

The security benchmarks in security baseline profiles are comprehensive, and continuously updated. Each assessment rule is accompanied with information about the effect of the issue, a description of the problem, and detailed recommendation steps. Checks are integrated into the Microsoft Defender for Endpoint agent, which allows Defender for Cloud to provide extra security checks within the same agent.

## Prerequisites

- [Enable Defender for Servers Plan 2](tutorial-enable-servers-plan.md).

- The Defender for Endpoint agent must be enabled on machines. Autoprovisioning of the agent is turned on by default when you enable the Defender for Servers plan, but if needed, you can [enable the agent manually](enable-defender-for-endpoint.md).
- The following operating systems are supported for assessment:
    - windows_server_2008_r2
    - windows_server_2016
    - windows_server_2019
    - windows_server_2022

## Remediate recommendations

To ensure your servers are protected and secure, you should remediate all security baselines recommendations.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select **Machine should be configured securely (powered by MDVM)**.

1. Select **View recommendation for all resources**.

    :::image type="content" source="media/remediate-security-baseline/view-all-resources.png" alt-text="Screenshot that shows where the view recommendation for all resources is located in the recommendation." lightbox="media/remediate-security-baseline/view-all-resources.png":::

1. Select one of the affected unhealthy resources.

1. Select a security check.

1. Follow the remediation step.

    :::image type="content" source="media/remediate-security-baseline/remediation-steps.png" alt-text="Screenshot that shows where the remediation steps are located." lightbox="media/remediate-security-baseline/remediation-steps.png"::: 

1. Repeat the process for all affected resources.


