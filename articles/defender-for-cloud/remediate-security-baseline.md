---
title: Remediate security baseline recommendations from Defender Vulnerability Management in Microsoft Defender for Cloud
description: Learn how to assess machines with Defender Vulnerability Management security baselines in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 05/26/2024
# customer intent: As a security admin in Defender for Cloud, I want to remediate recommendations issued by Defender Vulnerability Management security baselines assessment.
---

# Remediate security baseline assessment recommendations

Microsoft Defender for Cloud integrates natively with Microsoft Defender for Endpoint and Microsoft Defender Vulnerability Management to provide machines with vulnerability protection, and endpoint detection and response (EDR) capabilities.

As part of that integration, [security baselines assessment](/defender-vulnerability-management/tvm-security-baselines) is provided by Defender Vulnerability Management. Security baselines assessment uses customised security baseline profiles. Profiles are basically a template that consists of device configuration settings, and benchmarks against which to compare them. 

This article describes how to remediate recommendations made by Defender Vulnerability Management baseline assessments.

## Prerequisites

- [Defender for Servers Plan 2](tutorial-enable-servers-plan.md) must be enabled.
- The Defender for Endpoint agent must be enabled on machines. Autoprovisioning of the agent is turned on by default when you enable the Defender for Servers plan, but if needed, you can [enable the agent manually](enable-defender-for-endpoint.md).
- Machines running these operating systems can be assessment against security baseline profiles:
    - windows_server_2008_r2
    - windows_server_2016
    - windows_server_2019
    - windows_server_2022

## Remediate recommendations

To ensure your servers are protected and secure, remediate all security baselines recommendations.

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


