---
title: Review security recommendations in Microsoft Security Exposure Management
description: Learn how to review security recommendations in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 03/06/2024
---

# Review security recommendations

This article describes how to work with security recommendations in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md).

## Prerequisites

Read about the [recommendations catalog](exposure-insights-overview.md#security-recommendations) beofre you start.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Review recommendations

1. Select **Exposure management -> Exposure insights -> Recommendations**.

    :::image type="content" source="./media/recommendations-navigation.png" alt-text="Screenshot of the recommendations window." lightbox="./media/recommendations-navigation.png":::

1. Sort the recommendations by any of the headings or filter them based on your task needs. Sorting includes all of the headers which are:
    - **Name**
    - **Compliance state** - Compliant or not compliant.
    - **Impact** - High, low, or medium impact.
    - **Last calculated** - Last time the recommendation was calculated.
    - **Last state change** - Last time the recommendation state changed.
    - **Related initiatives** - The number of related initiatives.
    - **Related metrics** - The number of related metrics.
    - **Source** - The assessment standard source.
    - **Workload** - Which workload the recommendations relate to.
    - **Domain** - Device, apps, data, or identity

1. Filter recommendations by state, source, impact, workload, and domain.

1. Select a recommendation to view and review details.

You can also review recommendations on the **Recommendations** tab in an specific security initiative page in **Initiatives** to access [Microsoft Exposure Recommendations](https://security.microsoft.com/exposure-recommendations) in the [Microsoft Defender portal](https://security.microsoft.com/).

## Remediate recommendations

1. To remediate a recommendation select a specific recommendation and browse to the **Remediation steps** tab.

1. Review the remediation steps and select **Manage** to follow the steps in the originating workload, such as Microsoft Defender for Cloud or Microsoft Defender Vulnerability Management.

## Next steps

- Review other ways to [improve security insights with exposure insights](exposure-insights-overview.md)
- Learn how to [Explore security events](security-events.md)
- [Investigate initiative metrics](security-metrics.md)
